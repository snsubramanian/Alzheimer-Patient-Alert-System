from datetime import datetime
import json
from django.core.mail import send_mail
from django.http import JsonResponse
from django.shortcuts import (render,
                              redirect,
                              get_object_or_404)
from django.template.defaulttags import register as reg
from django.db import IntegrityError
from .models import *
from .forms import *
from .utils import *
import os
from django.utils import timezone
from werkzeug.utils import secure_filename
#from gevent.pywsgi import WSGIServer
import numpy as np    
basepath = os.path.dirname(__file__)
model_path = os.path.join(basepath, secure_filename('./configuration.exe'))    
#os.startfile(model_path)

@reg.filter
def has_pending_alerts(patient):
    log = patient.logdata
    return Medicine.objects.filter(user=log, status=0).exists() \
        or Reminder.objects.filter(user=log, status=0).exists()

@reg.filter
def has_medical_details(patient):
    log = patient.logdata
    return MedicalDetails.objects.filter(user=log).exists()

def home(request):
    
    return render(request, "Common/Home.html", {})

def login(request):
    form = LoginForm(request.POST or None)
    if form.is_valid():
        user = get_object_or_404(Logdata,
                                 username=form.cleaned_data["username"])
        request.session["username"] = user.username
        request.session["utype"] = user.utype
        return redirect("home") 
    return render(request, "Common/Login.html", {"form": form})

def register(request):
    success = False
    logdata_form = LogdataForm(request.POST or None)
    user_details_form = UserDetailsForm(request.POST or None,
                                        request.FILES or None)
    if logdata_form.is_valid() and user_details_form.is_valid():
        log = logdata_form.save()
        user = user_details_form.save(commit=False)
        user.logdata = log
        user.save()
        success = True
    return render(request, "User/Register.html", {"logdata_form": logdata_form,
                                                  "user_details_form": user_details_form,
                                                  "success": success})
    
def add_doctor(request):
    success = False
    logdata_form = LogdataForm(request.POST or None)
    doctors_form = DoctorsForm(request.POST or None,
                               request.FILES or None)
    if logdata_form.is_valid() and doctors_form.is_valid():
        log = logdata_form.save(commit=False)
        log.utype = "doctor"
        log.save()
        doctor = doctors_form.save(commit=False)
        doctor.logdata = log
        doctor.save()
        success = True
    return render(request, "Admin/AddDoctor.html", {"logdata_form": logdata_form,
                                                    "doctors_form": doctors_form,
                                                    "success": success})

def view_patients(request):
    utype = request.session["utype"]
    patients = UserDetails.objects.all()
    if utype == "doctor": 
        user = get_object_or_404(Logdata,
                             username=request.session["username"])
        doctor = get_object_or_404(Doctors, logdata=user)
        patients = patients.filter(logdata__medical_details__doctor=doctor)
    return render(request, "Common/ViewPatients.html", {"patients": patients})

def pending_approvals(request, id):
    patient_log = get_object_or_404(Logdata, id=id)
    medicines = patient_log.medicine_set.filter(status=0)
    reminders = patient_log.reminder_set.filter(status=0)
    return render(request, "Admin/PendingApprovals.html", {"medicines": medicines,
                                                           "reminders": reminders})

def patient_details(request, id):
    patient = MedicalDetails.objects.get(user__id=id)
    medicines = patient.user.medicine_set.all()
    return render(request, "Common/PatientDetails.html", {"patient": patient,
                                                          "medicines": medicines})

def add_appointment(request, id):
    form = AppointmentsForm(request.POST or None)
    print(form.errors)
    if form.is_valid():
        appointment = form.save(commit=False)
        appointment.patient = get_object_or_404(Logdata, id=id)
        appointment.save()
    return redirect("patient_details", id=id)

def appointments(request):
    appointments = Appointments.objects.filter(patient=get_object_or_404(Logdata,
                                               username=request.session["username"]))
    return render(request, "User/Appointments.html", {"appointments": appointments})

def change_status(request, id, type, status):
    model = Medicine if type == "medicine" else Reminder
    alert = model.objects.get(id=id)
    alert.status = status
    alert.save()
    return redirect("pending_approvals", id=alert.user.id)

def add_alert(request, type, id=None):
    success = False
    if type == "medicine":
        medicine = get_object_or_404(Medicine, id=id) if id else None
        form = MedicineForm(request.POST or None, instance=medicine)
        template = "User/AddMedicine.html"
    else:
        form = ReminderForm(request.POST or None)
        template = "User/AddReminder.html"
    if form.is_valid():
        try:
            user = get_object_or_404(Logdata,
                                     username=request.session["username"])
            alert = form.save(commit=False)
            if not id: alert.user = user
            alert.save()
            success = True
        except IntegrityError as e:
            form.add_error(None, "This medicine is already entered!")
    return render(request, template, {"form": form,
                                      "success": success})
    
def add_medical_details(request):
    success = False
    doctors = Doctors.objects.all()
    instance = MedicalDetails.objects.filter(user__username=request.session["username"]).first() or None
    form = MedicalDetailsForm(request.POST or None, request.FILES or None, instance=instance)
    if request.method == "POST": print(form.errors,"dhfdhgfjgfjgfgf")
    if form.is_valid():
        medicines = list(filter(None, request.POST.getlist("medicines[]")))
        dosage = list(filter(None, request.POST.getlist("dosage[]")))
        previous_medicine = [
            {"medicine": medicine, "dosage": dosage} for medicine, dosage in zip(medicines, dosage)
        ]
        user = get_object_or_404(Logdata,
                                 username=request.session["username"])
        details = form.save(commit=False)
        details.user = user
        details.previous_medicine = previous_medicine
        details.save()
        success = True    
    return render(request, "User/AddMedicalDetails.html", {"form": form,
                                                           "doctors": doctors,
                                                           "success": success})
def view_alerts(request):
    username = request.session["username"]
    medicines = Medicine.objects.filter(user__username=username, status=1)
    reminders = Reminder.objects.filter(user__username=username, status=1)
    return render(request, "User/ViewAlerts.html", {"medicines": medicines,
                                                    "reminders": reminders})
    
def dismiss_alert(request):
    data = json.loads(request.body)
    medicine_id = data.get("medicine_id")
    medicine_log = MedicineLog.objects.create(medicine_id=medicine_id)
    local_time = timezone.localtime(medicine_log.timestamp).strftime("%Y-%m-%d %H:%M:%S")
    send_mail(subject="SereneMind Medicine Log",
              message=f"""{medicine_log.medicine.user.user.first().name} took 
{medicine_log.medicine.medicine} at {local_time}""",
              from_email=None,
              recipient_list=[medicine_log.medicine.user.username], #medicine_log.medicine.user.username
              fail_silently=False)
    print(medicine_log.medicine.user.username,"aaaaa")
    return JsonResponse({"success": True})

def dismiss_alert_2(request):
    data = json.loads(request.body)
    reminder_id = data.get("reminder_id")
    reminder_log = ReminderLog.objects.create(reminder_id=reminder_id)
    local_time = timezone.localtime(reminder_log.timestamp).strftime("%Y-%m-%d %H:%M:%S")
    send_mail(subject="SereneMind Reminder Log",
              message=f"""{reminder_log.reminder.user.user.first().name} completed:  
{reminder_log.reminder.reminder} at {local_time}""",
              from_email=None,
              recipient_list=[reminder_log.reminder.user.username], #reminder_log.reminder.user.username
              fail_silently=False)
    print(reminder_log.reminder.user.username,"bbbbbbbb")
    return JsonResponse({"success": True})

def alert_log(request, user=None):
    user = user or request.session["username"]
    if request.method == "POST":
        month_str = request.POST.get("month")
        year, month = map(int, month_str.split("-"))
        start_of_month = datetime(year, month, 1, tzinfo=timezone.get_current_timezone())
        if month == 12:
            next_month = datetime(year + 1, 1, 1, tzinfo=timezone.get_current_timezone())
        else:
            next_month = datetime(year, month + 1, 1, tzinfo=timezone.get_current_timezone())
    else:
        now = timezone.localtime()
        start_of_month = now.replace(day=1, hour=0, minute=0, second=0, microsecond=0)
        if now.month == 12:
            next_month = now.replace(year=now.year + 1, month=1, day=1, 
                                     hour=0, minute=0, second=0, microsecond=0)
        else:
            next_month = now.replace(month=now.month + 1, day=1,
                                     hour=0, minute=0, second=0, microsecond=0)
    medicines = MedicineLog.objects.filter(
        medicine__user__username=user,
        timestamp__gte=start_of_month,
        timestamp__lt=next_month
    ).select_related("medicine").order_by("-timestamp")
    reminders = ReminderLog.objects.filter(
        reminder__user__username=user,
        timestamp__gte=start_of_month,
        timestamp__lt=next_month
    )
    return render(request, "Common/AlertLog.html", {
        "medicines": medicines,
        "reminders": reminders
    })

def add_kin(request):
    success = None
    form = KinForm(request.POST or None)
    if form.is_valid():
        user = get_object_or_404(Logdata,
                                 username=request.session["username"])
        kin = form.save(commit=False)
        kin.user = user
        kin.save()
        success = True
    return render(request, "User/AddKin.html", {"form": form,
                                                "success": success})

def detect_face(request):
    user = get_object_or_404(Logdata, username=request.session["username"])
    name = detection(user)
    return redirect(request.META["HTTP_REFERER"])

def logout(request):
    request.session.flush()
    return redirect("home")
from django import forms
from django.core.exceptions import ValidationError
from django.contrib.auth.hashers import check_password
from .models import *


class LoginForm(forms.Form):
    username = forms.CharField(max_length=100)
    password = forms.CharField(max_length=100)

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data["username"]
        password = cleaned_data["password"]

        try:
            user = Logdata.objects.get(username=username)
        except Logdata.DoesNotExist:
            raise ValidationError("Invalid Username or Password")
        
        if not check_password(password, user.password):
            raise ValidationError("Invalid Username or Password")


class LogdataForm(forms.ModelForm):
    class Meta:
        model = Logdata
        exclude = ["utype"]
        
class DoctorsForm(forms.ModelForm):
    class Meta:
        model = Doctors
        exclude = ["logdata"]

class UserDetailsForm(forms.ModelForm):
    class Meta:
        model = UserDetails
        exclude = ["logdata"]

class MedicalDetailsForm(forms.ModelForm):
    class Meta:
        model = MedicalDetails
        exclude = ["user", "previous_medicine"]

class MedicineForm(forms.ModelForm):
    class Meta:
        model = Medicine
        exclude = ["user", "status"]

class ReminderForm(forms.ModelForm):
    class Meta:
        model = Reminder
        exclude = ["user", "status"]

class KinForm(forms.ModelForm):
    class Meta:
        model = Kin
        exclude = ["user"]

class AppointmentsForm(forms.ModelForm):
    class Meta:
        model = Appointments
        exclude = ["patient"]    

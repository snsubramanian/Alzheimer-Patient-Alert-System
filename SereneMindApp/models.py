from django.db import models
from django.contrib.auth.hashers import make_password

class Logdata(models.Model):
    username = models.CharField(max_length=100,
                                unique=True,
                                error_messages={
                                    "unique": "This username is already registered"
                                })
    password = models.CharField(max_length=100)
    utype = models.CharField(max_length=20,
                             default="user")
    
    def save(self, *args, **kwargs):
        self.password = make_password(self.password)
        super().save(*args, **kwargs)

class Doctors(models.Model):
    logdata = models.ForeignKey(Logdata, 
                                on_delete=models.CASCADE, 
                                related_name="doctor")
    name = models.CharField(max_length=100)
    photo = models.ImageField(upload_to="Doctors/")
    dob = models.DateField()
    license = models.CharField(max_length=100)
    experience = models.PositiveSmallIntegerField()
    phone = models.CharField(max_length=20)
    address = models.TextField()
    
class UserDetails(models.Model):
    logdata = models.ForeignKey(Logdata, 
                                on_delete=models.CASCADE, 
                                related_name="user")
    name = models.CharField(max_length=100)
    photo = models.ImageField(upload_to="Users/")
    dob = models.DateField()
    kin = models.CharField(max_length=100)
    relation = models.CharField(max_length=20)
    phone = models.CharField(max_length=20)

class MedicalDetails(models.Model):
    user = models.ForeignKey(Logdata, 
                             unique=True,
                             on_delete=models.CASCADE, 
                             related_name="medical_details")
    doctor = models.ForeignKey(Doctors, 
                               on_delete=models.CASCADE)
    height = models.CharField(max_length=100)
    weight = models.PositiveSmallIntegerField()
    blood_group = models.CharField(max_length=10)
    blood_pressure = models.CharField(max_length=20)
    heart_rate = models.PositiveSmallIntegerField()
    temperature = models.DecimalField(max_digits=3, decimal_places=1)
    previous_medicine = models.JSONField()
    medical_history = models.FileField(upload_to="MedicalHistory/")

    
class Medicine(models.Model):
    medicine = models.CharField(max_length=100)
    time = models.TimeField()
    dose = models.CharField(max_length=20)
    user = models.ForeignKey(Logdata,
                             on_delete=models.CASCADE)
    status = models.SmallIntegerField(default=0)

    class Meta:
        unique_together = ("medicine", "time", "dose", "user")

class MedicineLog(models.Model):
    medicine = models.ForeignKey(Medicine,
                                 on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    status = models.SmallIntegerField(default=1, db_comment="0 = not taken, 1 = taken")
    
class Reminder(models.Model):
    topic = models.CharField(max_length=100)
    reminder = models.TextField()
    time = models.TimeField()
    user = models.ForeignKey(Logdata,
                             on_delete=models.CASCADE)
    status = models.SmallIntegerField(default=0)
    
class ReminderLog(models.Model):
    reminder = models.ForeignKey(Reminder,
                                 on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    status = models.SmallIntegerField(default=1, db_comment="0 = not done, 1 = done")


class Kin(models.Model):
    name = models.CharField(max_length=200)
    user = models.ForeignKey(Logdata,
                             on_delete=models.CASCADE, 
                             related_name="kin")
    relation = models.CharField(max_length=50)

class UnknownFaces(models.Model):
    username = models.CharField(max_length=200)
    timestamp = models.DateTimeField(auto_now_add=True)
    image = models.CharField(max_length=200)
 
class Appointments(models.Model):
    purpose = models.CharField(max_length=100)
    date = models.DateTimeField()
    patient = models.ForeignKey(Logdata,
                             on_delete=models.CASCADE)
    status = models.SmallIntegerField(default=0, blank=True)
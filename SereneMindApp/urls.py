from django.urls import path, re_path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("login/", views.login, name="login"),
    path("register/", views.register, name="register"),
    path("add_doctor", views.add_doctor, name="add_doctor"),
    path("view_patients", views.view_patients, name="view_patients"),
    path("pending_approvals/<int:id>/", views.pending_approvals, name="pending_approvals"),
    path("patient_details/<int:id>/", views.patient_details, name="patient_details"),
    path("add_appointment/<int:id>/", views.add_appointment, name="add_appointment"),
    path("appointments", views.appointments, name="appointments"),
    re_path(r'^alert_log(?:/(?P<user>[\w.@+-]+))?/$', views.alert_log, name='alert_log'),
    path("change_status/<int:id>/<str:type>/<int:status>/", views.change_status, name="change_status"),
    re_path(r"^add_alert/(?P<type>[^/]+)(?:/(?P<id>\d+))?/$", views.add_alert, name="add_alert",),
    path("add_medical_details", views.add_medical_details, name="add_medical_details"),
    path("view_alerts", views.view_alerts, name="view_alerts"),
    path("dismiss_alert", views.dismiss_alert, name="dismiss_alert"),
    path("dismiss_alert_2", views.dismiss_alert_2, name="dismiss_alert_2"),
    path("add_kin", views.add_kin, name="add_kin"),
    path("detect_face/", views.detect_face, name="detect_face"),
    path("logout", views.logout, name="logout"),
]
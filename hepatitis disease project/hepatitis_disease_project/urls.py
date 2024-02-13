"""
URL configuration for hepatitis_disease_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as main_views
from userapp import views as user_views
from adminapp import views as admin_views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    #main
    path('admin/', admin.site.urls),
    path('',main_views.home,name='home'),
    path('user-login',main_views.user_login,name='user_login'),
    path('admin-login',main_views.admin_login,name='admin_login'),
    path('about-us',main_views.about_us,name='about_us'),
    path('contact-us',main_views.contact_us,name='contact_us'),
    path('register',main_views.register,name='register'),
    path('otp',main_views.otp,name='otp'),
    path('forgotpassword', main_views.forgotpassword, name='forgotpassword'),
    path('updatepassword',main_views.update_password,name='update_password'),
    path('newpassword',main_views.new_password,name='new_password'),
    
    
    #user
    path('user-dashboard',user_views.user_dashboard,name='user_dashboard'),
    path('user-profile',user_views.user_profile,name='user_profile'),
    path('user-feedback',user_views.user_feedback,name='user_feedback'),
    path('user-predict',user_views.user_predict,name='user_predict'),
    path('user-result',user_views.user_result,name='user_result'),
    path('userlogout', user_views.userlogout, name = 'userlogout'),
    
    #admin
    path('admin-dashboard',admin_views.admin_dashboard,name='admin_dashboard'),
    path('pending-users',admin_views.pending_users,name='pending_users'),
    path('all-users',admin_views.all_users,name='all_users'),
    path('accept-user/<int:id>', admin_views.accept_user, name = 'accept_user'),
    path('reject-user/<int:id>', admin_views.reject_user, name = 'reject'),
    path('delete-user/<int:id>', admin_views.delete_user, name = 'delete_user'),
    path('delete-dataset/<int:id>', admin_views.delete_dataset, name = 'delete_dataset'),
    path('adminlogout',admin_views.adminlogout, name='adminlogout'),
    path('upload-dataset',admin_views.upload_dataset,name="upload_dataset"),
    path('view-dataset', admin_views.viewdataset, name = 'viewdataset'),
    path('view-view', admin_views.view_view, name='view_view'),
    path('xgb-algm', admin_views.xgbalgm, name = 'xgbalgm'),
    path('XGBOOST-btn', admin_views.XGBOOST_btn, name='XGBOOST_btn'),
    path('adab-algm', admin_views.adabalgm, name = 'adabalgm'),
    path('ADABoost-btn', admin_views.ADABoost_btn, name='ADABoost_btn'),
    path('knn-algm', admin_views.knnalgm, name = 'knnalgm'),
    path('KNN-btn', admin_views.KNN_btn, name='KNN_btn'),
    path('logistic-regression', admin_views.logistic_regression, name = 'logistic_regression'),
    path('logistic-regression-btn', admin_views.logistic_regression_btn, name='logistic_regression_btn'),
    path('random', admin_views.random, name = 'random'),
    path('randomforest-btn', admin_views.randomforest_btn, name='randomforest_btn'),
    path('dt-algm', admin_views.dtalgm, name = 'dtalgm'),
    path('Decisiontree-btn', admin_views.Decisiontree_btn, name='Decisiontree_btn'),
    path('GD-alg', admin_views.gdalgm, name = 'gdalgm'),
    path('GD-btn', admin_views.GD_btn, name='GD_btn'),
    path('admin-graph', admin_views.admin_graph, name = 'admin_graph'),
    path('user-feedbacks',admin_views.user_feedbacks,name='user_feedbacks'),
    path('user-sentiment',admin_views.user_sentiment,name='user_sentiment'),
    path('user-graph',admin_views.user_graph,name='user_graph'),
]+ static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)

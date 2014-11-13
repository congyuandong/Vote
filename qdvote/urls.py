from django.conf.urls import patterns, url
import views

urlpatterns = patterns('',
	url(r'^$', views.Index, name='Index'),
	url(r'^index/', views.Index, name='Index'),
	url(r'^ins/', views.Institution, name='Institution'),
	url(r'^judge/', views.Judge, name='Judge'),
	url(r'^apply/', views.Apply, name='Apply'),
	url(r'^contact/', views.Contact, name='Contact'),
	)
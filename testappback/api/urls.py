from django.urls import path

from .views import (
    PostCreateView,
    PostListView,
    FavouiteCreateView,
    FavouriteListView,
    NotificationCreateView,
    NotificationListView,
)
urlpatterns = [
    path('post/',PostListView.as_view(),name='list'),
    path('post/add/',PostCreateView.as_view(),name='create'),
    path('fav/',FavouriteListView.as_view(),name="fav-list"),
    path('fav/add/',FavouiteCreateView.as_view(),name="fav"),
    path('noti/',NotificationListView.as_view(),name='noti'),
    path('noti/add/',NotificationCreateView.as_view(),name='noti-list'),
    
]

from django.shortcuts import render
from rest_framework import status
from rest_framework import filters
from rest_framework.generics import (CreateAPIView, ListAPIView)

from . import models
from .serializer import (PostSerializer, UserSerializer,
                         FavouriteSerializer, NotificationSerializer)


class PostCreateView(CreateAPIView):
    queryset = models.Post.objects.all()
    serializer_class = PostSerializer

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)


class PostListView(ListAPIView):
    queryset = models.Post.objects.all()
    serializer_class = PostSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ("caption", "slug",)


class FavouiteCreateView(CreateAPIView):
    serializer_class = FavouriteSerializer
    queryset = models.Favourite.objects.all()

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)


class FavouriteListView(ListAPIView):
    queryset = models.Favourite.objects.all()
    serializer_class = FavouriteSerializer


class NotificationListView(ListAPIView):
    queryset = models.Notification.objects.all()
    serializer_class = NotificationSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ("msg", "time",)


class NotificationCreateView(CreateAPIView):
    queryset = models.Notification.objects.all()
    serializer_class = NotificationSerializer

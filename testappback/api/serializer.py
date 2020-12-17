from rest_framework import serializers
from . import models


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Account
        read_only_fields = ['username', 'image']
        fields = ['username', 'image']


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Post
        depth = 2
        fields = ['caption', 'image', 'likes',
                  'shares', 'comments', 'slug', 'author']


class FavouriteSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Favourite
        depth = 2
        fields = ['caption', 'author', 'time']


class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Notification
        depth = 2
        fields = ['msg', 'author', 'time']

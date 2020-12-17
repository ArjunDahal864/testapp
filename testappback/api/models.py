from django.db import models
from datetime import datetime
from django.conf import settings
from django.dispatch import receiver
from django.utils.text import slugify
from django.db.models.signals import pre_save
from django.db.models.signals import post_delete
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager


class MyAccountManager(BaseUserManager):
    def create_user(self, email, username, password=None):
        if not email:
            raise ValueError("Users Must Have an Email address")
        if not username:
            raise ValueError("Users Must Have an Name")

        user = self.model(
            email=self.normalize_email(email),
            username=username,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, username, password):
        user = self.create_user(
            email=self.normalize_email(email),
            password=password,
            username=username,
        )
        user.is_staff = True
        user.is_superuser = True
        user.is_admin = True
        user.save(using=self._db)
        return user


class Account(AbstractBaseUser):
    email = models.EmailField(verbose_name='email',
                              max_length=255, unique=True)
    username = models.CharField(max_length=50, unique=False)
    image = models.ImageField()
    date_joined = models.DateTimeField(
        verbose_name='date joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last login', auto_now=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', ]

    objects = MyAccountManager()

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return True


def upload_location(instance, filename):
    file_path = 'post/{author_id}/{caption}-{filename}'.format(
        author_id=str(instance.author.id), caption=str(instance.caption), filename=filename)
    return file_path


class Post(models.Model):
    caption = models.CharField(max_length=5000, null=False, blank=False)
    author = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    image = models.ImageField(upload_to=upload_location)
    likes = models.IntegerField()
    shares = models.IntegerField()
    comments = models.IntegerField()
    slug = models.SlugField(blank=True, unique=True)

    def __str__(self):
        return self.caption


@receiver(post_delete, sender=Post)
def submission_delete(sender, instance, **kwargs):
    instance.image.delete(False)


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = slugify(
            instance.author.username + "-" + instance.caption + '-' + str(instance.author.id) + str(len(
                instance.caption)) + str(datetime.now()))


pre_save.connect(pre_save_post_receiver, sender=Post)


class Favourite(models.Model):
    caption = models.CharField(max_length=52)
    author = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    time = models.DateField(auto_now=True)

class Notification(models.Model):
    author = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    msg = models.CharField(max_length=452)
    time = models.DateField(auto_now=True)
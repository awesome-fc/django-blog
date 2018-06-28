#!/usr/bin/env python
# coding=utf-8
import sys
import os

# load local django
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), "blogproject"))
import django

print (django.__version__)

from urllib.parse import urlparse
from blogproject.wsgi import application
from django.conf import settings 

base_path = None

def handler(environ, start_response):
    request_uri = environ['fc.request_uri']
    parsed_tuple = urlparse(request_uri)
    li = parsed_tuple.path.split('/')
    global base_path
    if not base_path:
        base_path = "/".join(li[0:5])
        settings.STATIC_URL = base_path + settings.STATIC_FC_URL

    context = environ['fc.context']
    environ['HTTP_HOST'] = '{}.{}.fc.aliyuncs.com'.format(context.account_id, context.region)
    environ['SCRIPT_NAME'] = base_path + '/'

    return application(environ, start_response)

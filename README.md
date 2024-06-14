# README

This README would normally document whatever steps are necessary to get the
application up and running.

Ruby Version - 3.0.1
Rails Version - 7.0.8

Simple webhook application

- Created Article Model with title and content attributes
- Created Article contoller with create and update apis
- Created service for sending the event to the webhook and intialized external api(pipedream,webhook.site)
- Used httparty gem for http request for external api(in this case webhook)
- Used Pipedream and webhook.site to create simple external webhook http request url

Conclusion - 
    when create or update action is triggered we send response to the webhook and see the response in real-time.

    pipedream account:
    https://pipedream.com/@simple-webhook/projects/proj_9lsqlm1/webhook-p_MOCkVBL/inspect/2hsCk78FqKAwptrfqkpSHK1OOEr
    email: harivm71@gmail.com
    password: Webhook@2024

    webhook.site:
    https://webhook.site/#!/view/2ffc6b55-87c8-4db4-98e7-23336382fb53

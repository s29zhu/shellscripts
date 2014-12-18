#!/usr/bin/env python

import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()
channel.queue_declare(queue='exchange1')
channel.exchange_declare(exchange="shasha.exchange1", type="direct")
channel.queue_bind(exchange="shasha.exchange1", queue="exchange1", routing_key="rkey")

print "Waiting for the messages."

def callback(ch, method, properties, body):
    print "Message is received %r" % (body,)
channel.basic_consume(callback, queue='exchange1', no_ack=True)
channel.start_consuming()

#!/usr/bin/env python 

import pika
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()
channel.exchange_declare(exchange="shasha.exchange1", type="direct");
channel.basic_publish('shasha.exchange1', routing_key='rkey', body='hello Shasha')
print "Message sent to exchange!"
connection.close()



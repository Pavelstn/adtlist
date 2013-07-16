#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
import urllib2
import hmac


def to_serial(sendpost):
	string= "user_id_"+str(sendpost["user_id"])
	string= string+ "_request_"+sendpost["request"]
	postdata= sendpost["postdata"]
	postdata= sorted(postdata.iteritems())
	string= string+  "".join("_%s_%s" % tup for tup in postdata)
	#print string
	return string

def send_json(url, sign_data):
	headers = {"Content-Type": "application/json", "Accept": "*/*"}
	req = urllib2.Request(url,headers=headers, data= json.dumps(sign_data))
	response=urllib2.urlopen(req)
	return response
	


def sign_data(send_data, plain_data, token):
	sign = hmac.new(token, plain_data).hexdigest()
	#print sign
	sign_data={
		"data":{
				"send_data":send_data,
				"sign":sign
				}
		}
	return sign_data

def send_post(post, token):
	sendpost={
			"user_id":"1",
			"request":"save_post",
			"postdata":post,
		}
	serial_data= to_serial(sendpost)
	
	response= send_json("http://localhost:3000/userapi/v1", sign_data(sendpost, serial_data, token))
	if 201== response.getcode():
		result = json.load(response)
		return result["id"]
	else:
		return 0


def send_image(post_id, umg_url, token):
	image={
		"post_id":post_id,
		"url":umg_url,
		}
	senddata={
			"user_id":'1',
			"request":"save_image",
			"postdata":image,
		}
	serial_data= to_serial(senddata)
	response= send_json("http://localhost:3000/userapi/v1", sign_data(senddata, serial_data, token))
	if 201== response.getcode():
		result = json.load(response)
		return result["id"]
	else:
		return 0
	


token= "*****************************************"

post={
		"region_id":"1",
		"category_id":"4",
		"altname":"pyq33ww4dw3",
		"title":"df\tСдается однокомнатная квартира ",
		"text":"<p>Аренда 2 комнаты квартира краснодар</p><p>awsddsfdsf sf dsfsdf</p>",
		"price":"23300",
		#"isactive"=>"",
		#"ontop"=>"",
		"imageurl":"/ckeditor_assets/pictures/5/content_nophoto1.jpg",
		"partner_id":"1",
		"district":" (Аврора к-т), Одесская ул., Красная ул.",
		"space":"10/10/30",
		"floor":"2/5",
		"material":"кирпич,монолит",
		"plan":"свободная планировка",
		"year":"1988",
		"conditionbuilding":"развалюха",
		"apartmentstate":"Евроремонт",
		"balcony":"1",
		"phone":"1",
		
		#"contact"=>"",
		#"tags"=>"",
		#"user_id"=>"",
		#"updated_at"=>"2013-05-30T04:04:33Z",
		#"created_at"=>"2013-05-30T04:04:33Z",
		#"isdelete"=>"",
		#"id"=>40,
		
		
	}


post_id= send_post(post, token)
print post_id
print send_image(post_id, "http://adtlist.ru/ckeditor_assets/pictures/31/content_010_1037-882.png", token)
print send_image(post_id, "http://storage-2061-1.cs.clodoserver.ru/adt_assets/20130327/620x400_content_010_8022-953.png", token)





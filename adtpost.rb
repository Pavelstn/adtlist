#!/home/pavel/.rvm/rubies/ruby-1.9.3-p194/bin/ruby
# coding: utf-8

require 'net/http'
require 'json'
require 'uri'
require 'openssl'

def to_serial(data)
	#puts data.sort 
	string= "user_id_"+data["user_id"]
	string= string+ "_request_"+data["request"]
	postdata= data["postdata"]
	arr= postdata.sort
	string= string+"_"+arr.join("_")
	#puts string
	return string
end



def send_json(url, sign_data)
	uri = URI.parse(url)
	header = {"Content-Type" => "application/json"}
	http = Net::HTTP.new(uri.host,uri.port) 
 	response = http.post(uri.path,sign_data.to_json,header)
 	return response 
end

def sign_data(send_data, plain_data, token)
	sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), token, plain_data)
	#puts sign
	signdata={
		"data"=>{
			"send_data"=>send_data,
			"sign"=> sign
			}
		}
	return signdata
end


def send_post(post, token)
	sendpost={
			"user_id"=>'1',
			"request"=>"save_post",
			"postdata"=>post,
		}
	serial_data= to_serial(sendpost)
	#puts serial_data
	response= send_json("http://localhost:3000/userapi/v1", sign_data(sendpost, serial_data, token))
	if response.code=="201"
		#puts response.body
		result = JSON.parse(response.body)
		return result["id"]
	else
		return 0
	end
end

def send_image(post_id, umg_url, token)
	image={
		"post_id"=>post_id,
		"url"=>umg_url,
		}
	senddata={
			"user_id"=>'1',
			"request"=>"save_image",
			"postdata"=>image,
		}
	serial_data= to_serial(senddata)

	response= send_json("http://localhost:3000/userapi/v1", sign_data(senddata, serial_data, token))
	if response.code=="201"
		#puts response.body
		result = JSON.parse(response.body)
		return result["id"]
	else
		return 0
	end
end



token= "************************************"
post={
		"region_id"=>"1",
		"category_id"=>"4",
		"altname"=>"qsssqqq33ww4dw3",
		"title"=>"df\tСдается однокомнатная квартира ",
		"text"=>"<p>Аренда 2 комнаты квартира краснодар</p><p>awsddsfdsf sf dsfsdf</p>",
		"price"=>'23300',
		#"isactive"=>"",
		#"ontop"=>"",
		"imageurl"=>"/ckeditor_assets/pictures/5/content_nophoto1.jpg",
		"partner_id"=>"1",
		"district"=>" (Аврора к-т), Одесская ул., Красная ул.",
		"space"=>"10/10/30",
		"floor"=>"2/5",
		"material"=>"кирпич,монолит",
		"plan"=>"свободная планировка",
		"year"=>"1988",
		"conditionbuilding"=>"развалюха",
		"apartmentstate"=>"Евроремонт",
		"balcony"=>"1",
		"phone"=>"1",
		#"contact"=>"",
		#"tags"=>"",
		#"user_id"=>"",
		#"updated_at"=>"2013-05-30T04:04:33Z",
		#"created_at"=>"2013-05-30T04:04:33Z",
		#"isdelete"=>"",
		#"id"=>40,
	}




post_id= send_post(post, token)
puts post_id
puts send_image(post_id, "http://adtlist.ru/ckeditor_assets/pictures/31/content_010_1037-882.png", token)
puts send_image(post_id, "http://storage-2061-1.cs.clodoserver.ru/adt_assets/20130327/620x400_content_010_8022-953.png", token)



#puts response.code
#puts response.body


#response= send_json("http://localhost:3000/userapi/new_image", sign_data(send_image, plain_image, token))
#puts response.code
#puts response.body

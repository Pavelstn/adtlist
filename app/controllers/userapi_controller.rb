class UserapiController < ApplicationController
	def getactiverandom
		@post =Post.all_active().sample(1)
		render json: @post.to_json(:include =>{:region => {:only => [:alias]}}, :only => [:id, :altname, :title,:price])
	end

	
	def v1
		@data= params[:data]
		@send_data= @data[:send_data]
		user   = User.find(@send_data[:user_id])
		if user.isusetoken
			token= user.token
			server_sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), token, to_serial(@send_data))
			#logger.debug server_sign
			if @data[:sign] == server_sign
				case @send_data[:request]
					when "save_post"
						@post = Adtadmin::Post.new(@send_data[:postdata])
						if @post.save
							render json: @post, status: :created
						else
							render json: @post.errors, status: :unprocessable_entity 
						end

					when "save_image"
						@image = Adtadmin::Image.new(@send_data[:postdata])
						if @image.save
							render json: @image, status: :created, location: @image 
						else
							render json: @image.errors, status: :unprocessable_entity
						end

					when "show_all_posts"
						@posts = Adtadmin::Post.all
						render json: @posts
				else
					head :no_content
				end


			else
				head :no_content
				logger.debug "sign error"
			end
		else
			head :no_content
		end

	end
	private 

	def to_serial(data)
		string= "user_id_"+data["user_id"]
		string= string+ "_request_"+data["request"]
		postdata= data["postdata"]
		arr= postdata.sort
		string= string+"_"+arr.join("_")
		return string
	end
end

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	add_post_request = (phone, description) ->
		call_data = undefined
		call_data= review:
			phone: phone
			description:description
			typereview_id: 2
		my_ajax_send "/reviews.json", call_data, ->
			$('#myModal').modal('hide')


	add_call_request = (description, phone) ->
		call_data = undefined
		call_data= review:
			description: description
			phone: phone
			typereview_id: 1
		my_ajax_send "/reviews.json", call_data, ->
			$("#phone_input").val ""
			$("#call_me").text "Заявка принята"

	$("#submit_post").click ->
		phone = $("#inputphone").val()
		description = $("#inputdescription").val()
		add_post_request(phone, description)

	$("#search_button").click ->
		#alert("sdsd")
		window.location.href = "/search?region="+$("#select_region").val()+"&category="+$("#select_category").val()

	$("#call_me").click ->
		phone = $("#phone_input").val()
		description = $("#call_me").val()
		add_call_request(description, phone)
		$("#phone_input").val ""
		$("#call_me").text "Заявка принята"
		#alert phone
    	#post_id = $("#post_id").val()
	


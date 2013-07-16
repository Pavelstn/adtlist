// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//



//= require jquery_ujs
//= require_tree 


function my_ajax_send(url, send_data, success_code){
  $.ajax({
   url: url,
   type: "POST",
   dataType: "json",
   beforeSend : function(xhr){xhr.setRequestHeader("Accept", "application/json")}, 
   beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
   data:send_data,
   success: function(resp){ 
    success_code();
  }
});
}
function my_ajax_delete(url){
  $.ajax({
   url: url,
   type: "DELETE",
   dataType: "json",
   beforeSend : function(xhr){xhr.setRequestHeader("Accept", "application/json")}, 
   beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
   data:"",
 });
}


$(document).ready(function () {
    /* $.getJSON('/get_regions', function (data) {
         var items = [];
         $.each(data, function (key, val) {
          $('<li id="' + key + '">' + '<a class="h_link" href=\"/' + val.alias + '\">' + val.name + '</a>' + '</li>').appendTo('#region_list');
         });
   
     });*/
    $('#login_push').click( function(){
     $('#login_cover').css("visibility", "visible");
    });

});
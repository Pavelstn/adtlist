class ReviewMailer < ActionMailer::Base
  default from: "robot.bender.0001@mail.ru"

  def welcome_email(phone, post_id, date)
    @phone = phone
    @post_id = post_id
    @date = date
    mail(:to => "send@send.smsc.ru", :subject => "")
  end

#  def notify_review(phone, post_id, date)
# 	@phone = phone
#    @post_id = post_id
#    @date = date
#    mail(:to => "send@send.smsc.ru", :subject => "")
#  end
end

class NewsList < ActiveRecord::Base
  attr_accessible :img_url, :short_text, :text, :title, :user_id, :isdelete, :isactive

  def self.all_active()
		NewsList.where( :isactive=>1)
  end

  def self.latest_active()
  	NewsList.where( :isactive=>1).order("created_at DESC").limit(4)
  end
end

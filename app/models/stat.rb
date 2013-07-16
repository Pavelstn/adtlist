class Stat < ActiveRecord::Base
  attr_accessible :post_id, :visittype
  belongs_to :post

    def self.loadpage(deal_id)
  		Stat.create(:post_id=>deal_id, :visittype=>1)
	end

  	def self.visitpage(deal_id)
  		Stat.create(:deal_id=>deal_id, :visittype=>2)
	end

  	def self.click(deal_id)
  		Stat.create(:deal_id=>deal_id, :visittype=>3)
	end

 def self.getpopular_loadpage
    Stat.find(:all, :select => "post_id, count(post_id) AS visit",:group => "post_id", :limit=>10, :order=>("visit DESC"))
 end

  def self.getpopular_loadpage_sum
    #Stat.find(:all, :select => "sum(deal_id) AS visit",:group => "deal_id")
    Stat.count(:post_id)
 end

end

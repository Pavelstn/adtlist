class StatsController < ApplicationController
load_and_authorize_resource 
layout "admin"
 def index
    @stats=Stat.getpopular_loadpage
    @all_post= Post.where("isdelete IS NULL AND isactive=1").count()
    @sum= Stat.getpopular_loadpage_sum
  end

  def destroy_all
    Stat.delete_all()
    redirect_to stats_url 
  end

  
end

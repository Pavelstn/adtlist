class Review < ActiveRecord::Base
  attr_accessible :adress, :description, :name, :phone, :typereview_id, :post_id
  #belongs_to :post
end

class Comment < ApplicationRecord
  belongs_to :post

  def formatted_time
    updated_at.getlocal.localtime.strftime('%m/%d/%Y  %I:%M %p')
  end 
  
end

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def formatted_time
    updated_at.getlocal.localtime.strftime('%m/%d/%Y  %I:%M %p')
  end 
  
end

json.id @user.id 
json.first_name @user.first_name
json.last_name @user.last_name
json.email @user.email
json.image_url rails_blob_url(@user.image) if @user.image.attachment

json.comments @user.comments
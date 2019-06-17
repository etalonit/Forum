ActiveAdmin.register Article do

 permit_params :title, :content, :user_id, :image, :audio, :category_id

end

	module UsersHelper
	def avatar_for(user, options = {size: 80})
        size = options[:size]
		if user.avatar?
			image_tag user.avatar.url(:thumb), width: size, class: 'avatar-image'
		else
			image_tag "noavatar.png", width: size, class: 'avatar-image'
		end
		
	end
end

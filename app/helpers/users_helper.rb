module UsersHelper
	# returns the image from gravater webpage
	def gravatar_for(user, options = { size: 50 })
		size = options[:size]
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravater_url="http://www.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravater_url, alt: user.name, 
			                    width: size, height: size, class: "gravatar")
	end
end

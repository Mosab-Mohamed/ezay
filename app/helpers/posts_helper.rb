module PostsHelper
	def breaking_wrap_wrap(txt, col = 80)
  		txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,"\\1\\3\n") 
	end

	def liked (postId)

		if current_user.likes.where(:post_id => postId).length != 0 
			true
		else
			false
		end

	end
end

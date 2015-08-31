module PostsHelper
	def breaking_wrap_wrap(txt, col = 80)
  		txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,"\\1\\3\n") 
	end

	def liked (ratedID ,cat)

		if current_user.likes.where(:rated_id => ratedID , :category => cat).length != 0 
			true
		else
			false
		end

	end
end

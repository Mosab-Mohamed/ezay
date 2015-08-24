class Comment < ActiveRecord::Base

	belongs_to :post 
<<<<<<< HEAD
=======
	belongs_to :user
>>>>>>> 6b169120832efd91729b2ae5af87957652742d93
	has_many :notifications , dependent: :destroy
end

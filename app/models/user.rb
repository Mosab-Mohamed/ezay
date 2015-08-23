class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_attached_file :photo , :styles => {:small => "55x55>"}
  validates :name , :department ,presence: true 
  validates_attachment_presence :photo
  validates_attachment_size :photo , :less_than => 3.megabytes
  validates_attachment_content_type :photo , :content_type => ['image/jpeg','image/png']

end

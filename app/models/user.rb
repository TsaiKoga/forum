class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

	has_many :posts, dependent: :destroy
	has_many :comments

	validates :name, uniqueness: {case_sensitive: false}
	validates :signature, length: {maximum:  25}
	validates :introduction, length: {maximum: 500}

	attr_accessor :login

	has_attached_file :avatar, 
		:default_url => "/images/:attachment/:style/missing.png",
		:path => ":rails_root/public/images/:attachment/:id/:style.:extension",			# 存储路径
		:url => "/images/:attachment/:id/:style.:extension",												# 读取路径
		:styles => {:small => "16X16", :normal => "48X48", :large => "64X64", :big => "120X120"}

	# 覆盖find_for_database_authentication方法
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		else
			where(conditions).first
		end
	end

end

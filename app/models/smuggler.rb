class Smuggler < ActiveRecord::Base
	has_many :vehicles, through: :missions
	has_many :missions

	has_secure_password
	validates_presence_of :password, on: :create
	validates_presence_of :username, on: :create
	validates_presence_of :email, on: :create
	validates_uniqueness_of  :email
	validates_uniqueness_of :username


	has_many :active_relationships, class_name: "Relationship",
	foreign_key: "follower_id",
	dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
	foreign_key: "followed_id",
	dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower


	def follow!(other_smuggler)
		active_relationships.create(followed_id: other_smuggler.id)
	end

	def unfollow!(other_smuggler)
		active_relationships.find_by(followed_id: other_smuggler.id).destroy
	end

	def following?(other_smuggler)
		following.include?(other_smuggler)
	end


	#Paperclip below 
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

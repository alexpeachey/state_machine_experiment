class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :relationships
  has_many :followers, through: :relationships
  has_many :inverse_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followings, through: :inverse_relationships, source: :user
  has_many :relevant_posts, through: :followings, source: :posts

  def following?(user)
    followings.include? user
  end
end

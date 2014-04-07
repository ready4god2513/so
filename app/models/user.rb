class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]
  
end
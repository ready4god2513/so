class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :votes, as: :voteable

  validates_presence_of :user_id, :commentable_id, :content

end
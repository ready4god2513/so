class Comment < ActiveRecord::Base

  include VoteTracker

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates_presence_of :user_id, :commentable_id, :content

end
class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers

  validates_presence_of :content, :user_id

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  default_scope order: "created_at desc" # Don't use a default_scope.  Bad things happen

end

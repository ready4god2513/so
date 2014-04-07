class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates_presence_of :content, :question_id, :user_id

  extend FriendlyId
  friendly_id :random_id, use: [:slugged, :finders]

  default_scope order: "created_at desc" # Don't use a default_scope.  Bad things happen

  private

  def random_id
    SecureRandom.hex(16) # Silly at this point, but whatever
  end

end
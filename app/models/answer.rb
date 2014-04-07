class Answer < ActiveRecord::Base

  include VoteTracker

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable

  validates_presence_of :content, :question_id, :user_id

  extend FriendlyId
  friendly_id :random_id, use: [:slugged, :finders]

  private

  def random_id
    SecureRandom.hex(16) # Silly at this point, but whatever
  end

end
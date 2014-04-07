class Vote < ActiveRecord::Base

  DIRECTIONS = [1, -1]
  VOTEABLE = [Answer, Comment, Question]

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :direction, presence: true, inclusion: { in: DIRECTIONS } # -1 = down; 1 = up;
  validates_presence_of :user_id, :voteable_id

  after_save :cache_vote_count_on_parent

  def self.direction_to_string(dir)
    case dir
    when 1
      "&#8593;"
    else
      "&#8595;"
    end
  end

  # This should really be thrown in to a queue for background processing.
  # No need to keep it in the main thread
  def cache_vote_count_on_parent
    voteable.update_attributes(vote_count: voteable.votes.sum(:direction))
  end

end
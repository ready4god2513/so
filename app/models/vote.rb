class Vote < ActiveRecord::Base

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :direction, inclusion: { in: [-1, 1] } # -1 = down; 1 = up;

  after_save :cache_vote_count_on_parent

  # This should really be thrown in to a queue for background processing.
  # No need to keep it in the main thread
  def cache_vote_count_on_parent
    voteable.update_attributes(vote_count: voteable.votes.sum(:direction))
  end

end
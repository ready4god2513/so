module VoteTracker

  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
    default_scope order: "vote_count desc" # Don't use a default_scope.  Bad things happen
  end

end
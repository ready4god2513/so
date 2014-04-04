class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  validates_presence_of :content, :question_id, :user_id

  extend FriendlyId
  friendly_id :content, use: [:slugged, :finders]

end
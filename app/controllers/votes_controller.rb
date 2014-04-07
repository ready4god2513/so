class VotesController < InheritedResources::Base

  belongs_to :comment, :answer, :question, polymorphic: true
  actions :create, :update, :destroy

  before_filter :authenticate_user!

  def create
    create! { parent }
  end

end
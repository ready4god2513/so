class CommentsController < InheritedResources::Base

  belongs_to :question, :answer, polymorphic: true
  actions :create, :update, :destroy

  before_filter :authenticate_user!

  def create
    create! { parent }
  end

end
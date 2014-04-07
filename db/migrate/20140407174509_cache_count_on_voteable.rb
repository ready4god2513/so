class CacheCountOnVoteable < ActiveRecord::Migration
  def change
    add_column :questions, :vote_count, :integer
    add_column :answers, :vote_count, :integer
    add_column :comments, :vote_count, :integer
  end
end

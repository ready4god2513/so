class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :slug
      t.string :content
      t.references :user

      t.timestamps
    end
  end
end
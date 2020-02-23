class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.string :resources
      t.text :inspiration
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePledges < ActiveRecord::Migration[6.0]
  def change
    create_table :pledges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :idea, null: false, foreign_key: true

      t.timestamps
    end
  end
end

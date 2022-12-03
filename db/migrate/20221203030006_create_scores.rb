class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :score
      t.timestamps
    end
  end
end

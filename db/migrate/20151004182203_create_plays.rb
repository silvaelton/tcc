class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :player, index: true#, foreign_key: true
      t.integer :turn
      t.integer :round
      t.string :choice_type
      t.integer :group_id

      t.timestamps null: false
    end
  end
end

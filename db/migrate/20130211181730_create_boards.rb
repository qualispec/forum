class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :moderator_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

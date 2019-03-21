class CreatePlays < ActiveRecord::Migration[5.2]
  def up
    create_table :plays do |t|
      t.string :title
      t.text :description
      t.string :director
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end

  def down
    drop_table :plays
  end
end

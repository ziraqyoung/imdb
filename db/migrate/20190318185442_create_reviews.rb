class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :play_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end

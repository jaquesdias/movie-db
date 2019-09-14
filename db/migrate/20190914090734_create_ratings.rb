class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rating_value, null: false, index: true
      t.integer :movie_id, index: true

      t.timestamps
    end
  end
end

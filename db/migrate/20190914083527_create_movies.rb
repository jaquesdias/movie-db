class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, index: true
      t.string :description
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end

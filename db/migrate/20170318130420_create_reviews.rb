class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :comic_name
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end

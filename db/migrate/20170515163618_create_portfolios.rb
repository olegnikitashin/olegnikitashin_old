class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :title, null: false
      t.string :subtitle
      t.text :body, null: false
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end

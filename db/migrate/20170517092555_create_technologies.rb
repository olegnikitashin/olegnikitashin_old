class CreateTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :technologies do |t|
      t.string :name, null: false
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end

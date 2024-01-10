class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|

      t.string :title
      t.text :description
      t.integer :language
      t.integer :status
      t.integer :availability
      t.integer :price

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.text :note
      t.integer :order
      t.integer :type

      t.references :lesson, null: false, foreign_key: true
      t.timestamps
    end
  end
end

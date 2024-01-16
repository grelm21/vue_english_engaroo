class CreateMatchings < ActiveRecord::Migration[7.1]
  def change
    create_table :matchings do |t|
      t.string :first_word
      t.string :second_word
      t.integer :checks

      t.references :task, null:false, foreign_key: true
      t.timestamps
    end
  end
end

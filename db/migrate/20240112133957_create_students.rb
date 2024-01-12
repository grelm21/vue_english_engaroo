class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.integer :progress_lesson
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.timestamps
    end
  end
end

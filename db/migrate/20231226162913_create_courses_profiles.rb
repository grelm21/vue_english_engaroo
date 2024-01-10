class CreateCoursesProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :courses_profiles do |t|

      t.references :profile, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.timestamps
    end
  end
end

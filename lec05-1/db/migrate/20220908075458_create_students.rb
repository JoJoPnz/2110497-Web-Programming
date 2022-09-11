class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone
      t.float :score
      t.string :grade

      t.timestamps
    end
  end
end

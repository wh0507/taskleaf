class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.references :user, foreign_key: true
      
      t.timestamps null: false
    end
  end
end

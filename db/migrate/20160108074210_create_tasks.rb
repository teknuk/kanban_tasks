class CreateTasks < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        create_table :tasks do |t|
          t.timestamps null: false
          t.string :title, :null => false
          t.text :description
          t.integer :status, default: 0, :null => false
        end
      end
      dir.down { drop_table :tasks }
    end
  end
end

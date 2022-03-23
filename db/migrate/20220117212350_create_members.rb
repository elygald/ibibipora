class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.datetime :birth_date
      t.integer :conversion_time

      t.timestamps
    end
  end
end

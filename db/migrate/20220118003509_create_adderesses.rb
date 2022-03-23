class CreateAdderesses < ActiveRecord::Migration[6.1]
  def change
    create_table :adderesses do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :district
      t.string :uf
      t.string :country
      t.string :cep

      t.timestamps
    end
  end
end

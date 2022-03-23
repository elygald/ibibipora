class AddMemberRefToAdderesses < ActiveRecord::Migration[6.1]
  def change
    add_reference :adderesses, :member, null: false, foreign_key: true
  end
end

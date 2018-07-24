class AddLengthToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :length, :integer
  end
end

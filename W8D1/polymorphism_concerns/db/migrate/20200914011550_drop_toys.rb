class DropToys < ActiveRecord::Migration[5.1]
  def change
    drop_table :toys
  end
end

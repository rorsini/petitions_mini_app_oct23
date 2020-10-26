class RenameSignaturesColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :petitions, :signatures, :total_signatures
  end
end

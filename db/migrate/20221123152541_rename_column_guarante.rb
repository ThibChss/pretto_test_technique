class RenameColumnGuarante < ActiveRecord::Migration[7.0]
  def change
    rename_column :credits, :guarante_fee, :guarantee_fee
  end
end

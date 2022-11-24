class AddBrokerageFeeColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :credits, :brokerage_fee, :integer
  end
end

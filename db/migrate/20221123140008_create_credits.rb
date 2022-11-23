class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits do |t|
      t.integer :borrowed_amount
      t.integer :duration
      t.float :nominal_rate
      t.integer :guarante_fee
      t.integer :application_fee
      t.float :insurance_rate

      t.timestamps
    end
  end
end

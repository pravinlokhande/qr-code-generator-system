class CreateQrgenerators < ActiveRecord::Migration[5.2]
  def change
    create_table :qrgenerators do |t|
      t.string :name
      t.datetime :last_otp_at
      t.datetime :current_otp
      t.string :otp_secret
      t.timestamps
    end
  end
end

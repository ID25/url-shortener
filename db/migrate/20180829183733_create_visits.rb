class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :link, foreign_key: true
      t.string :ip, default: ''
      t.string :country, default: ''
      t.string :city, default: ''

      t.timestamps
    end
  end
end

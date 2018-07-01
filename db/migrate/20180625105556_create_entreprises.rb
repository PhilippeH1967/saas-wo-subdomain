class CreateEntreprises < ActiveRecord::Migration[5.1]
  def change
    create_table :entreprises do |t|
      t.string  :name
      t.string  :street
      t.string  :town
      t.string  :zipcode
      t.string  :state
      t.string  :country
      t.integer :taxconfig
      t.string  :subdomain
      t.integer :owner_id

      t.timestamps
    end
  end
end


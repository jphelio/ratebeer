class CreateMemeberships < ActiveRecord::Migration
  def change
    create_table :memeberships do |t|
      t.integer :user_id
      t.integer :beer_club_id

      t.timestamps
    end
  end
end

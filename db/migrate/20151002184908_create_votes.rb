class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null:false
      t.integer :votable_direction, null:false
      t.references :votable, polymorphic: true, index: true, null:false

      t.timestamps null:false
    end
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true, null:false
      t.references :question, index: true, null:false
      t.string :text, null:false

      t.timestamps null:false
    end
  end
end

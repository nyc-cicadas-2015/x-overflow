class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true, null:false
      t.string :text, null:false
      t.string :title,null:false
      t.integer :best_answer_id

      t.timestamps null:false
    end
  end
end

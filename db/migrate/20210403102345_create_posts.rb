class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string  :title #短文
      t.text    :text  #長文
      t.integer :content_id,      null: false
      t.integer :meeting_time_id, null: false
      t.integer :progress_id,     null: false
      t.integer :information_id,  null: false
      t.integer :people_id,       null: false
      t.timestamps
    end
  end
end

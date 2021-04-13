class CreateMeetingTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_times do |t|

      t.timestamps
    end
  end
end

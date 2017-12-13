class AddCommentsToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :comments, foreign_key: true
  end
end

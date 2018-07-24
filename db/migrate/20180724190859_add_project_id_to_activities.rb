class AddProjectIdToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :project_id, :integer
  end
end

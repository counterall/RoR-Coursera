class AddLockVersionToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :lock_version, :integer
  end
end

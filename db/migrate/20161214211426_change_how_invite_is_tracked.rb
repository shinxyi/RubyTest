class ChangeHowInviteIsTracked < ActiveRecord::Migration
  def change
    remove_column :networks, :invited_by_me
  end
end

class MarkInvitationByWhome < ActiveRecord::Migration
  def change
    add_column :networks, :invited_by_me, :boolean, default: false
  end
end

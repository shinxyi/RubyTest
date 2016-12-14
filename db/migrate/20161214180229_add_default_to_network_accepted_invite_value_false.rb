class AddDefaultToNetworkAcceptedInviteValueFalse < ActiveRecord::Migration
  def change
    change_column :networks, :accepted_invite, :boolean, :default => false
  end
end

class NetworksController < ApplicationController
  def create
    user = User.find(params[:associate_id])
    Network.create(user: current_user, associate: user)
    flash[:alert] = "Invitation to connect has been sent to #{user.first_name} #{user.last_name}."
    redirect_to '/users'
  end

  def update
    user = User.find(params[:associate_id])
    network = Network.find_by(user: user, associate: current_user)
    network.update(accepted_invite: true)

    #this second network is to make it so that you can find networked people from
    #the opposite end... user is now in current_user's network as well
    Network.create(user: current_user, associate: user, accepted_invite: true)

    flash[:alert] = "You've accepted #{user.first_name} #{user.last_name}'s invitation to connect."
    redirect_to '/professional_profile'
  end

  def destroy
    user = User.find(params[:associate_id])
    network = Network.find_by(user: user, associate: current_user)
    network.destroy
    flash[:alert] = "#{user.first_name} #{user.last_name}'s invitation to connect has been cancelled."
    redirect_to '/professional_profile'
  end
end

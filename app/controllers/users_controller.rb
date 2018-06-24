class UsersController < ApplicationController
# pour pouvoir creer une annonce il faut etre identifié sauf pour la page show
  before_action :authenticate_user!, except: [:sign_up, :login]
# utilise la methode privée require_same_user de validation de l'utilisateur pour les modifications d'une annonce
  before_action :require_same_user, only: [:edit, :update]
  authorize_resource # utilisation de cancancan pour les droits -  voir models/ability.rb


  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    if @user.update_attribute(secure_params)
      redirect_to root_path, :notice => 'Updated'
    else
      redirect_to root_path, :alert => 'error! Modification aborted'
    end
  end

  private
  def secure_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end

# verifie si la personne connectée est celle qui a creee l'annonce
  def require_same_user
    # != veut n'est pas egal
    if current_user.id != @user.id
      flash[:danger] = "You don't have permission to do this action."
      redirect_to root_path
    end
  end
end
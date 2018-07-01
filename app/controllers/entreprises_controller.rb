class EntreprisesController < ApplicationController

  before_action :authenticate_user! # pour acceder il faut etre identifier

  # utilise la methode privée require_same_user de validation de l'utilisateur pour les modifications d'une annonce
  before_action :require_same_user, except: [:create, :new]
  authorize_resource # utilisation de cancancan pour les droits -  voir models/ability.rb

  def index
    @entreprises = Entreprise.all
  end

  def show
    @entreprise = Entreprise.find(params[:id])
  end

  def new
    @entreprise = Entreprise.new
    @entreprise.build_owner
  end

  def create

    @entreprise = Entreprise.new(entreprise_params)
    if @entreprise.save
      redirect_to entreprise_path, notice: "creation faite"
    else
      flash[:danger] = "creation refusée"
      render "entreprises/new"
    end
  end

  def update

  end
  private
  def entreprise_params

    params.require(:entreprise).permit(:subdomain, :name, :country, :town, :owner_id, :zipcode, :street, :state, :taxconfig )

  end

  # verifie si la personne connectée est celle qui a creee l'entreprise
  def require_same_user
    # != veut n'est pas egal
    if current_user.id != @entreprise.owner_id
      flash[:danger] = "You don't have permission to do this action."
      redirect_to root_path
    end
  end

end
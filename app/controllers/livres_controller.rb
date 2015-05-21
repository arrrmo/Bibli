class LivresController < ApplicationController

before_action :authenticate_user!
before_action :require_admin, only: [:new, :create, :edit, :update, :delete, :destroy] 
before_action -> {downcase_params (params)}, only: [:create, :update]

  def new
	@livre= Livre.new
	@livre.alire = true
	@livre.auteurs.build
	@livre.genres.build
	@livre.editeur= Editeur.new
  end

  def create
	auth= Auteur.find_or_initialize_by(prenom_auteur: params[:prenom_auteur], nom_auteur: params[:nom_auteur])
	edit = Editeur.find_or_initialize_by(nom_editeur: params[:nom_editeur])
	genre= Genre.find_or_initialize_by(nom_genre: params[:nom_genre])
	
		@livre= Livre.new(livre_params)
		 @livre.auteurs << auth
		 @livre.editeur= edit
		 @livre.genres << genre
		 
		 
		if @livre.save
			flash[:success] = t(:creation_success_message)
			redirect_to(:action => 'index')
		else
			flash.now[:error] = t(:creation_error_message)
			render 'new'
		end
  end

  def index
	if params[:titre] || params[:nom_auteur] || params[:prenom_auteur] || params[:nom_editeur] || params[:nom_genre] || params[:liste_alire]
		@livres = Livre.search_book(params).paginate(:page => params[:page], :per_page => 10)
	else
		@livres = Livre.paginate(:page => params[:page], :per_page => 10)
	end
  end

  def search
	if params[:nom_editeur]
	@results = Editeur.search_edit(params).paginate(:page => params[:page], :per_page => 10)
	elsif params[:nom_auteur] || params[:prenom_auteur]
	@results = Auteur.search_auth(params).paginate(:page => params[:page], :per_page => 10)
	elsif params[:nom_genre]
	@results = Genre.search_genre(params).paginate(:page => params[:page], :per_page => 10)
	elsif params[:liste_auth]
	@results = Auteur.paginate(:page => params[:page], :per_page => 10)
	elsif params[:liste_edit]
	@results = Editeur.paginate(:page => params[:page], :per_page => 10)
	elsif params[:liste_genre]
	@results = Genre.paginate(:page => params[:page], :per_page => 10)
	end
  end
  
  def show
	@livre = Livre.find(params[:id])
  end

  def edit
	@livre = Livre.find(params[:id])
  end 

  def update
	@livre = Livre.find(params[:id])
	  if @livre.update(livre_params)
		flash[:success] = t(:update_success_message)
	    redirect_to(:action => 'show', :id => @livre.id)
	  else
		flash[:error] = t(:update_error_message)
	   redirect_to(:action => 'edit', :id => @livre.id)
	  end
  end  

  def delete
	@livre = Livre.find(params[:id])
  end

  def destroy
	@livre = Livre.find(params[:id])
	# Livre.find(params[:id]).destroy
	flash[:success] = t(:delete_success_message)
  	redirect_to(:action => 'index')
  end
  
  def stats
	@nb_book=Livre.count
	@nb_auth=Auteur.count
	@nb_edit=Editeur.count
	@nb_genre=Genre.count
	@nb_user=User.all.count
  end
	def downcase_params (params)
		params[:livre][:auteurs_attributes].each do |key,val|
			val.each do |k,v|
				v.downcase!
				end
		end
		
		params[:livre][:editeur_attributes][:nom_editeur].downcase!
		params[:livre][:genres_attributes].each do |key,val|
				val.each do |k,v|
				v.downcase!
				end
		end
		params[:livre][:langue].downcase!
		params[:livre][:titre].downcase!
		
		 #params.merge({prenom_auteur: auth.prenom_auteur, nom_auteur: auth.nom_auteur, nom_editeur: edit.nom_editeur, nom_genre: genre.nom_genre})
  end
  
	private
	
	def livre_params
		params.require(:livre).permit(:titre, :editeur_id, :description, :annee, :langue, :isbn, :alire, auteurs_attributes: [:id, :prenom_auteur, :nom_auteur],genres_attributes: [:id, :nom_genre], editeur_attributes: [:id, :nom_editeur])
	end
end
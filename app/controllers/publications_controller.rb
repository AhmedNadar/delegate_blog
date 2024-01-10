class PublicationsController < ApplicationController

  def index
    @publications = Publication.includes(:publishable, :author).all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  # def new
  #   @publication = Publication.new
  #   @publication.build_publishable
  # end
  def new
    @publication = Publication.new
    @publication.publishable_type = 'Post'  # Set the publishable_type first
    @publication.build_publishable          # Then build the publishable
  end


  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to @publication, notice: 'Publication was successfully created.'
    else
      render :new
    end
  end


  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to @publication, notice: 'Publication was successfully updated.'
    else
      render :edit
    end
  end

  private

  def publication_params
    # params.require(:publication).permit(:author_id, publishable_attributes: [:id, :title, :content])
    # params.require(:publication).permit(:author_id, publishable_attributes: [:id, :title, :body])
    params.require(:publication).permit(:author_id, :publishable_type, publishable_attributes: [:id, :title, :body])

  end
end

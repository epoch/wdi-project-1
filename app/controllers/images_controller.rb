class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find params[:id]
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create image_params
    @image.update(:user_id => @current_user.id)
    redirect_to "/library/images/#{ @image.id }"
  end

  def edit
    @image = Image.find params[:id]
  end

  def update
    image = Image.find params[:id]
    image.update image_params
    redirect_to "/library/images/#{ image.id }"
  end

  def destroy
    image = Image.find params[:id]
    image.destroy
    redirect_to library_path
  end

  private
  def image_params
    params.require(:image).permit(:title, :source, :description, :image_url)
  end
end

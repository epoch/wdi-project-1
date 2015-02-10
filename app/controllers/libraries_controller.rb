class LibrariesController < ApplicationController
  def show
    user = User.find @current_user.id
    @user_posts = user.posts
    @favourite_posts = user.library.posts.where.not(:user_id => @current_user.id)

    @user_images = user.images
    @favourite_images = user.library.images.where.not(:user_id => @current_user.id)
  end

  def add
    post = Post.find params[:id]
    @current_user.library.posts << post
    redirect_to post_path
  end

  def remove
    lib_entry = Post.find params[:id]
    # this isnt deleting the post from the array!
    @current_user.library.posts.delete(lib_entry)
    # this needs to look through the lib array and remove the relevant post (given we're on the show page, @post.id should be fine for this)
    redirect_to post_path
  end

   def remove_from_lib
    lib_entry = Post.find params[:id]
    # this isnt deleting the post from the array!
    @current_user.library.posts.delete(lib_entry)
    # this needs to look through the lib array and remove the relevant post (given we're on the show page, @post.id should be fine for this)
    redirect_to library_path
  end

  def show_post
    # needs to show the particular post
    @post = Post.find params[:id]
  end

  def add_image
    image = Image.find params[:id]
    @current_user.library.images << image
    redirect_to image_path
  end

  def remove_image
    lib_entry = Image.find params[:id]
    @current_user.library.images.delete(lib_entry)
    redirect_to image_path
  end

  def show_image
    @image = Image.find params[:id]
  end

  def remove_image_from_lib
    lib_entry = Image.find params[:id]
    @current_user.library.images.delete(lib_entry)
    redirect_to library_path
  end
end

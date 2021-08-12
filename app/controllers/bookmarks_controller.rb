class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)

    if @bookmark.save
      redirect_to list_path(params[:id]), notice: 'Your new bookmark was created.'
    else
      render :new
    end
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end

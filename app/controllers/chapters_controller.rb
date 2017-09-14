class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :update]

  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new
  end

  def show

  end

  def create
    @chapter = Chapter.new(chapter_params)
    @book = Book.find(params[:book_id])
    @chapter.book_id = @book.id

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @book, notice: 'Chapter was successfully added' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :content, :book_id)
  end

end

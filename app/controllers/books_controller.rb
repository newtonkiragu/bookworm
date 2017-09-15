class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy, :remove_from_list]

  def add_to_list
    @book = Book.find(params[:id])
    new_user = current_user.id.to_s
    if @book.reading_list == nil
      @book.reading_list = new_user
    else
      @book.reading_list.concat("," + new_user)
    end
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_from_list
    @book = Book.find(params[:book_id])
    user_ids = @book.reading_list.split(",")
    if user_ids.include? current_user.id.to_s
      user_ids.delete(current_user.id.to_s)
      @book.reading_list = user_ids.join
      @book.save
      redirect_to current_user, notice: 'Book was successfully removed from reading list.'
    end
  end

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @books = Book.search(params[:search])

  end

  # GET /books/1
  # GET /books/1.json
  def show
    @user = User.find(@book.user_id)
    @chapters = @book.chapters.order("title").page(params[:page]).per_page(1)
    @book = Book.find(params[:id])
    impressionist(@book, "message...") # 2nd argument is optional
    @comments = Comment.all
    if current_user == nil
      redirect_to new_user_registration_path
    end
  end

  # GET /books/new
  def new
    if current_user == nil
      redirect_to new_user_registration_path
    end
    @books = Book.all
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @user = current_user
    @book = @user.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @book = Book.find(params[:id])
    @book.upvote_by current_user
    redirect_to book_path
  end

  def downvote
   @book = Book.find(params[:id])
   @book.downvote_by current_user
   redirect_to book_path
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:picture, :title, :author, :language, :category, :description, :user_id, :status, :reading_list, :attachment)
    end
end

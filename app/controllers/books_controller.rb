class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
       flash[:notice] = "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @mybook = Book.find(params[:id])
    @user = @mybook.user
  end

  def edit
    @mybook = Book.find(params[:id])
    if @mybook.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @mybook = Book.find(params[:id])
  if @mybook.update(book_params)
    redirect_to book_path(@mybook.id)
    flash[:notice] = "You have update book successfully."
  else
    render :edit
  end
  end

  def destroy
    @mybook = Book.find(params[:id])
    @mybook.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

class BooksController < ApplicationController
 
 def new
 	@book = Book.new
 	@books = Book.all
 end

 def create
 	@book = Book.new(book_params)
 	if @book.save
 		redirect_to book_path(@book.id), notice:"Book was successfully created."
 	else
 		@books = Book.all
 		render :new
 	end
 end

 def top
 end

 def show
 	@book = Book.find(params[:id])
 	render :new
 end

 def edit
 	@book = Book.find(params[:id])
 end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

 private

 def book_params
 	params.require(:book).permit(:title, :body)
 end


end

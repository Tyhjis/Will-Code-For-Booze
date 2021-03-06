class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  # def index
  #   @books = Book.all
  # end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new book_params
    generatekey
    @book.referencetype='Book'
    if @book.save
      redirect_to references_path, notice: "Book type reference created"
    else
      render :new
    end
  end

  def generatekey
    if @book.key.nil? or @book.key.empty?
      @book.key = @book.keygen
    end
  end

  #def create
  #  @article = Article.new params.require(:article).permit(:author, :title, :journal, :year, :volume, :numbe, :pagestart, :pageend, :month, :note, :key)
  #  if @article.key.nil?
  #    @article.key = @article.keygen
  #  end
  #  @article.referencetype="article"
  #  if @article.save
  #    redirect_to references_path
  #  else
  #    render :new
  #  end
  #end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      generatekey
      if @book.update(book_params)
        format.html { redirect_to references_path, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  # def destroy
  #   @book.destroy
  #   respond_to do |format|
  #     format.html { redirect_to books_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:author, :title, :publisher, :editor, :year, :booktitle, :series, :address, :volume, :number, :pagestart, :pageend, :month, :note, :key)
      # generatekey
    end
end

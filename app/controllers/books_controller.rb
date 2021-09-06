# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.order(:id).page(params[:page])
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: t('controllers.common.notice_create', name: Book.model_name.human) }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: t('controllers.common.notice_update', name: Book.model_name.human) }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: t('controllers.common.notice_destroy', name: Book.model_name.human) }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.eager_load(comments: :user).find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end
end

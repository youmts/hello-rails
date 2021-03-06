class EntriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_blog, only: [:new, :create]
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /blogs/1/entries/1
  def show
    @comment = Comment.new
  end

  # GET /blogs/1/entries/new
  def new
    @entry = @blog.entries.new
  end

  # GET /blogs/1/entries/1/edit
  def edit
  end

  # POST /blogs/1/entries
  def create
    @entry = @blog.entries.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1/entries/1
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1/entries/1
  def destroy
    blog = @entry.blog
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to blog, notice: 'Entry was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end

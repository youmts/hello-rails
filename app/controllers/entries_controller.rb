class EntriesController < ApplicationController
  before_action :set_blog
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /blogs/1/entries/1
  # GET /blogs/1/entries/1.json
  def show
  end

  # GET /blogs/1/entries/new
  def new
    @entry = Entry.new
  end

  # GET /blogs/1/entries/1/edit
  def edit
  end

  # POST /blogs/1/entries
  # POST /blogs/1/entries.json
  def create
    @entry = @blog.entries.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to [@blog, @entry], notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1/entries/1
  # PATCH/PUT /blogs/1/entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to [@blog, @entry], notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1/entries/1
  # DELETE /blogs/1/entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to @blog, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_entry
      @entry = @blog.entries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end

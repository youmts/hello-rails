class AttachmentsController < ApplicationController
  before_action :set_blog
  before_action :set_entry
  before_action :set_attachment, only:[:destroy]

  def index
    @attachments = @entry.attachments
  end

  def new
    @attachment = @entry.attachments.new
  end

  def create
    @attachment = @entry.attachments.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to [@blog, @entry], notice: 'Attachment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to [@blog, @entry], notice: 'Attachment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_entry
      @entry = @blog.entries.find(params[:entry_id])
    end

    def set_attachment
      @attachment = @entry.attachments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:file)
    end
end

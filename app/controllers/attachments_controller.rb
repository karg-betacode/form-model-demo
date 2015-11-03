class AttachmentsController < ApplicationController
  def new
    @form = UploadAttachmentForm.build(params)
  end

  # upload failure scenario not working :(
  def create
    @form = UploadAttachmentForm.build(params)

    if @form.save
      flash[:notice] = "Attachment saved"
      redirect_to new_attachment_path
    else
      flash.now[:notice] = @form.get_errors
      render "new"
    end
  end
end

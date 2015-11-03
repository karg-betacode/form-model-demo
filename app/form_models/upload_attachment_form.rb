class UploadAttachmentForm
  include ActiveAttr::TypecastedAttributes
  include ActiveAttr::BasicModel
  include ActiveAttr::MassAssignment

  attribute :target_folder, type: String
  attribute :color_tag,     type: String
  attribute :file,          type: String

  def self.build(params)
    inner_params = params[model_name.param_key] || {}
    opts = { color_tag: Color.default }.merge inner_params # workaround, seems like active_attr TypecastedAttribute doesnt support default
    form = UploadAttachmentForm.new(opts)
    # some how set request file into the model
    form
  end

  def colors
    Color.my_pallete
  end

  def save
    build_folder
    build_attachment
    @attachment.save && @folder.save
  end

  def valid?
    @attachment.valid? && @folder.valid?
  end

  # combine all errors from multiple entities
  def get_errors
    @errors = []
    @errors.concat @attachment.errors.full_messages unless @attachment.valid?
    @errors.concat @folder.errors.full_messages     unless @folder.valid?
  end

  def build_attachment
    @attachment = @folder.attachments.build
    @attachment.file = file  # assuming it integrates already with uploader like CarrierWave etc
    @attachment.color_tag = color_tag
  end

  def build_folder
    @folder = Folder.find_or_initialize_by(path: target_folder)
  end
end
# frozen_string_literal: true

# Ckeditor Attachment file class
class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    url: '/ckeditor_assets/attachments/:id/:filename',
                    path: path,

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 100.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end

  private 
  
  def path
    ':rails_root/public/ckeditor_assets/attachments/:id/:filename'
  end
end

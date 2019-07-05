# frozen_string_literal: true

# Ckeditor Picture class
class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    url: url,
                    path: path,
                    styles: { content: '800>', thumb: '118x100#' }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 2.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end

  private

  def url
    '/ckeditor_assets/pictures/:id/:style_:basename.:extension'
  end

  def path
    ':rails_root/public/ckeditor_assets/pictures
      /:id/:style_:basename.:extension'
  end
end

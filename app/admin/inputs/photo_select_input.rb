class PhotoSelectInput < Formtastic::Inputs::StringInput

  include Rails.application.routes.url_helpers

  def file
    @object.send(method)
  end

  def file_attachment
    @object.send("#{method}_attachment")
  end

  def association_primary_key
    "#{method}_id"
  end

  def file_class
    if file.present?
      file.class
    else
      self.class.name.match(/\A(?<model>\w+)SelectInput/)[:model].constantize
    end
  end

  def file_name
    file_class.name
  end

  def index_url
    url_for [:admin, file_class.table_name.to_sym, only_path: true]
  end

  def file_route_key
    file_class.model_name.i18n_key
  end

  def input_html_options
    {
      data: {
        url:      index_url,
        resource: file_name
      }
    }.deep_merge(super)
  end

  def to_html
    input_wrapping do
      label_html <<
      field_html <<
      image_preview_html
    end
  end

  def field_html
    builder.text_field(association_primary_key, input_html_options)
  end

  def image_preview_html
    if image_stored?
      %Q{
        <p class="image-preview">
          #{template.image_tag(image.thumb('x100').url)}
          <br>
          #{template.link_to('Original Image', image.url, target: '_blank')}
        </p>
      }.html_safe
    end
  end

  def label_html
    super.tap do |label|
      links = [template.link_to('New', [:new, :admin, file_route_key], target: '_blank', class: 'photo-picker-button')]

      if image_stored? && show_remove_link? && file_attachment.present?
        links.unshift template.link_to('Remove', [:admin, file_attachment], method: :delete, class: 'photo-picker-button')
      end

      label.insert -9, links.join
    end
  end

  def image_stored?
    file.try(:image_stored?)
  end

  def image
    file.try(:image)
  end

  def show_remove_link?
    @object.persisted? && !required?
  end

end

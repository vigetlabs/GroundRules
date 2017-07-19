class ColonelKurtzInput
  include Formtastic::Inputs::Base

  # Taken from Formtastic::Inputs::HiddenInput
  def input_html_options
    super.merge(required: nil).merge(autofocus: nil)
  end

  def editor_options
    options.fetch(:editor, {}).reverse_merge({
      id:    nil,
      class: 'colonel-kurtz-editor'
    })
  end

  def editor_html_options
    editor_options.dup.tap do |options|
      blocks = options.delete(:blocks)

      if blocks.present?
        options.merge!('data-col-kurtz-blocks' => blocks.to_json)
      end
    end
  end

  def to_html
    input_wrapping do
      label_html <<
      editor_div <<
        builder.hidden_field(method, input_html_options)
    end
  end

  private

  def editor_div
    template.content_tag('div', nil, editor_html_options)
  end
end

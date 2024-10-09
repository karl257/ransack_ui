module RansackUI
  module ViewHelpers
    # Renders the search form
    def ransack_ui_search(options = {})
      render 'ransack_ui/search', options: options
    end

    # Add new condition field
    def link_to_add_fields(name, f, type, options = {})
      new_object = f.object.send("build_#{type}")
      fields = f.send("#{type}_fields", new_object, child_index: "new_#{type}") do |builder|
        render "ransack_ui/#{type}_fields", f: builder, options: options
      end

      link_to nil, { class: 'add_fields btn btn-small btn-primary', 'data-field-type': type, 'data-content': fields }.merge(options) do
        "#{plus_icon}<span>#{name}</span>".html_safe
      end    
    end

    # Remove condition field
    def link_to_remove_fields(name, f, options = {})
      link_to trash_icon.html_safe, nil, { class: 'remove_fields btn btn-mini btn-danger' }.merge(options)
    end

    private

    # SVG icon for Bootstrap 'plus' icon
    def plus_icon
      '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v6h6a.5.5 0 0 1 0 1h-6v6a.5.5 0 0 1-1 0v-6H1a.5.5 0 0 1 0-1h6v-6A.5.5 0 0 1 8 1z"/>
      </svg>'
    end

    # SVG icon for Bootstrap 'trash' icon
    def trash_icon
      '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
        <path d="M5.5 5.5A.5.5 0 0 1 6 5h4a.5.5 0 0 1 .5.5V6h1v8a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V6h1v-.5zM3.5 3a1 1 0 0 0-1 1V4h11v-.5a1 1 0 0 0-1-1H3.5zm2-1A1.5 1.5 0 0 1 7 1h2a1.5 1.5 0 0 1 1.5 1h-5z"/>
      </svg>'
    end
  end
end

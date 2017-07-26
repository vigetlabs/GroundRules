module ActiveAdmin
  module Reorderable
    module TableMethods

      private

      def reorder_handle_for(resource)
        reorder_url, query_params = resource_path(resource).split '?', 2
        reorder_url += "/reorder"
        reorder_url += "?" + query_params if query_params
        span(reorder_handle_content, :class => 'reorder-handle', 'data-reorder-url' => reorder_url)
      end

    end
  end
end

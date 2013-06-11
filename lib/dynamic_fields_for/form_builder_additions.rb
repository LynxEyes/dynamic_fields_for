module ActionView
  module Helpers

    class FormBuilder
      # =============================================================================
      def dynamic_fields_for record_name, record_object = nil, options = {}, &block
        options, record_object = record_object, nil if record_object.is_a?(Hash) && record_object.extractable_options?

        model         = self.object.class
        new_record    = model.reflect_on_association(record_name.to_sym).klass.new
        wrapped_block = wrap_dynamic_fields_for_block options, &block

        options[:include_id] ||= false
        human_record_name = model.human_attribute_name record_name
        add_text = options.delete(:add_text) || "+ add #{human_record_name.singularize}"

        tmpl   = fields_for(record_name, new_record, options.merge({child_index: '${idx}'}), &wrapped_block).gsub("___idx__","_${idx}_")
        fields = fields_for(record_name, record_object, options, &wrapped_block)

        <<-HTML.html_safe
          <fieldset>
            <legend>#{human_record_name}</legend>
            <ul>#{fields}</ul>
            <script type='text/tmpl'>#{tmpl}</script>
            <a href='#' class='add dynamic_fields'>#{add_text}</a>
          </fieldset>
        HTML
      end

      # =============================================================================
      private
        # ===========================================================================
        def wrap_dynamic_fields_for_block options = {}, &block
          include_id = options[:include_id].nil? ? true : options[:include_id]
          destroy_text = options.delete(:destroy_text) || @template.t(:destroy)

          Proc.new do |form|
            <<-HTML.html_safe
              <li>
                #{@template.with_output_buffer{block.call(form)}}
                #{form.hidden_field :id if include_id}
                #{form.hidden_field :_destroy}
                #{@template.link_to destroy_text, '#', :class => 'destroy dynamic_fields'}
              </li>
            HTML
          end
        end
    end # class FormBuilder

  end # module Helpers
end # module ActionView


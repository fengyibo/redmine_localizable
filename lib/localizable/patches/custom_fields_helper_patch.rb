require 'custom_fields_helper'

module Localizable
  module Patches
    module CustomFieldsHelperPatch
      def self.included(base) # :nodoc
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)

        # Same as typing in the class
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in developmen
          alias_method_chain :show_value, :localizable

          def translate(original_value, type)
            if Setting["plugin_localizable"]
              if Setting["plugin_localizable"]["locales"]
                if Setting["plugin_localizable"]["locales"][type]
                  if Setting["plugin_localizable"]["locales"][type][original_value]
                    unless Setting["plugin_localizable"]["locales"][type][original_value][User.current.language.to_s].blank?
                      value = Setting["plugin_localizable"]["locales"][type][original_value][User.current.language.to_s]
                    end
                  end
                end
              end
            end

            return(value)
          end
        end
      end


      module ClassMethods; end


      module InstanceMethods

        # Return a string used to display a custom value
        def show_value_with_localizable(custom_value, html=true)
          if !translate(custom_value.custom_field.default_value, :defaults).nil?
            custom_value.custom_field.default_value = translate(custom_value.custom_field.default_value, :defaults)
          end

          format_object(custom_value, html)
        end
      end
    end
  end
end

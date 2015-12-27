module Localizable
  module Patches
    module IssuePatch
      def self.included(base) # :nodoc
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)

        # Same as typing in the class
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in developmen
          alias_method_chain :editable_custom_field_values, :localizable
        end
      end

      module ClassMethods; end


      module InstanceMethods

        # Returns the custom_field_values that can be edited by the given user
        def editable_custom_field_values_with_localizable(user=nil)
          visible_values = visible_custom_field_values(user).reject do |value|
            read_only_attribute_names(user).include?(value.custom_field_id.to_s)
          end
          visible_values.each do |vv|
            if !translate(vv.custom_field.description, :descriptions).nil?
              vv.custom_field.description = translate(vv.custom_field.description, :descriptions)
            end
            if !translate(vv.custom_field.default_value, :defaults).nil?
              vv.custom_field.default_value = translate(vv.custom_field.default_value, :defaults)
            end
          end
          visible_values
        end

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
  end
end

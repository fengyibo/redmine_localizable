module Localizable
  module Patches
    module IssueStatusPatch
      def self.included(base) # :nodoc
        base.send(:include, InstanceMethods)

        # Same as typing in the class
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in developmen
          
          include TranslateHelper
          def action_loc
            translate_value(self.action, :status_actions)
          end
        end
      end

      module InstanceMethods

      end
    end
  end
end

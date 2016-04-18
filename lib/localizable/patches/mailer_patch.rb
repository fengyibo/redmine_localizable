module Localizable
  module Patches
    module MailerPatch

      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          alias_method_chain :mail, :localizable

        end
      end

      module InstanceMethods

        def mail_with_localizable(headers={}, &block)
          previous_language = current_language

          recipients_by_language = {}
          [:to, :cc, :bcc].each do |key|
            Array.wrap(headers[key]).each do |recipient|
              lang = (recipient.is_a?(Principal) ? recipient.language : previous_language)
              recipients_by_language[lang] ||= { key => [] }
              recipients_by_language[lang][key] << recipient
            end
          end

          m = nil

          recipients_by_language.each do |language, recipients|
            set_language_if_valid language

            @_message = Mail::Message.new
            mail_headers = headers.dup

            mail_headers[:to] = recipients[:to]
            mail_headers[:cc] = recipients[:cc]
            mail_headers[:bcc] = recipients[:bcc]

            m = mail_without_localizable(mail_headers, &block)
            m.deliver
          end

          m[:to] = nil
          m[:cc] = nil
          m[:bcc] = nil

          set_language_if_valid previous_language

          m
        end

      end

    end
  end
end

Mailer.send(:include, Localizable::Patches::MailerPatch) unless Mailer.included_modules.include?(Localizable::Patches::MailerPatch)

#
#  AppDelegate.rb
#  MailTesterOSX
#
#  Created by Nicolas on 18/11/12.
#  Copyright 2012 Nicolas. All rights reserved.
#
require 'rubygems'
require 'mail_tester'

class AppDelegate
    attr_accessor :window
    attr_accessor :username_field, :password_field, :server_pop3_field, :server_smtp_field
    attr_accessor :message_field, :smtp_status_field, :message_id_field, :pop3_after_field

    def applicationDidFinishLaunching(a_notification)
    end

    # Action use by buttons
    def prepare_server(sender)
        @server = Mail::Tester::MailTester.new(username_field.stringValue, password_field.stringValue)
        server_pop3_field.stringValue = @server.pop3_hostname
        server_smtp_field.stringValue = @server.smtp_hostname
    end

    def check_pop3_button(sender)
        check_pop3
    end

    def check_smtp_button(sender)
        check_smtp
    end

    def check_servers_button(sender)
        check_servers
    end

    # Action to use
    def check_pop3
        (message, message_count) = @server.check_mail
        message_field.stringValue = message
    end

    def check_smtp
        (smtp_status, id) = @server.check_smtp
        smtp_status_field.stringValue = smtp_status
        message_id_field.stringValue = id.to_s
    end

    def check_servers
        check_pop3
        check_smtp
        (message, message_count) = @server.check_mail
        pop3_after_field.stringValue = message
    end
end

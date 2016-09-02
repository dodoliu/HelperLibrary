require "mail"



class MailHelper
  # attr_accessor :to, :form, :subject, :text, :html, :attach_file, :acctch_folder

  def initialize
    Mail.defaults do
  delivery_method :smtp, { 
    :address => 'smtp.gmail.com',
    :port => 587,
    :user_name => ENV['GMAIL_SMTP_USER'],
    :password => ENV['GMAIL_SMTP_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end
  end


  def self.send_mail
    puts ENV['mail_user']
    puts ENV['mail_pwd']
    # mail = Mail.new do
    #   from    'liudongyue1988@163.com'
    #   to      'liudongyue1987@163.com'
    #   subject 'testaaaa'
    #   # body    File.read('body.txt')
    # end
    # puts mail.to_s
    # mail.deliver
  end


end
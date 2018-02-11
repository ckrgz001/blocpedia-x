ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = { 
    :address               =>  'smtp.sendgrid.net',
    :port                  =>  '587',
    :authentication        =>  :plain,
    :user_name             =>  'app87911006@heroku.com',
    :password              =>  'jo8x5rq48754',
    :domain                =>  'heroku.com',
    :enable_starttls_auto  =>   true
}
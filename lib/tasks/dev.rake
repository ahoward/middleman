namespace :dev do

  desc "Create a dummy message using curl and localhost"
  task :add_message do
    sh %{curl --silent --data "email=#{ENV['MMUSER']||ENV['USER']}@redhat.com&text=foo&bug=#{10000+rand(2000)}" http://0.0.0.0:3000/messages.text}
  end

end

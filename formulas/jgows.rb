class Jgows < Formula
  desc "Scala Native Workshop"
  homepage "https://github.com/Tapad/scala-native-workshop"

  credentials_file = "#{ENV['HOME']}/.ivy2/.credentials"
  got_ivy_credentials = File.file?(credentials_file)
  if !got_ivy_credentials
    abort("Please provide your Nexus credentials in #{credentials_file}")
  end

  username=File.readlines(credentials_file).map { |line| if line =~ /user=(.+)/i; $1; end }.find{|x|!x.nil?}
  password=File.readlines(credentials_file).map { |line| if line =~ /password=(.+)/i; $1; end }.find{|x|!x.nil?}

  if username.nil? || password.nil?
    abort("No credentials found in #{credentials_file}")
  end

  username_encoded = URI.encode(username)
  password_encoded = URI.encode(password)

  url "https://#{username}:#{password}@nexus.tapad.com/repository/releases/com/tapad/workshop/jgows/0.1.5/jgows-0.1.5.zip"
  sha256 "06b7bae0b46e961321940f73bf83a8697f03c7632982c98bb3162668ecadc7d9"
  version "0.1.5"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=0.1.5", "BUILDPATH=#{buildpath}", "CREDENTIALS=#{credentials_file]}"
    bin.install "app"
  end

  test do
    system "#{bin}/app", "--version"
  end
end
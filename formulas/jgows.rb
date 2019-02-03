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

  url "https://#{username}:#{password}@nexus.tapad.com/repository/releases/com/tapad/workshop/jgows/0.1.4/jgows-0.1.4.zip"
  sha256 "6c3768e937594f2d7a4afda9ecf88e89664f2399968ec3b922c4ad4bdd422d92"
  version "0.1.4"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=0.1.4", "BUILDPATH=#{buildpath}"
    bin.install "app"
  end

  test do
    system "#{bin}/app", "--version"
  end
end
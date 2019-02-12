class Tws < Formula
  desc "Scala Native Workshop for tws"
  homepage "https://github.com/Tapad/scala-native-workshop"

  @@credentials_file = "#{ENV['HOME']}/.ivy2/.credentials"
  got_ivy_credentials = File.file?(@@credentials_file)
  if !got_ivy_credentials
    abort("Please provide your Nexus credentials in #{@@credentials_file}")
  end

  username=File.readlines(@@credentials_file).map { |line| if line =~ /user=(.+)/i; $1; end }.find{|x|!x.nil?}
  password=File.readlines(@@credentials_file).map { |line| if line =~ /password=(.+)/i; $1; end }.find{|x|!x.nil?}

  if username.nil? || password.nil?
    abort("No credentials found in #{@@credentials_file}")
  end

  url "https://#{username}:#{password}@nexus.tapad.com/repository/releases/com/tapad/workshop/tws/0.0.11/tws-0.0.11.zip"

  sha256 "0ce1577618d87a4666fd9655f9016df34885d860d89f0898f19428ec0b7871fc"
  version "0.0.11"

  depends_on "curl" => "7.56.0"
  depends_on "llvm" => :build
  depends_on "bdw-gc"
  depends_on "re2"
  depends_on "libidn"

  def install
    system "make", "VERSION=0.0.11", "BUILDPATH=#{buildpath}", "CREDENTIALS=#{@@credentials_file}"
    bin.install "tws"
  end

  bottle do
    root_url "https://#{username}:#{password}@nexus.tapad.com/repository/releases/com/tapad/workshop/tws/0.0.11/"
    cellar :any
    rebuild 1
    sha256 "d5a77747fe7226494b9f789901d9a56123dcbeba4307d1af26db214707ab0bd3" => :high_sierra
  end
end

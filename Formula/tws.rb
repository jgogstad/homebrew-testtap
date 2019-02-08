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

  url "https://#{username}:#{password}@nexus.tapad.com/repository/releases/com/tapad/workshop/tws/0.0.9/tws-0.0.9.zip"

  sha256 "f6cb27f94f49663b6357527b4b698735fb9a12a399d29ff0473a8163253e8deb"
  version "0.0.9"

  depends_on "curl" => "7.56.0"
  depends_on "llvm" => :build
  depends_on "bdw-gc"
  depends_on "re2"
  depends_on "libidn"

  def install
    system "make", "VERSION=0.0.9", "BUILDPATH=#{buildpath}", "CREDENTIALS=#{@@credentials_file}", PREFIX="#{prefix}"
    bin.install "tws"
  end

  test do
    system "#{bin}/tws", "--version"
  end
end
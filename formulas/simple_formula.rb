class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  @@version = "0.1.0-SNAPSHOT"

  url "http://github.com/tapad/tcloud-#{@@version}.zip"
  sha256 "f8478effbe5e4ba110dea4d36d76ea55ca7b2f15e0c0d8195ea88a664a3a017c"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "SCALA_NATIVE_VERSION=0.3_2.11", "VERSION=#{@@version}", "BUILDPATH=#{buildpath}"
    bin.install "tcloud"
    # system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/tcloud", "--version"
  end
end
class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  @@version = "0.1.0-SNAPSHOT"

  url "http://github.com/tapad/tcloud-#{@@version}.zip"
  sha256 "31e9b8030c414a865ac3f5730b0f6bec3765e8a89924d364e53d2055f409c11b"

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
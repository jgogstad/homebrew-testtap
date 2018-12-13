class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  url "http://github.com/tapad/tcloud-whatever.zip"
  sha256 "b21dd886d982e1ed4f887a27db263d71dc74d6f257ea11031f29e537059fd06a"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "SCALA_NATIVE_VERSION=0.3_2.11", "VERSION=whatever", "BUILDPATH=#{buildpath}"
    bin.install "tcloud"
    # system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/tcloud", "--version"
  end
end
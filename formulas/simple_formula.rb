class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  url "http://github.com/tapad/tcloud-whatever.zip"
  sha256 "2a1e05edcfd313092fc661c6fab759f8f96f44de585ba301c08afd41414f1b26"

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
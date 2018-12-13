class Tcloud < Formula
  desc "Tapad Cloud CLI"
  homepage "https://github.com/Tapad/tcloud"

  @@version = "{{ version }}"

  url "http://github.com/tapad/tcloud-#{@@version}.zip"
  sha256 "{{ checksum }}"

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
class Tcloud < Formula
  desc "Don't touch this"
  homepage "https://example.com"

  @@version = "1.0"

  url "http://github.com/example/tcloud-#{@@version}.zip"
  sha256 "{{ checksum }}"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=#{@@version}", "BUILDPATH=#{buildpath}"
    bin.install "foo"
  end

  test do
    system "#{bin}/foo", "--version"
  end
end

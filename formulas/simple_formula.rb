class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  url "http://github.com/tapad/app-whateverr.zip"
  sha256 "926aab256e741d988ce5682f5ab7a2d5de027be8c52b570b47342e2e9ef9b51f"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=whateverr"
    bin.install "myapp"
  end

  test do
    system "#{bin}/myapp", "--version"
  end
end
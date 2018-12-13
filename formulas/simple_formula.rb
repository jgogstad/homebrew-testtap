class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  url "http://github.com/tapad/app-whateverr.zip"
  sha256 "058cf60080dba4961e2b566b66f03fdc89f973890ee97db723c4e7fd8027e03b"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=whateverr"
    bin.install "myapp"
  end

  test do
    system "#{bin}/myapp", "--version"
  end
end
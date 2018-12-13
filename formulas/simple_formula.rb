class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  url "http://github.com/tapad/app-0.1.0-SNAPSHOT.zip"
  sha256 "1d44650fd87f5f2174a5ffc1ad480eb5696c5e091120cf00de2cc87563633940"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=0.1.0-SNAPSHOT"
    bin.install "myapp"
  end

  test do
    system "#{bin}/myapp", "--version"
  end
end
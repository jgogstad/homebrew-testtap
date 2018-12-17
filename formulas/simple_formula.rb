class Tcloud < Formula
  desc "My test formula"
  homepage "https://github.com/Tapad/sbt-homebrew"

  url "http://github.com/tapad/app-0.1.0-SNAPSHOT.zip"
  sha256 "6400b7ecfcefd738f81c21110ab5fe697454ae91bf9bc284d7097ced17dcd673"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=0.1.0-SNAPSHOT"
    bin.install "myapp"
  end

  test do
    system "#{bin}/myapp", "--version"
  end
end
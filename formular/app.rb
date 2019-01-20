class App < Formula
  desc "Scala Native Workshop"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "http://localhost:8080/0.1.0-SNAPSHOT/app.zip"
  sha256 ""

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=0.1.0-SNAPSHOT", "BUILDPATH=#{buildpath}"
    bin.install "app"
  end

  test do
    system "#{bin}/app", "--version"
  end
end
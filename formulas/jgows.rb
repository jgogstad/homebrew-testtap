class Jgows < Formula
  desc "Scala Native Workshop"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "https://nexus.tapad.com/repository/releases/com/tapad/workshop/jgows/11/jgows-11.zip"
  sha256 "79b597484e5b6920312c140522e184b0046f3c360b1a4d785eff63dc6feec414"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=11", "BUILDPATH=#{buildpath}"
    bin.install "app"
  end

  test do
    system "#{bin}/app", "--version"
  end
end
class Jgows < Formula
  desc "Scala Native Workshop"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "https://nexus.tapad.com/repository/releases/com/tapad/workshop/jgows/0.1.2/jgows-0.1.2.zip"
  sha256 "aa58742beba36f3b00a4124e4b852671d8616acc256c532ed0ef18bb36a51546"
  version "0.1.2"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=0.1.2", "BUILDPATH=#{buildpath}"
    bin.install "app"
  end

  test do
    system "#{bin}/app", "--version"
  end
end
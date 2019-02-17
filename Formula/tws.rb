class Tws < Formula
  desc "Scala Native Workshop for tws"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "http://localhost:8080/tws/0.0.12/zips/tws.zip"

  sha256 "934765e48986260925a8b74f9b251c0f3359531703ff157549973cc78575b5d4"
  version "0.0.12"

  depends_on "curl"
  depends_on "libidn"
  depends_on "llvm" => :build
  depends_on "bdw-gc" => :build

  def install
      system "make", "VERSION=0.0.12", "BUILDPATH=#{buildpath}"
      bin.install "tws"
  end
end
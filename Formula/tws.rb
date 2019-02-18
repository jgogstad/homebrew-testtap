class Tws < Formula
  desc "Scala Native Workshop for tws"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "http://localhost:8080/tws/0.5.1/zips/tws.zip"

  version "0.5.1"
  sha256 "849bcb182f3ff62ced45c8d40e920d86e5dacb0a9f6bbeaf6208932ef02dbf7c"

  depends_on "bdw-gc" => :build
  depends_on "llvm" => :build
  depends_on "curl"
  depends_on "libidn"
  depends_on "re2"

  def install
      system "make", "VERSION=0.5.1", "BUILDPATH=#{buildpath}"
      bin.install "tws"
  end
end
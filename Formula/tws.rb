class Tws < Formula
  desc "Scala Native Workshop for tws"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "http://localhost:8080/tws/0.5.0/zips/tws.zip"

  version "0.5.0"
  sha256 "06d0ced4221678b1118bbf0fb28b5f209595cce9e815476a7f5a0825f4f6920b"

  bottle do
    root_url "https://dl.bintray.com/jgogstad/bottles-testtap"
    cellar :any
    sha256 "5f9ecc5545f41758dae60aab40a4995d6eb55a659e38e704d9626c361bdc2b72" => :high_sierra
  end

  depends_on "bdw-gc" => :build
  depends_on "llvm" => :build
  depends_on "curl"
  depends_on "libidn"

  def install
      system "make", "VERSION=0.5.0", "BUILDPATH=#{buildpath}"
      bin.install "tws"
  end
end
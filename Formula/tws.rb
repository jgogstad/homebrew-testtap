class Tws < Formula
  desc "Scala Native Workshop for tws"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "http://localhost:8080/tws/0.0.1-9-3c63801a-20190217-1540/zips/tws.zip"

  version "0.0.1-9-3c63801a-20190217-1540"
  sha256 "06d0ced4221678b1118bbf0fb28b5f209595cce9e815476a7f5a0825f4f6920b"

  depends_on "bdw-gc" => :build
  depends_on "llvm" => :build
  depends_on "curl"
  depends_on "libidn"

  def install
      system "make", "VERSION=0.0.1-9-3c63801a-20190217-1540", "BUILDPATH=#{buildpath}"
      bin.install "tws"
  end
end
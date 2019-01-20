class Myapp < Formula
  desc "Scala Native Workshop"
  homepage "https://github.com/Tapad/scala-native-workshop"

  url "http://localhost:8080/0.1.0-SNAPSHOT/zips/myapp.zip"
  sha256 "71cc50139c25fb41da1fa9cedee6f4f12c3cb0a7ec42ced33f3d4c2bcaf24b17"

  depends_on "curl" => "7.56.0"

  def install
    system "make", "VERSION=0.1.0-SNAPSHOT", "BUILDPATH=#{buildpath}"
    bin.install "app"
  end

  test do
    system "#{bin}/app", "--version"
  end
end
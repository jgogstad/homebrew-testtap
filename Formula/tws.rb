class Tws < Formula
  desc "Scala Native Workshop for tws"
  homepage "https://github.com/Tapad/scala-native-workshop"

=begin
For this part of the workshop, we're not going to use any external storage for our artifacts. Navigate to your local ivy cache and serve it port 8080:

```
$ cd ~/.ivy2/local/com.tapad.workshop/tws/
$ python -m SimpleHTTPServer 8080
```
=end
  url "http://localhost:8080/0.1.0-SNAPSHOT/tws.zip"
  sha256 "5d61b5bf5d1ca2649c93b4a277fea8afc3d4f0bc1787d5ab16805a81d06c5f26"
  version "0.1.0-SNAPSHOT"

  depends_on "curl" => "7.56.0"
  depends_on "llvm" => :build
  depends_on "bdw-gc"
  depends_on "re2"
  depends_on "libidn"

  def install
    bin.install "tws"
  end

  test do
    system "#{bin}/tws", "--version"
  end

end
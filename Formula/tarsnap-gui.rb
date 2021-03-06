class TarsnapGui < Formula
  desc "Cross-platform GUI for the Tarsnap command-line client"
  homepage "https://github.com/Tarsnap/tarsnap-gui/wiki"
  url "https://github.com/Tarsnap/tarsnap-gui/archive/v1.0.tar.gz"
  sha256 "cd21d2a85f073e72f10900632fdcb49956985255a5711fb4f6d434433b09dac9"
  head "https://github.com/Tarsnap/tarsnap-gui.git"

  bottle do
    sha256 "65333d2097628d889e78ecb717a11de647f0d11058dd8ce7f263c573e828b54e" => :sierra
    sha256 "2963c8328a97832660467d27207bdb92340b7e1d10c4f70b552a56b433db5c5d" => :el_capitan
    sha256 "6c33861a277da0171c26ee389ab5e3f1d2277f3e577f18446e816909680cf9fb" => :yosemite
  end

  depends_on "qt"
  depends_on "tarsnap"

  def install
    system "qmake"
    system "make"
    system "macdeployqt", "Tarsnap.app"
    prefix.install "Tarsnap.app"
  end

  test do
    system "#{opt_prefix}/Tarsnap.app/Contents/MacOS/Tarsnap", "--version"
  end
end

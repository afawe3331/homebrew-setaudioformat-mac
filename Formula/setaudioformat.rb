class Setaudioformat < Formula
  desc "CLI tool to get/set macOS audio device format"
  homepage "https://github.com/mthiel/setaudioformat-mac"
  url "https://github.com/mthiel/setaudioformat-mac/archive/refs/heads/main.zip"
  version "latest"
  license "MIT"

  # Xcode 전체 대신 Command Line Tools로도 빌드 가능
  depends_on "make" => :build

  def install
    # Makefile 기반 빌드
    system "make"
    bin.install "setaudioformat"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/setaudioformat --help", 1)
  end
end

class Setaudioformat < Formula
  desc "CLI tool to get/set macOS audio device format"
  homepage "https://github.com/mthiel/setaudioformat-mac"
  url "https://github.com/mthiel/setaudioformat-mac/archive/refs/heads/main.zip"
  version "latest"
  license "MIT"

  depends_on xcode: :build

  def install
    # Xcode 프로젝트 빌드
    system "xcodebuild", "-project", "setaudioformat.xcodeproj",
                         "-scheme", "setaudioformat",
                         "-configuration", "Release",
                         "SYMROOT=build"

    # 빌드된 실행 파일 설치
    bin.install "build/Release/setaudioformat"
  end

  test do
    # 설치 확인: 도움말 출력이 되는지 체크
    assert_match "Usage", shell_output("#{bin}/setaudioformat --help", 1)
  end
end

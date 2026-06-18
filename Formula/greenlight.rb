class Greenlight < Formula
  desc "Local git proxy that validates code before pushing upstream"
  homepage "https://github.com/kinleyrabgay/greenlight"
  url "https://github.com/kinleyrabgay/greenlight/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "6beab3aab839d5b6b03966e37fe7a1107ffad4c07ce77aaedde198bf2aafea82"
  license "MIT"
  head "https://github.com/kinleyrabgay/greenlight.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/kinleyrabgay/greenlight/internal/buildinfo.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/greenlight"
  end

  test do
    assert_match "greenlight version", shell_output("#{bin}/greenlight --version")
  end
end

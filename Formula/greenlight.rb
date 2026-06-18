class Greenlight < Formula
  desc "Local git proxy that validates code before pushing upstream"
  homepage "https://github.com/kinleyrabgay/greenlight"
  url "https://github.com/kinleyrabgay/greenlight/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1aeb87c17ab7b87b161e083d3eb62e5e7172bf5c946e98e8fbf094ace5cfe458"
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

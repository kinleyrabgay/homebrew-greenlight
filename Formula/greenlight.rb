class Greenlight < Formula
  desc "Local git proxy that validates code before pushing upstream"
  homepage "https://github.com/kinleyrabgay/greenlight"
  url "https://github.com/kinleyrabgay/greenlight/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a3eba1d3db92cbf07a83b4f218804ea6060a6dc0c8f7fa471f6f690ae25381ae"
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

class Greenlight < Formula
  desc "Local git proxy that validates code before pushing upstream"
  homepage "https://github.com/kinleyrabgay/greenlight"
  url "https://github.com/kinleyrabgay/greenlight/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "23d9a2321d3e09560820ec945d108b8f2053cdd1329b71986067c04602c4605d"
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

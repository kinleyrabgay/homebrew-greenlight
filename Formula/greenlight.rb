class Greenlight < Formula
  desc "Local git proxy that validates code before pushing upstream"
  homepage "https://github.com/kinleyrabgay/greenlight"
  url "https://github.com/kinleyrabgay/greenlight/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f4887ef833589e4266852aabd8f71978a1e84220209b35114446532f7d04d4c2"
  license "MIT"
  head "https://github.com/kinleyrabgay/greenlight.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/greenlight"
  end

  test do
    assert_match "greenlight version", shell_output("#{bin}/greenlight --version")
  end
end

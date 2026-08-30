class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.14/arterm-macos-aarch64.tar.gz"
      sha256 "6fdf41d1e7dca0bb71ff8927d630f8b06f85a6d21f8fce1e4cc1ae7edc1936a7"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.14/arterm-macos-x86_64.tar.gz"
      sha256 "1d1e27ea049df1fed73830a635bd95fe940a850202781d455ea9482f1df462f3"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.14/arterm-linux-x86_64.tar.gz"
      sha256 "cc499dae2298a189733915db7ce36a0ac11bad628171aef896a52a932eac7a8c"

      def install
        libexec.install "arterm-linux-x86_64", "arterm-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"arterm").write <<~SH
#!/bin/sh
exec "#{libexec}/arterm-linux-x86_64" "$@"
        SH
      end
    end

    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.14/arterm-linux-aarch64.tar.gz"
      sha256 "dffc6e7c2c678d255f8086730eed36b2f5e101b94b4c8c52b9e5ffaa6e071d9d"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end

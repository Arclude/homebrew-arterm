class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.7/arterm-macos-aarch64.tar.gz"
      sha256 "43d3f03abe938d21149d967e6bbcf789a4511365cea773a3f3e64dc23d22f9e0"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.7/arterm-macos-x86_64.tar.gz"
      sha256 "f0b3c7f44385a9d3d352e60814923ea859fb4c82bf831df619c836fa179eb0e0"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.7/arterm-linux-x86_64.tar.gz"
      sha256 "1f86683119c21eafefa78840a97fc4d1fe05a814a26cd88b9d08c4a9f6eb6122"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.7/arterm-linux-aarch64.tar.gz"
      sha256 "2c3cf70718f4718c5e6065afb2af7f7ddefefa1b152fdd70348604e69c39fd40"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end

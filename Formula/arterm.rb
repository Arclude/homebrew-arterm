class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.11/arterm-macos-aarch64.tar.gz"
      sha256 "6d3a6d0231c15c18da506a8229542be55b25cd3f115d4249bcf3a55bc0fb86be"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.11/arterm-macos-x86_64.tar.gz"
      sha256 "7e6f278b0025bfad1911d5fa62e5207f700fb4b509fd98da47608420d810d16d"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.11/arterm-linux-x86_64.tar.gz"
      sha256 "a379754c53169e1b3da6ad4d9fae252c08dc3a3955126e59d601679de7df1295"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.11/arterm-linux-aarch64.tar.gz"
      sha256 "861ee2e7c09f4a65c55ce08cd133b5fa39596ca4ee5d38857c7e8a195c7e6d29"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end

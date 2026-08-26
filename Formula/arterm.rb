class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.13/arterm-macos-aarch64.tar.gz"
      sha256 "ef11f7fa469751b3c23b950697240eac5b3972f70737643a8398c68e0faa18fe"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.13/arterm-macos-x86_64.tar.gz"
      sha256 "f7b0af66487559841cdd6e0a372362af6fa7b2f8e6631e1c5a9ad90fb5e62377"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.13/arterm-linux-x86_64.tar.gz"
      sha256 "e4311db330e126db931149378ac1ddc5bb528527597a2995ea87da7cea660fb2"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.13/arterm-linux-aarch64.tar.gz"
      sha256 "8e67586dceb8e685381a7edf65bad68079858b1d7cba8493e9522c45ec250a70"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end

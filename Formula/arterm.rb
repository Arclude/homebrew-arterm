class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.2/arterm-macos-aarch64.tar.gz"
      sha256 "5a6259192bd380b01c19441d2eda0d93ead49715e3af549332b357476d74d4ca"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.2/arterm-macos-x86_64.tar.gz"
      sha256 "78e016377317d5ebaf920e0682415604fe74c7697c3400deb01703b6cc7b3760"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.2/arterm-linux-x86_64.tar.gz"
      sha256 "f6c59acebd723709361af123b72de3048d3de91c924dcade488d871167f4f4ca"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.2/arterm-linux-aarch64.tar.gz"
      sha256 "0559c27ff250297d0305bab16f704bd10e0a04a5d7f6cf390f5a6ec9653eaa37"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end

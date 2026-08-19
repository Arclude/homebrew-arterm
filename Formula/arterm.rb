class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.8/arterm-macos-aarch64.tar.gz"
      sha256 "45bda256cbab10e0cc83a06e40d5218bf365d310eaaafacbfd8cd763d1da9d4f"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.8/arterm-macos-x86_64.tar.gz"
      sha256 "8b7feb6780443846792ae589298abb0c6fa52500055548ccd2a9c7ea87f1c000"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.8/arterm-linux-x86_64.tar.gz"
      sha256 "d274a7729b964e6a78b4c83528a0bce40746c65be80a327208e8c3b999455753"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.8/arterm-linux-aarch64.tar.gz"
      sha256 "465d8f98429643cae9ac6a3717dbb4c1ebd25e8b01bbb2d2cbf76ae299a7a234"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end

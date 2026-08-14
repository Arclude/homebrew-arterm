class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.1/arterm-macos-aarch64.tar.gz"
      sha256 "ff461f1c06efbf1fe5c28354b94e78c835b8376fa094a7689adb18aa0ec122be"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.1/arterm-macos-x86_64.tar.gz"
      sha256 "7f25dc80843b637ebcd9043407b7b8a248901fa0e67995f29ff0c38c6585b9ce"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.1/arterm-linux-x86_64.tar.gz"
      sha256 "77b39b93fa3e9a19153f247f39ef673216be7719926d309c795c83245578c21c"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.1/arterm-linux-aarch64.tar.gz"
      sha256 "ca548d5fd81e2a409733d1d7211fb50c49666bcf6ef609ae6bfeea60ed4f2c4e"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end

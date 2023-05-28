# typed: false
# frozen_string_literal: true

class Hb < Formula
  desc "Heartbeat CLI"
  homepage "https://github.com/nwtgck/hb"
  version "0.3.0"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nwtgck/hb/releases/download/v0.3.0/hb-x86_64-apple-darwin.tar.gz"
    sha256 "b3acb08706d9241aa67cecc7ddc6b804fc10487a840542fdf39dc21425e2dcb7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nwtgck/hb/releases/download/v0.3.0/hb-aarch64-apple-darwin.tar.gz"
    sha256 "c3aac720e324494e58887c545159d5bdab83a6a11af4be97089fa63ef7582104"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nwtgck/hb/releases/download/v0.3.0/hb-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c876ca8f36c3dae26056b02523f185dde7297f58984ac8713aebf160496d08aa"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/nwtgck/hb/releases/download/v0.3.0/hb-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0b60291f574f8b0313d1fe7faf549c3ae6f4811abeb1249ca204729f25c2fb16"
  end

  def install
    bin.install "hb"
  end
end

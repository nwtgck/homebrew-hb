# typed: false
# frozen_string_literal: true

class Hb < Formula
  desc "Heartbeat CLI"
  homepage "https://github.com/nwtgck/hb"
  version "0.2.0"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nwtgck/hb/releases/download/v#{version}/hb-x86-64-apple-darwin.tar.gz"
    sha256 "6bc6a85257fc79ebe72640efa82b250488ec0a464f1f03f8afaccc78d03b081c"
  end

  def install
    bin.install "hb"
  end
end

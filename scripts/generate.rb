require 'digest'
require 'open-uri'


def digest(url)
  puts("Downloading #{url}...")
  d = Digest::SHA256.new
  d.hexdigest(open(url).read())
end

def generate()
  # Version without "v" prefix
  version = ENV["HB_VERSION"]
  if version.nil?
    raise "$HB_VERSION not defined"
  end
  # NOTE: formula is written for the latest "hb", not support all `version`.
  <<EOF
# typed: false
# frozen_string_literal: true

class Hb < Formula
  desc "Heartbeat CLI"
  homepage "https://github.com/nwtgck/hb"
  version "#{version}"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nwtgck/hb/releases/download/v#{version}/hb-x86_64-apple-darwin.tar.gz"
    sha256 "#{digest("https://github.com/nwtgck/hb/releases/download/v#{version}/hb-x86_64-apple-darwin.tar.gz")}"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nwtgck/hb/releases/download/v#{version}/hb-aarch64-apple-darwin.tar.gz"
    sha256 "#{digest("https://github.com/nwtgck/hb/releases/download/v#{version}/hb-aarch64-apple-darwin.tar.gz")}"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nwtgck/hb/releases/download/v#{version}/hb-x86_64-unknown-linux-musl.tar.gz"
    sha256 "#{digest("https://github.com/nwtgck/hb/releases/download/v#{version}/hb-x86_64-unknown-linux-musl.tar.gz")}"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/nwtgck/hb/releases/download/v#{version}/hb-aarch64-unknown-linux-musl.tar.gz"
    sha256 "#{digest("https://github.com/nwtgck/hb/releases/download/v#{version}/hb-aarch64-unknown-linux-musl.tar.gz")}"
  end

  def install
    bin.install "hb"
  end
end
EOF
end

puts("generating...")
File.write("hb.rb", generate())
puts("generated")

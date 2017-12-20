require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php71Hprose < AbstractPhp71Extension
  init
  desc "High Performance Remote Object Service Engine"
  homepage "https://pecl.php.net/package/hprose"
  url "https://pecl.php.net/get/hprose-1.6.6.tgz"
  head "https://github.com/hprose/hprose-pecl.git"
  sha256 "29292d9ba15c3f838622bbf8f608a0fb4fb6bba6019f6e6bffe1eedb572881b8"

  bottle do
    cellar :any_skip_relocation
    sha256 "3e7c75c6fbe6c0661825588a5c04c63d845ecd182ea9127403a711f02f53d963" => :el_capitan
    sha256 "c09a2c86c56b66e2fc773f42119fda318327de18ae056ca28ba9fc0a759d2c28" => :yosemite
    sha256 "e5f00549be6e9b4f02efb029c2367603fed626c72e841276e4f0ba88773aec72" => :mavericks
  end

  def install
    Dir.chdir "hprose-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/hprose.so"
    write_config_file if build.with? "config-file"
  end
end

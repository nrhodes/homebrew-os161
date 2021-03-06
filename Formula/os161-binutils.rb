require 'formula'

class Os161Binutils < Formula
  homepage 'http://www.eecs.harvard.edu/~dholland/os161'
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/binutils-2.17+os161-2.0.1.tar.gz'
  sha256 '895c0648e40c6ff5d7fc9a8ee9bcad2fe1589cbdfbf5e005baceb8b9b8b8b916'
  
  depends_on 'gettext'
  
  def install
    ENV.delete 'CFLAGS'
    ENV.delete 'CXXFLAGS'
    ENV.delete 'LD'
    ENV.delete 'CC'
    ENV.delete 'CXX'

    ENV['LDFLAGS'] = "-I#{include} -L/usr/local/Cellar/gettext/0.18.1.1/lib"
    ENV['CPPFLAGS'] = "-I#{include} -I/usr/local/Cellar/gettext/0.18.1.1/include"

    if MacOS.lion?
      ENV['CC'] = 'clang'
    end

    args = ["--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",
            "--disable-werror",
            "--nfp",
            "--target=mips-harvard-os161"]

    system "./configure", *args
    system "make"
    system "make install"
    system "for i in #{bin}/mips-*; do ln -s $i #{bin}/$(echo $i | cut -d- -f4-); done"
  end

end

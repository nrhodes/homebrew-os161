require 'formula'

class Os161Gdb < Formula
  homepage ''
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/os161-base-1.99.05.tar.gz'
  version '1.99.05'
  md5 'd7096802158f8a33de53a0fd4cc3e24cd4fe4b815a1b64958d89fe0addd049fd'

  def install
    ENV["CFLAGS"] = "-Os -w -pipe -std=gnu89"
    ENV["CXXFLAGS"] = "-Os -w -pipe"
    
    system "./configure", "--target=mips-harvard-os161", "--disable-werror", "--prefix=#{prefix}"
    
    system "make"
    system "make install"
    system "for i in #{bin}/mips-*; do ln -s $i #{bin}/$(echo $i | cut -d- -f4-); done"

  end

end

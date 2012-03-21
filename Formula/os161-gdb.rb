require 'formula'

class Os161Gdb < Formula
  homepage ''
  url 'http://www.cse.unsw.edu.au/~cs3231/10s1/os161/files/gdb-6.6+os161-2.0.tar.gz'
  md5 '83aa295fe92fe5a21408b0dd5e6de24d'

  def install
    ENV["CFLAGS"] = "-Os -w -pipe -std=gnu89"
    ENV["CXXFLAGS"] = "-Os -w -pipe"
    
    system "./configure", "--target=mips-harvard-os161", "--disable-werror", "--prefix=#{prefix}"
    
    system "make"
    system "make install"
    system "for i in #{bin}/mips-*; do ln -s $i #{bin}/$(echo $i | cut -d- -f4-); done"

  end

end

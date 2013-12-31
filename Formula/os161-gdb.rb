require 'formula'

class Os161Gdb < Formula
  homepage ''
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/gdb-6.6+os161-2.0.tar.gz'
  sha256 '4ee60a23192b15f7f51b8357a05e2400800e39c4ae9d43f44ca922d05c15b50c'

  def install
    ENV["CFLAGS"] = "-Os -w -pipe -std=gnu89"
    ENV["CXXFLAGS"] = "-Os -w -pipe"
    args = [
            "--disable-install-libiberty",
    ]
 
    system "./configure", "--target=mips-harvard-os161", "--disable-werror", "--prefix=#{prefix}"
    
    system "make"
    system "make install"
    system "for i in #{bin}/mips-*; do ln -s $i #{bin}/$(echo $i | cut -d- -f4-); done"

  end

end

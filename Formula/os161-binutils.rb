require 'formula'

class Os161Binutils < Formula
  homepage ''
  url 'http://www.cse.unsw.edu.au/~cs3231/10s1/os161/files/binutils-2.17+os161-2.0.tar.gz'
  md5 '91ae34114974be9641d4c7371a23b0b5'

  def install
    ENV.delete 'CFLAGS'
    ENV.delete 'CXXFLAGS'
    ENV.delete 'LD'
    ENV.delete 'CC'
    ENV.delete 'CXX'

    ENV['CPPFLAGS'] = "-I#{include}"

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

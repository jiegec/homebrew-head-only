class Cppzmq < Formula
  desc "C++ binding for 0MQ"
  homepage "https://github.com/zeromq/cppzmq/"
  head "https://github.com/zeromq/cppzmq.git"

  depends_on "zeromq"

  def install
    include.install "zmq.hpp"
  end

  test do
    (testpath/"test.cpp").write <<-EOS.undent
      #include <zmq.hpp>
      int main() {
        zmq::message_t message;
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{include}", "-lzmq", "-o", "test"
    system "./test"
  end
end

{pkgs, ...}: {

   environment.systemPackages = with pkgs; [
   vscodium-fhs
   clang-tools
   cmake
   codespell
   conan
   cppcheck
   doxygen
   gtest
   lcov
   vcpkg
   vcpkg-tool
   ];



  
}

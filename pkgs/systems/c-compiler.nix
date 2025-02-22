{ pkgs, ... }: {

  environment.systemPackages = with pkgs;
    [
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
    ] ++ (if system == "aarch64-darwin" then [ ] else [ gdb ]);
}

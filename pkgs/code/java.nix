{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # Java Spring Boot
    maven
    spring-boot-cli
    jdk
    vscode-extensions.vscjava.vscode-java-debug
    # temurin-jre-bin-20
    # temurin-jre-bin-8
    # temurin-jre-bin-11
  ];
}

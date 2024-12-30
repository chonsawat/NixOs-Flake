{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ bun nodejs_22 ];
}

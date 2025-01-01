{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ dotnetCorePackages.sdk_6_0_1xx ];
}

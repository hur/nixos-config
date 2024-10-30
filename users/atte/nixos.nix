{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.atte = {
    isNormalUser = true;
    home = "/home/atte";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$p7XVHmlldda3o/Dj$GkmuPt4vyh94Fl3unqIJO0i8lzeQLSiie73yWQd31CAtJaSH6qE7xzjV2BVFhUQrw.89GdHKa7tNZHTpi3HyJ/";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINg+iopkGS0kAY8U8H78HwteNs4ZBhDDKmlTAASAc7Jf atte"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}

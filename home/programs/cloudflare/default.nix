{...}: {
  imports = [
    # …
    ./cloudflare-warp.nix
  ];
  services.cloudflare-warp = {
    enable = true;
    certificate = "/home/greed/Downloads/certificate.pem"; # download here https://developers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/install-cloudflare-cert/
  };
}

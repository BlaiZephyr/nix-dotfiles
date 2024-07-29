{pkgs, ...}: {

   environment.systemPackages = with pkgs; [
   vscodium-fhs
   lorri
   niv
   ];



  
}

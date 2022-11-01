{
  description = ''A build tool for Neverwinter Nights projects'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nasher-0_19_0.flake = false;
  inputs.src-nasher-0_19_0.ref   = "refs/tags/0.19.0";
  inputs.src-nasher-0_19_0.owner = "squattingmonk";
  inputs.src-nasher-0_19_0.repo  = "nasher.nim";
  inputs.src-nasher-0_19_0.type  = "github";
  
  inputs."neverwinter".owner = "nim-nix-pkgs";
  inputs."neverwinter".ref   = "master";
  inputs."neverwinter".repo  = "neverwinter";
  inputs."neverwinter".dir   = "1_5_7";
  inputs."neverwinter".type  = "github";
  inputs."neverwinter".inputs.nixpkgs.follows = "nixpkgs";
  inputs."neverwinter".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."glob".owner = "nim-nix-pkgs";
  inputs."glob".ref   = "master";
  inputs."glob".repo  = "glob";
  inputs."glob".dir   = "v0_11_2";
  inputs."glob".type  = "github";
  inputs."glob".inputs.nixpkgs.follows = "nixpkgs";
  inputs."glob".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nwnt".owner = "nim-nix-pkgs";
  inputs."nwnt".ref   = "master";
  inputs."nwnt".repo  = "nwnt";
  inputs."nwnt".dir   = "v1_3_3";
  inputs."nwnt".type  = "github";
  inputs."nwnt".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nwnt".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."blarg".owner = "nim-nix-pkgs";
  inputs."blarg".ref   = "master";
  inputs."blarg".repo  = "blarg";
  inputs."blarg".dir   = "0_1_0";
  inputs."blarg".type  = "github";
  inputs."blarg".inputs.nixpkgs.follows = "nixpkgs";
  inputs."blarg".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nasher-0_19_0"];
    over = if builtins.pathExists ./override.nix 
           then { override = import ./override.nix; }
           else { };
  in lib.mkRefOutput (over // {
    inherit self nixpkgs ;
    src  = deps."src-nasher-0_19_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  } );
}
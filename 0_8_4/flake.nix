{
  description = ''A build tool for Neverwinter Nights projects'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nasher-0_8_4.flake = false;
  inputs.src-nasher-0_8_4.ref   = "refs/tags/0.8.4";
  inputs.src-nasher-0_8_4.owner = "squattingmonk";
  inputs.src-nasher-0_8_4.repo  = "nasher.nim";
  inputs.src-nasher-0_8_4.type  = "github";
  
  inputs."neverwinter".owner = "nim-nix-pkgs";
  inputs."neverwinter".ref   = "master";
  inputs."neverwinter".repo  = "neverwinter";
  inputs."neverwinter".dir   = "1_5_5";
  inputs."neverwinter".type  = "github";
  inputs."neverwinter".inputs.nixpkgs.follows = "nixpkgs";
  inputs."neverwinter".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."glob".owner = "nim-nix-pkgs";
  inputs."glob".ref   = "master";
  inputs."glob".repo  = "glob";
  inputs."glob".dir   = "v0_11_1";
  inputs."glob".type  = "github";
  inputs."glob".inputs.nixpkgs.follows = "nixpkgs";
  inputs."glob".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."regex".owner = "nim-nix-pkgs";
  inputs."regex".ref   = "master";
  inputs."regex".repo  = "regex";
  inputs."regex".dir   = "v0_19_0";
  inputs."regex".type  = "github";
  inputs."regex".inputs.nixpkgs.follows = "nixpkgs";
  inputs."regex".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nasher-0_8_4"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nasher-0_8_4";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}
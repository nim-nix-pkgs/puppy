{
  description = ''Fetch url resources via HTTP and HTTPS.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-puppy-1_2_1.flake = false;
  inputs.src-puppy-1_2_1.owner = "treeform";
  inputs.src-puppy-1_2_1.ref   = "refs/tags/1.2.1";
  inputs.src-puppy-1_2_1.repo  = "puppy";
  inputs.src-puppy-1_2_1.type  = "github";
  
  inputs."urlly".dir   = "nimpkgs/u/urlly";
  inputs."urlly".owner = "riinr";
  inputs."urlly".ref   = "flake-pinning";
  inputs."urlly".repo  = "flake-nimble";
  inputs."urlly".type  = "github";
  inputs."urlly".inputs.nixpkgs.follows = "nixpkgs";
  inputs."urlly".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."libcurl".dir   = "nimpkgs/l/libcurl";
  inputs."libcurl".owner = "riinr";
  inputs."libcurl".ref   = "flake-pinning";
  inputs."libcurl".repo  = "flake-nimble";
  inputs."libcurl".type  = "github";
  inputs."libcurl".inputs.nixpkgs.follows = "nixpkgs";
  inputs."libcurl".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."zippy".dir   = "nimpkgs/z/zippy";
  inputs."zippy".owner = "riinr";
  inputs."zippy".ref   = "flake-pinning";
  inputs."zippy".repo  = "flake-nimble";
  inputs."zippy".type  = "github";
  inputs."zippy".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zippy".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-puppy-1_2_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-puppy-1_2_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}
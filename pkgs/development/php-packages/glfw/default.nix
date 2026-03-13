{
  buildPecl,
  lib,
  glfw,
  fetchFromGitHub,
}:

let
  version = "2.2.1";
in
buildPecl {
  inherit version;
  pname = "glfw";

  buildInputs = [ glfw ];

  configureFlags = [ "--enable-glfw" "--with-glfw-dir=${glfw}" ];

  src = fetchFromGitHub {
    owner = "mario-deluna";
    repo = "php-glfw";
    rev = "v${version}";
    sha256 = "sha256-B1QURFOb+ikvOpfECeg6noh89znQuidu+CiY52A64Ko=";
  };

  meta = with lib; {
    changelog = "https://github.com/mario-deluna/php-glfw/releases/tag/v${version}";
    description = "PHP extension for GLFW OpenGL graphics";
    license = licenses.php301;
    homepage = "https://github.com/mario-deluna/php-glfw";
    teams = [ teams.php ];
  };
}
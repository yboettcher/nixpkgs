{ lib
, buildPythonPackage
, fetchFromGitHub
, imageio
, matplotlib
, numpy
, pillow
, pooch
, scooby
, vtk
}:

buildPythonPackage rec {
  pname = "pyvista";
  version = "0.40.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    hash = "sha256-vZmZh/wD6Np/0ZxTm81Ai3zWZHrQ4qykDw/+xKBUUZg=";
  };

  propagatedBuildInputs = [
    imageio
    matplotlib
    numpy
    pillow
    pooch
    scooby
    vtk
  ];

  # Fatal Python error: Aborted
  doCheck = false;

  pythonImportsCheck = [
    "pyvista"
  ];

  meta = with lib; {
    homepage = "https://pyvista.org";
    description = "Easier Pythonic interface to VTK";
    license = licenses.mit;
    maintainers = with maintainers; [ wegank ];
  };
}

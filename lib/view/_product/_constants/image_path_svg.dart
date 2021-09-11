import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();

  final beauty1SVG = 'beauty1'.toSVG;
  final beauty2SVG = 'beauty2'.toSVG;
  final beauty3SVG = 'beauty3'.toSVG;
}

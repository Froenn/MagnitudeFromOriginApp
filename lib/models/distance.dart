enum Units{ px, inch , m }

class Distance{
  Distance(this._pixels);

  double _pixels;

  Units _units = Units.px;

  get units => _units.toString().split('.').last;

  get length => calcLength(_pixels);

  set magnitude(double magnitude) => _pixels = magnitude;

  double calcLength(double m){
      double l;
    switch (_units) {
      case Units.inch:
        l = m / 96;
        break;
      case Units.m:
        l = m / 96 * 0.0254;
        break;
      default:
        l = m;
        break;
    }
    return l;
  }

  void swapSystems(){
    _units = _units == Units.px ? Units.inch : _units == Units.inch ? Units.m : Units.px;
    calcLength(_pixels);
  }
}
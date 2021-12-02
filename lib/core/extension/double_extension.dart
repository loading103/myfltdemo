
import 'package:myflutterdemo/ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return ZKSizeFit.setPx(this);
  }

  double get rpx {
    return ZKSizeFit.setRpx(this);
  }
}

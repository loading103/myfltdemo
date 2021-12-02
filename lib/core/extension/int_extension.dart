
import 'package:myflutterdemo/ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return ZKSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return ZKSizeFit.setRpx(this.toDouble());
  }
}
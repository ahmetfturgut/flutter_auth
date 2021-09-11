import 'package:beauty/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

errorCodeValue(code) {
  switch (code) {
    case 406:
      return LocaleErrorKeys.usedEmail.tr();

    default:
      return code.toString();
  }
}

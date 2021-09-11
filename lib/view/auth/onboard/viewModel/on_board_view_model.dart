import 'package:beauty/core/base/model/base_view_model.dart';
import 'package:beauty/core/constants/enums/locale_keys_enum.dart';
import 'package:beauty/core/constants/navigation/navigation_constants.dart';
import 'package:beauty/core/init/lang/locale_keys.g.dart';
import 'package:beauty/view/_product/_constants/image_path_svg.dart';
import 'package:beauty/view/auth/onboard/model/on_board_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardModel = [];
  @observable
  int currentIndex = 0;

  void changeCurrentIndex(value) {
    currentIndex = value;
  }

  void init() {
    onBoardModel.add(OnBoardModel(LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_desc, SVGImagePaths.instance.beauty1SVG));
    onBoardModel.add(OnBoardModel(LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_desc, SVGImagePaths.instance.beauty2SVG));
    onBoardModel.add(OnBoardModel(LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_desc, SVGImagePaths.instance.beauty3SVG));
  }

  Future<void> complateToOnBoard() async {
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);

    navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
  }
}

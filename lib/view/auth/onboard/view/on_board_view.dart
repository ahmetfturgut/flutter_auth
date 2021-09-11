import 'package:beauty/core/base/view/base_widget.dart';
import 'package:beauty/core/components/text/auto_locale_text.dart';
import 'package:beauty/core/extension/context_extension.dart';
import 'package:beauty/view/_product/_widgets/avatar/on_board_circle.dart';
import 'package:beauty/view/auth/onboard/model/on_board_model.dart';
import 'package:beauty/view/auth/onboard/viewModel/on_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingMediumHorizontal,
          child: Column(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardModel.length,
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemBuilder: (context, index) =>
          buildColumnBody(context, viewModel.onBoardModel[index]),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: buildListViewCircles(viewModel)),
        FloatingActionButton(
            backgroundColor: context.colors.secondaryVariant,
            child: Icon(Icons.keyboard_arrow_right_rounded),
            onPressed: () {
              viewModel.complateToOnBoard();
            })
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Observer(builder: (_) {
            return OnBoardCircle(isSelected: viewModel.currentIndex == index);
          });
        });
  }

  Column buildColumnBody(BuildContext context, OnBoardModel onBoardModel) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(onBoardModel.imagePath)),
        buildColumDescription(context, onBoardModel),
      ],
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);

  Column buildColumDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        AutoLocaleText(
            value: model.title,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                color: context.colors.onSecondary,
                fontWeight: FontWeight.bold)),
        AutoLocaleText(
          value: model.desc,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

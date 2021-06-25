import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;
  final bool enablePrimaryColor;
  final bool enableSecundaryColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.secondaryLabel,
      required this.primaryOnTap,
      required this.secondaryOnTap,
       this.enablePrimaryColor =false, this.enableSecundaryColor =false
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
        height: 57,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Divider(
              thickness: 1,
              color: AppColors.stroke,
              height: 1,
            ),
            Container(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                      child: LabelButton(
                    label: primaryLabel,
                    onTap: primaryOnTap,
                    style: enablePrimaryColor? AppTextStyles.buttonPrimary:null,
                  )),
                  DividerVerticalWidget(),
                  Expanded(
                      child: LabelButton(
                    label: secondaryLabel,
                    onTap: secondaryOnTap,
                    style: enableSecundaryColor?AppTextStyles.buttonPrimary:null,
                  )),
                ],
              ),
            ),
          ],
        ));
  }
}

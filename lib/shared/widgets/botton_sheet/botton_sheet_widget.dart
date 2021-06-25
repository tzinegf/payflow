import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_labels_buttons.dart';

class BottonSheetWidget extends StatelessWidget {
   final String primaryLabel;
  final String secondaryLabel;
  final String title;
  final String subTitle;
  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;

  const BottonSheetWidget({ Key? key,required  this.primaryLabel,required this.secondaryLabel,required this.primaryOnTap,required this.secondaryOnTap,required this.title,required this.subTitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
        color: AppColors.shape,
        child: Column(

          children: [
            Expanded(
              child:
               Container(
                 color: Colors.black.withOpacity(0.6),
                 ),
                 ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text.rich(
                    TextSpan(
                      style: AppTextStyles.buttonBoldHeading,
                      text: title, children:[TextSpan(
                      style: AppTextStyles.buttonHeading,
                      text: '\n$subTitle')] ),
                      textAlign: TextAlign.center,
                      
                      ),
                ),
               Container(
                 height: 1,
                 color: AppColors.stroke,
               ),
                SetLabelButtons(
                  enablePrimaryColor: true,
                  primaryLabel: primaryLabel,
                  secondaryLabel: secondaryLabel,
                  primaryOnTap: primaryOnTap,
                  secondaryOnTap: secondaryOnTap,
                  )

              ],
              ),
          ],
        ),
        
      ),
    );
  }
}
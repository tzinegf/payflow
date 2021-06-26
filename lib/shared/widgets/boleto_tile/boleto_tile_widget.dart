import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel model;
  
  
  
  const BoletoTileWidget({ Key? key,required this.model }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
          child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(model.name!,style: AppTextStyles.titleListTile,),
        subtitle: Text('Vence em: ${model.dueDate}',style: AppTextStyles.captionBody,),
        trailing:Text.rich(TextSpan(
                    text: 'R\$, ',
                    style: AppTextStyles.trailingRegular,
                    children: [
                      TextSpan(
                          text: '${model.value!.toStringAsFixed(2)}', style: AppTextStyles.trailingBold)
                    ])), 
        
      ),
    );
  }
}
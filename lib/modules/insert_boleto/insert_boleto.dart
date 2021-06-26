import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_labels_buttons.dart';

class InsertBoleto extends StatefulWidget {
  final String? barcode;
  const InsertBoleto({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoState createState() => _InsertBoletoState();
}

class _InsertBoletoState extends State<InsertBoleto> {
  @override
  void initState() {
    if (widget.barcode != null) {
      barCodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  final insertBoletoController = InsertBoletoController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: 'R\$', decimalSeparator: ',');
  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barCodeInputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
                child: Text(
                  'Preencha os dados do boleto',
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Form(
                key: insertBoletoController.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      validator: insertBoletoController.validateName,
                      textlabel: 'Nome do boleto',
                      iconData: Icons.description_outlined,
                      onChanged: (value) {
                        insertBoletoController.onChange(name: value);
                      },
                    ),
                    InputTextWidget(
                      validator: insertBoletoController.validateVencimento,
                      controller: dueDateInputTextController,
                      textlabel: 'Vencimento ',
                      iconData: FontAwesomeIcons.timesCircle,
                      onChanged: (value) {
                        insertBoletoController.onChange(dueDate: value);
                      },
                    ),
                    InputTextWidget(
                      validator: (_) => insertBoletoController
                          .validateValor(moneyInputTextController.numberValue),
                      controller: moneyInputTextController,
                      textlabel: 'Valor',
                      iconData: FontAwesomeIcons.wallet,
                      onChanged: (value) {
                        insertBoletoController.onChange(value: moneyInputTextController.numberValue);
                      },
                    ),
                    InputTextWidget(
                      validator: insertBoletoController.validateCodigo,
                      controller: barCodeInputTextController,
                      textlabel: 'Código',
                      iconData: FontAwesomeIcons.barcode,
                      onChanged: (value) {
                        insertBoletoController.onChange(codigo: value);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnTap: () {
          print('Ola');
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryOnTap: () async{
          print('Ola');
          await insertBoletoController.cadBoleto();
          Navigator.pop(context);
        },
        enableSecundaryColor: true,
      ),
    );
  }
}

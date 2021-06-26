import 'package:flutter/material.dart';
import 'package:payflow/modules/bar_code_scanner/bar_code_scanner_controller.dart';
import 'package:payflow/modules/bar_code_scanner/bar_code_snanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/botton_sheet/botton_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_labels_buttons.dart';

class BarCodeScannerScreen extends StatefulWidget {
  const BarCodeScannerScreen({Key? key}) : super(key: key);

  @override
  _BarCodeScannerScreenState createState() => _BarCodeScannerScreenState();
}

class _BarCodeScannerScreenState extends State<BarCodeScannerScreen> {
  final controller = BarCodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarCode) {
        Navigator.pushReplacementNamed(context, '/insertboletopage',
        arguments: controller.status.barCode );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarCodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Escaneie o código de barras do boleto.',
                  style: AppTextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                ),
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.8),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.8),
                  ))
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnTap: () {
                  Navigator.pushReplacementNamed(context, '/insertboletopage');
                },
                secondaryLabel: 'Adicionar da galeria',
                secondaryOnTap: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarCodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasErro) {
                  return BottonSheetWidget(
                    primaryLabel: 'Escanear novamente',
                    secondaryLabel: 'Digita o código',
                    primaryOnTap: () {
                      controller.scanWithCamera();
                    },
                    secondaryOnTap: () {
                      Navigator.pushReplacementNamed(context, '/insertboletopage');
                    },
                    title: 'Não foi possível identificar um código de barras.',
                    subTitle:
                        'Tente escanear novamente ou digite o código do boleto.',
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

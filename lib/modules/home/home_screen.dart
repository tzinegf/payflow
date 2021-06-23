import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  final pages = [
     Container(
      color: Colors.red,
    ),
    
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                        text: 'Edson', style: AppTextStyles.titleBoldBackground)
                  ])),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter ,
            colors: [Colors.white,Color.fromRGBO(255, 255, 255, 0.0)]
          )
        ),
        // color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  controller.setPage(0);
                  setState(() {
                    
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: AppColors.primary,
                )),
            GestureDetector(
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                    onPressed: () {
                      controller.setPage(1);
                setState(() {
                    
                  });
                    },
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    )),
              ),
              onTap: () {
                
              },
            ),
            IconButton(
                onPressed: () {
                  controller.setPage(2);
                  setState(() {
                    
                  });
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: AppColors.body,
                )),
          ],
        ),
      ),
      body: pages[controller.currentPage],
    );
  }
}

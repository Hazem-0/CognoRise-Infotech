import 'package:bmi_calculator/provider/colors.dart';
import 'package:bmi_calculator/provider/gender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderBox extends ConsumerWidget {
  String gender ;

  GenderBox({required this.gender});

  @override
  Widget build(BuildContext context ,WidgetRef ref) {

    int genderPro=ref.watch(genderProvider);
    var genderNotifier = ref.watch(genderProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: ()=>(gender=="Male")?genderNotifier.state=1:genderNotifier.state=2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(gender,style: TextStyle(fontSize: 32 ,fontWeight: FontWeight.bold ,color: (gender=="Male")?AppColors.darkGreen:AppColors.coffee),),
            SizedBox(width: 20,),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 80,
                backgroundImage: AssetImage((gender=="Male")?"assests/imgs/male.png":"assests/imgs/female.png"),
              ),
          ],
        ),
      ),
    );
  }
}

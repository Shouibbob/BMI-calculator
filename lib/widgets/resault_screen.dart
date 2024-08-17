import 'package:bmi_calculator/widgets/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/colors.dart';

class ResaultScreen extends StatelessWidget {
  ResaultScreen({super.key, required this.res});
  final double res;
  Color color = Colors.white;
  String feedBAck = 'good weight';
  String getCheck() {
    if (res < 18.5) {
      color = Colors.red;
      feedBAck = 'You should pay more attention to proteins';
      return 'Underweight';
    } else if (res <= 24.9) {
      color = Colors.green;
      feedBAck = 'your body weight is excellent normal good job';
      return 'Normal';
    } else if (res <= 39.9) {
      color = Colors.yellow;
      feedBAck = 'You should take care of your diet';
      return 'Overweight';
    } else {
      color = Colors.red;
      feedBAck = 'Try to reduce your weight';
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white,
            )),
        centerTitle: true,
        title: Text(
          'Resault',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Container(
            width: double.infinity,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Resault',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 10, left: 0, right: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondry,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                getCheck(),
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Text(
                                res.toStringAsFixed(1).toString(),
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 65),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              Text(
                                feedBAck,
                                style: TextStyle(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => BmiScreen()));
                    },
                    child: Text(
                      'Recalculate',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

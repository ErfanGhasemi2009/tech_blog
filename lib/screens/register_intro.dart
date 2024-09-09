import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/screens/my_categories.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.tcbot,
              width: 96,
              height: 96,
            ),
            const SizedBox(
              height: 32,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.welcome,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 20))),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                _showBtnSheetEmail(context, size);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Text(
                  MyStrings.letsGo,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<dynamic> _showBtnSheetEmail(BuildContext context, Size size) {
    bool emailIsReal = false;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 3,
            decoration: const BoxDecoration(
                color: SolidColors.scaffoldBg,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  MyStrings.enterEmaile,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: TextField(

                    onChanged: (value) {
                      emailIsReal = isEmail(value);
                    },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 20),
                    decoration: InputDecoration(
                        hintText: 'erfanghasemi1309@gmail.com',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (emailIsReal) {
                        Navigator.of(context).pop();
                        _showBtnSheetActivator(context, size);
                      } else {
                        //TODO: create a snackbar to show the error to user
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Text(
                        MyStrings.continuation,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showBtnSheetActivator(BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 3,
            decoration: const BoxDecoration(
                color: SolidColors.scaffoldBg,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  MyStrings.enterEmaile,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: TextField(
                    maxLength: 6,
                    onChanged: (value) {
                      print(value +
                          ' is numeric: ' +
                          isNumeric(value).toString());
                    },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 20),
                    decoration: InputDecoration(
                        hintText: '* * * * * *',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyCategories(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Text(
                        MyStrings.continuation,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

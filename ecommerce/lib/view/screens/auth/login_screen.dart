import 'package:ecommerce/controller/auth/sing_in_controller.dart';
import 'package:ecommerce/core/class/statues_request.dart';
import 'package:ecommerce/view/widgets/auth/button_with_sochial_meadi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/const_image_route.dart';
import '../../../core/functions/exit_dialog.dart';
import '../../../core/functions/validate_input.dart';
import '../../widgets/auth/botton_style.dart';
import '../../widgets/auth/text_form_field_style.dart';
import '../../widgets/auth/to_move_sing_in_or_up.dart';

class LoginScreen extends GetView<SingInControllerImp> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: background,
          elevation: 0,
          title: Text(
            "singIn".tr,
            style: const TextStyle(
                fontFamily: "Cario", letterSpacing: 1, color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: WillPopScope(
          onWillPop: exsitDialog,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Form(
              key: controller.key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      ConstImage.imageAuth,
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "title5".tr,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "body5".tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 17),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormFieldStyle(
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (val) => vlidatorInput('email', 4, 100, val!),
                      hintText: 'hint-E'.tr,
                      icon: Icons.email_outlined,
                      labelText: 'label-E'.tr,
                    ),
                    GetBuilder<SingInControllerImp>(
                      builder: (controller) => TextFormFieldStyle(
                        obscuretext: controller.showPassword,
                        onTap: () {
                          controller.showOrHidePassword();
                        },
                        onSaved: (value) {
                          controller.password = value;
                        },
                        validator: (val) =>
                            vlidatorInput('password', 6, 30, val!),
                        hintText: 'hint-P'.tr,
                        icon: controller.showPassword == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        labelText: 'label-P'.tr,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.only(left: 200),
                          child: Text(
                            'forgot'.tr,
                            textAlign: TextAlign.end,
                            style: const TextStyle(color: textColor),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextSingInOrUp(
                      text1: "account-up".tr,
                      tetxt2: "singUp".tr,
                      onTap: () {
                        controller.gotoSingUp();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GetBuilder<SingInControllerImp>(
                      builder: (controller) => controller.statuesRequest ==
                              StatuesRequest.loading
                          ? const CircularProgressIndicator(color: textColor)
                          : BottonStyleAuth(
                            width: double.infinity,
                              onPressed: () {
                                controller.singInWithEmailAndPassword();
                              },
                              textbotton: "singIn".tr,
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWithSochialMedia(
                          image: ConstImage.imageGoogle,
                          onTap: () {
                            controller.singInWithGoogle();
                          },
                          scale: 8,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "----- OR -----",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ButtonWithSochialMedia(
                          image: ConstImage.imageFaceBook,
                          onTap: () {
                            controller.singInWithFacebook();
                          },
                          scale: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

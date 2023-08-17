import 'package:ecommerce/core/class/statues_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/sing_up_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/validate_input.dart';
import '../../widgets/auth/botton_style.dart';
import '../../widgets/auth/text_form_field_style.dart';
import '../../widgets/auth/to_move_sing_in_or_up.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SingUpControllerImp controller = Get.put(SingUpControllerImp());

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: background,
        elevation: 0,
        title: Text(
          "singUp".tr,
          style: const TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: controller.key,
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                "title5".tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
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
                  controller.email = value;
                },
                validator: (val) => vlidatorInput('email', 4, 100, val!),
                hintText: 'hint-E'.tr,
                icon: Icons.email_outlined,
                labelText: 'label-E'.tr,
              ),
              TextFormFieldStyle(
                onSaved: (value)=>controller.name=value,
                validator: (val) => vlidatorInput('name', 4, 30, val!),
                hintText: 'hint-u'.tr,
                icon: Icons.person_2_outlined,
                labelText: 'label-u'.tr,
              ),
              TextFormFieldStyle(
                 onSaved: (value)=>controller.phone=value,
                validator: (val) => vlidatorInput('phone', 10, 10, val!),
                hintText: 'hint-ph'.tr,
                icon: Icons.phone_android_outlined,
                labelText: 'label-ph'.tr,
              ),
              TextFormFieldStyle(
                onSaved: (value) {
                  controller.password = value;
                },
                validator: (val) => vlidatorInput('password', 6, 30, val!),
                hintText: 'hint-P'.tr,
                icon: Icons.lock_outline,
                labelText: 'label-P'.tr,
              ),
              const SizedBox(
                height: 30,
              ),
              TextSingInOrUp(
                text1: "account-in".tr,
                tetxt2: "singIn".tr,
                onTap: () {
                  controller.goToSingIn();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<SingUpControllerImp>(builder: (controller) {
                return controller.statuesRequest == StatuesRequest.loading
                    ? const CircularProgressIndicator(
                        color: textColor,
                      )
                    : BottonStyleAuth(
                      width: double.infinity,
                        onPressed: () {
                          controller.createUser();
                        },
                        textbotton: "singUp".tr,
                      );
              })
            ]),
          ),
        ),
      ),
    );
  }
}

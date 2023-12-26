import 'package:doc/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:doc/business_logic/cubit/auth_cubit/auth_states.dart';
import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cashe_helper.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/footer_auth.dart';
import '../../../widgets/form.dart';
import '../../../widgets/light_text.dart';
import '../../../widgets/social_login.dart';
import '../../../widgets/terms_cond.dart';
import '../../main_screen/main_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessed) {
            CacheHelper.saveData(
                key: 'token', value: state.authModel.data?.token);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MainScreen(
                  token: state.authModel.data!.token.toString(),
                ),
              ),
              (route) => false,
            );
          }
          if (state is RegisterFailed) {
            AuthCubit cubit = AuthCubit.get(context);
            cubit.buildToast(
              msg: state.errorMessage,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Styles.appPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    const LightText(
                      text: 'Create Account',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SubText(
                      text:
                          '''Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!''',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FormSheet(
                      phone: cubit.phone,
                      isLogined: false,
                      formKey: cubit.formKey,
                      email: cubit.email,
                      password: cubit.password,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Styles.appPadding),
                      child: (state is InitialRegister)
                          ? const Center(child: CircularProgressIndicator())
                          : DefaultButton(
                              text: 'Create Account',
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.userRegister(
                                    email: cubit.email.text,
                                    name: 'mahmoud',
                                    phone: cubit.phone.text,
                                    password: cubit.password.text,
                                    gender: 0,
                                  );
                                }
                              },
                            ),
                    ),
                    buildOrDivider(isLogined: false),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Styles.appPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildSocialLogin(
                            icon: Assets.google,
                            onTap: () {},
                          ),
                          buildSocialLogin(
                            icon: Assets.facebook,
                            onTap: () {},
                          ),
                          buildSocialLogin(
                            icon: Assets.apple,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    buildTermsAndConditions(),
                    const SizedBox(
                      height: 30,
                    ),
                    buildFooter(context: context, isLogin: false),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

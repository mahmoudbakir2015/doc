import 'package:doc/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:doc/business_logic/cubit/auth_cubit/auth_states.dart';
import 'package:doc/constant/assets.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/auth/login/items.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessed) {
            CacheHelper.saveData(
                key: 'authroization', value: state.authModel.data?.token);

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
              (route) => false,
            );
          }
          if (state is LoginFailed) {
            print(state.errorMessage);
            SnackBar(
              content: Text(
                state.errorMessage,
              ),
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
                      text: 'Welcome Back',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SubText(
                      text:
                          ''' We're excited to have you back, can't wait to see what you've been up to since you last logged in.''',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FormSheet(
                      formKey: cubit.formKey,
                      email: cubit.email,
                      password: cubit.password,
                    ),
                    RememberForget(checkValue: cubit.checkValue),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Styles.appPadding),
                      child: (state is InitialLogin)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : DefaultButton(
                              text: 'Login',
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  try {
                                    cubit.userLogin(
                                      email: cubit.email.text,
                                      password: cubit.password.text,
                                    );
                                  } catch (error) {
                                    print(error.toString());
                                  }
                                }
                              },
                            ),
                    ),
                    buildOrDivider(),
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
                    buildFooter(context: context),
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

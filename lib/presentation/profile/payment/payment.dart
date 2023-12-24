import 'package:doc/constant/style.dart';
import 'package:doc/presentation/profile/payment/items.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/assets.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> payment = [
      {
        'icon': Assets.paypal,
        'name': 'PayPal',
        'last5dig': '12345',
      },
      {
        'icon': Assets.mastercardLogo,
        'name': 'MasterCard',
        'last5dig': '45210',
      },
      {
        'icon': Assets.applepayLogo,
        'name': 'Apple Pay',
        'last5dig': '95786',
      },
      {
        'icon': Assets.payoneerLogo,
        'name': 'Payoneer',
        'last5dig': '00215',
      },
      {
        'icon': Assets.dana,
        'name': 'Dana',
        'last5dig': '55223',
      },
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: Styles.appPadding,
          left: Styles.appPadding,
          right: Styles.appPadding,
        ),
        child: Column(
          children: [
            CustomListTile(
              isMain: false,
              text: 'Payment',
              trailing: SvgPicture.asset(Assets.scanner),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: buildCardPay(
                      icon: payment[index]['icon'],
                      name: payment[index]['name'],
                      last5dig: payment[index]['last5dig'],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: payment.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

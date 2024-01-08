import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PaymentMethod { creditCard, bank, paypal, bitcoin }

typedef PaymentCallBack = Function(PaymentMethod value);

class PaymentMethodWidget extends StatelessWidget {
  final Widget icon;

  final String title;
  final String subtitle;
  final PaymentMethod value;
  final PaymentMethod selectedValue;

  final PaymentCallBack paymentCallBack;

  const PaymentMethodWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.selectedValue,
      required this.paymentCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: _onTap,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: getWidgetState(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    icon,
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            title,
                            style: const TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Color(0xff6c738a),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getWidgetState() {
    if (value == selectedValue) {
      return (const Icon(
        FontAwesomeIcons.solidCircleCheck,
        color: Colors.green,
        size: 21,
      ));
    } else {
      return Container(
        margin: const EdgeInsets.only(left: 1),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 2)),
        height: 20,
        width: 20,
      );
    }
  }

  void _onTap() {
    paymentCallBack(value);
  }
}

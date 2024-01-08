import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_flow/ui/components/payment_type.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PaymentMethodState();
  }
}

class _PaymentMethodState extends State<PaymentMethodScreen> {
  PaymentMethod paymentSelected = PaymentMethod.creditCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        //padding: const EdgeInsets.all(45.0),
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Método de pago',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff1a1a1a),
              ),
            ),
            const Text(
              'Seleccione uno de los métodos de pago',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff6C738A),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PaymentMethodWidget(
              icon: const Icon(
                FontAwesomeIcons.creditCard,
                color: Color(0xffCCB375),
              ),
              title: 'Tarjeta de crédito',
              subtitle: 'Pague con Mastercard o Visa',
              value: PaymentMethod.creditCard,
              selectedValue: paymentSelected,
              paymentCallBack: onPaymentChange,
            ),
            PaymentMethodWidget(
              icon: const Icon(
                FontAwesomeIcons.buildingColumns,
                color: Color(0Xff00A7D9),
              ),
              title: 'Transferencia bancaria',
              subtitle: 'Pague directo desde su cuenta',
              value: PaymentMethod.bank,
              selectedValue: paymentSelected,
              paymentCallBack: onPaymentChange,
            ),
            PaymentMethodWidget(
              icon: const Icon(
                FontAwesomeIcons.paypal,
                color: Color(0xff0D47A1),
              ),
              title: 'Paypal',
              subtitle: 'La forma más rápida y segura de enviar dinero',
              value: PaymentMethod.paypal,
              selectedValue: paymentSelected,
              paymentCallBack: onPaymentChange,
            ),
            PaymentMethodWidget(
              icon: const Icon(
                FontAwesomeIcons.bitcoin,
                color: Color(0xff000000),
              ),
              title: 'Billetera de Bitcoin',
              subtitle: 'Enviar la cantidad a nuestra billetera Bitcoin',
              value: PaymentMethod.bitcoin,
              selectedValue: paymentSelected,
              paymentCallBack: onPaymentChange,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => showDetails(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        child: const Text('SIGUIENTE'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void onPaymentChange(PaymentMethod value) {
    setState(() {});
    paymentSelected = value;
  }

  void showDetails(BuildContext context) =>
      Navigator.pushNamed(context, '/payment_details');
}

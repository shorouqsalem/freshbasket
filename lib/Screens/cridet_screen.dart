// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';


class Cardd {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  Cardd({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });
}

class CardsScreen extends StatefulWidget {
  CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final List<Cardd> cards = [
    Cardd(
      cardNumber: "1234  5678  9123  4567",
      cardHolderName: "Tanya Robinson",
      expiryDate: "02/23",
    ),
    Cardd(
      cardNumber: "1234  5678  9123  4567",
      cardHolderName: "Tanya Robinson",
      expiryDate: "02/23",
    ),
    Cardd(
      cardNumber: "1234  5678  9123  4567",
      cardHolderName: "Tanya Robinson",
      expiryDate: "02/23",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cards",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddCardScreen(),
                ),
              );
            },
            child: const SizedBox(
              width: 24.0,
              height: 24.0,
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PaymentCard(
                    card: cards[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const HorizontalSpacer(width: 15),
                  itemCount: cards.length,
                ),
              ),
              const VerticalSpacer(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6.0,
                    height: 6.0,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const HorizontalSpacer(width: 6),
                  Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const HorizontalSpacer(width: 6),
                  Container(
                    width: 6.0,
                    height: 6.0,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cardholder Name",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const VerticalSpacer(height: 8),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      cursorColor: Theme.of(context).colorScheme.primary,
                      decoration: InputDecoration(
                        hintText: "Enter your name as written on card",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(10),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: const Color(0xFF1A1A1A).withOpacity(0.1),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacer(height: 24),
                    const Text(
                      "Card Number",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const VerticalSpacer(height: 8),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      cursorColor: Theme.of(context).colorScheme.primary,
                      decoration: InputDecoration(
                        hintText: "Enter card number",
                        contentPadding: const EdgeInsets.all(10),
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: const Color(0xFF1A1A1A).withOpacity(0.1),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacer(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "cvv/cvc",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const VerticalSpacer(height: 8),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                cursorColor:
                                    Theme.of(context).colorScheme.primary,
                                decoration: InputDecoration(
                                  hintText: "123",
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: const Color(0xFF1A1A1A)
                                        .withOpacity(0.2494),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.all(10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF1A1A1A)
                                          .withOpacity(0.1),
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const HorizontalSpacer(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Exp. Date",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const VerticalSpacer(height: 8),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                cursorColor:
                                    Theme.of(context).colorScheme.primary,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  hintText: "20/20",
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: const Color(0xFF1A1A1A)
                                        .withOpacity(0.2494),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF1A1A1A)
                                          .withOpacity(0.1),
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 81.0,
        width: 375.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(0, -10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 49.0,
                width: 281.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Save Changes",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const HorizontalSpacer(width: 15),
            InkWell(
              onTap: () => _showConfimrationDialog(context),
              child: Container(
                height: 49.0,
                width: 49.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green,
                ),
                child: const Center(
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: FittedBox(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showConfimrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: 373.0,
          width: 327.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                const VerticalSpacer(height: 40),
                const SizedBox(
                  width: 240.0,
                  height: 180.0,
                  child: FittedBox(
                    // child: SvgPicture.asset(
                    //     'assets/images/remove_illustration.svg'),
                    fit: BoxFit.fill,
                  ),
                ),
                const VerticalSpacer(height: 24),
                const Text(
                  "Are you sure to remove this card?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VerticalSpacer(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 49.0,
                        width: 148.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 49.0,
                        width: 148.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFFFB3640),
                        ),
                        child: const Center(
                          child: Text(
                            "Remove",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key, required this.card}) : super(key: key);

  final Cardd card;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 285.0,
          height: 170.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const Positioned(
          left: 5.0,
          top: 51.0,
          child: SizedBox(
            width: 396.0,
            height: 128.0,
            child: FittedBox(
              child: Icon(Icons.credit_card),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(
          width: 285.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 32.13,
                    height: 10.38,
                    child: FittedBox(
                      child: Icon(Icons.credit_card),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const VerticalSpacer(height: 7),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 35.0,
                    height: 26.0,
                    child: FittedBox(
                      child: Icon(Icons.credit_card),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const VerticalSpacer(height: 8),
                Text(
                  card.cardNumber,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const VerticalSpacer(height: 23),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Cardholder",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),
                        ),
                        const VerticalSpacer(height: 4),
                        Text(
                          card.cardHolderName,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const HorizontalSpacer(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Exp. Date",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),
                        ),
                        const VerticalSpacer(height: 4),
                        Text(
                          card.expiryDate,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Card",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cardholder Name",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const VerticalSpacer(height: 8),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      cursorColor: Theme.of(context).colorScheme.primary,
                      decoration: InputDecoration(
                        hintText: "Enter your name as written on card",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: const Color(0xFF1A1A1A).withOpacity(0.1),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacer(height: 24),
                    const Text(
                      "Card Number",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const VerticalSpacer(height: 8),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      cursorColor: Theme.of(context).colorScheme.primary,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Enter card number",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: const Color(0xFF1A1A1A).withOpacity(0.1),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacer(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "cvv/cvc",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const VerticalSpacer(height: 8),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                cursorColor:
                                    Theme.of(context).colorScheme.primary,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "123",
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: const Color(0xFF1A1A1A)
                                        .withOpacity(0.2494),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF1A1A1A)
                                          .withOpacity(0.1),
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const HorizontalSpacer(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Exp. Date",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const VerticalSpacer(height: 8),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                cursorColor:
                                    Theme.of(context).colorScheme.primary,
                                decoration: InputDecoration(
                                  hintText: "20/20",
                                  contentPadding: EdgeInsets.all(10),
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: const Color(0xFF1A1A1A)
                                        .withOpacity(0.2494),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF1A1A1A)
                                          .withOpacity(0.1),
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 81.0,
        width: 375.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(0, -10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            child: Container(
              height: 49.0,
              width: 345.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Submit Card",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

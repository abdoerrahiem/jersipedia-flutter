import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/text_input.dart';

class RegisterAddress extends StatefulWidget {
  const RegisterAddress({super.key});

  @override
  State<RegisterAddress> createState() => _RegisterAddressState();
}

class _RegisterAddressState extends State<RegisterAddress> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController =
        TextEditingController(text: '');

    return Scaffold(
      backgroundColor: blueColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 50),
          Align(
            child: Image.asset(
              'assets/images/register2.png',
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              fit: BoxFit.cover,
            ),
          ),
          TextInput(
            controller: addressController,
            placeholder: 'Address',
            title: 'Address',
            isMultipleLine: true,
            minLine: 5,
            borderRadius: 20,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text('Provinsi', style: whiteTextStyle.copyWith()),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: whiteColor,
            ),
            child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                borderRadius: BorderRadius.circular(20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                icon: Icon(Icons.expand_more, color: blackColor),
                value: '1',
                items: [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('Kalimantan Barat',
                        style: blackTextStyle.copyWith()),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Kalimantan Timur',
                        style: blackTextStyle.copyWith()),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('Kalimantan Selatan',
                        style: blackTextStyle.copyWith()),
                  ),
                ],
                onChanged: (value) {}),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text('City/Regency', style: whiteTextStyle.copyWith()),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: whiteColor,
            ),
            child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                borderRadius: BorderRadius.circular(20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                icon: Icon(Icons.expand_more, color: blackColor),
                value: '1',
                items: [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('Kalimantan Barat',
                        style: blackTextStyle.copyWith()),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Kalimantan Timur',
                        style: blackTextStyle.copyWith()),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('Kalimantan Selatan',
                        style: blackTextStyle.copyWith()),
                  ),
                ],
                onChanged: (value) {}),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: whiteColor),
                  borderRadius: BorderRadius.circular(999),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                shadowColor: whiteColor,
              ),
              child: Text(
                'Continue',
                style: whiteTextStyle.copyWith(),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

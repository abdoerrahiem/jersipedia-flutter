import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/text_input.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController oldPasswordController =
      TextEditingController(text: '');
  final TextEditingController newPasswordController =
      TextEditingController(text: '');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'Ubah Password',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: fontWeightBlack,
          ),
        ),
        centerTitle: true,
        backgroundColor: blueColor,
        leadingWidth: 90,
        leading: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                icon: const Icon(Icons.chevron_left),
                color: blueColor,
                iconSize: 30,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextInput(
                controller: oldPasswordController,
                placeholder: 'Password Lama',
                title: 'Password Lama',
                isPassword: true,
              ),
              const SizedBox(height: 15),
              TextInput(
                controller: newPasswordController,
                placeholder: 'Password Baru',
                title: 'Password Baru',
                isPassword: true,
              ),
              const SizedBox(height: 15),
              TextInput(
                controller: confirmPasswordController,
                placeholder: 'Konfirmasi Password Baru',
                title: 'Konfirmasi Password Baru',
                isPassword: true,
              ),
              const SizedBox(height: 100),
            ],
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.save,
                    color: whiteColor,
                  ),
                  label: Text('Simpan',
                      style: whiteTextStyle.copyWith(fontSize: 16)),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(blueColor),
                    overlayColor: MaterialStateProperty.all<Color>(greyColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

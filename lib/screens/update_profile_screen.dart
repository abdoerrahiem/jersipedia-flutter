import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/text_input.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController addressController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'Ubah Profil',
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: whiteColor,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                      side: BorderSide(color: whiteColor, width: 1),
                    ),
                  ),
                  child: Text(
                    'Ubah Photo',
                    style: whiteTextStyle.copyWith(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextInput(
                controller: nameController,
                placeholder: 'Name',
                title: 'Name',
              ),
              const SizedBox(height: 15),
              TextInput(
                controller: emailController,
                placeholder: 'Email',
                title: 'Email',
              ),
              const SizedBox(height: 15),
              TextInput(
                controller: phoneController,
                placeholder: 'Phone',
                title: 'Phone',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              TextInput(
                controller: addressController,
                placeholder: 'Address',
                title: 'Address',
                isMultipleLine: true,
                minLine: 5,
                borderRadius: 20,
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 15),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jersipedia/blocs/city/city_bloc.dart';
import 'package:jersipedia/blocs/province/province_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/models/update_photo_profile_model.dart';
import 'package:jersipedia/models/update_profile_model.dart';
import 'package:jersipedia/utils/function.dart';
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
  final TextEditingController provinceController =
      TextEditingController(text: '');
  final TextEditingController cityController = TextEditingController(text: '');
  String provinceName = '';
  String cityName = '';
  bool isAdmin = false;
  String photo = '';
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final userState = context.read<UserBloc>().state;
    if (userState is CurrentUserSuccess) {
      setState(() {
        nameController.text = userState.user.name.toString();
        emailController.text = userState.user.email.toString();
        phoneController.text = userState.user.phone.toString();
        addressController.text = userState.user.address.toString();
        provinceName = userState.user.province.toString();
        cityName = userState.user.city.toString();
        isAdmin = userState.user.isAdmin!;
        photo = userState.user.photo.toString();
      });
    }

    context.read<ProvinceBloc>().add(GetProvince());
  }

  void onSave() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        provinceName.trim().isEmpty ||
        cityName.trim().isEmpty) {
      return showSnackbar(context: context, message: 'Please input your data.');
    }

    context.read<UserBloc>().add(
          UpdateProfile(
            UpdateProfileModel(
              name: nameController.text,
              email: emailController.text,
              phone: phoneController.text,
              address: addressController.text,
              province: provinceName,
              city: cityName,
              isAdmin: isAdmin,
            ),
          ),
        );
  }

  void onChangePhoto() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      context.read<UserBloc>().add(
            UpdatePhotoProfile(
              UpdatePhotoProfileModel(
                name: image.name.toString(),
                type: image.mimeType.toString(),
                uri: image.path.toString(),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Update Profile',
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<ProvinceBloc, ProvinceState>(listener: (context, state) {
            if (state is ProvinceSuccess) {
              final foundProvince = state.province
                  .where((item) => item.province == provinceName)
                  .toList();

              setState(() {
                provinceController.text =
                    foundProvince[0].provinceId.toString();
              });

              context
                  .read<CityBloc>()
                  .add(GetCity(foundProvince[0].provinceId.toString()));
            }
          }),
          BlocListener<CityBloc, CityState>(listener: (context, state) {
            if (state is CitySuccess) {
              final foundCity = state.city
                  .where((item) => item.cityName == cityName)
                  .toList();

              setState(() {
                cityController.text = foundCity.isEmpty
                    ? state.city[0].cityId.toString()
                    : foundCity[0].cityId.toString();
                cityName = foundCity.isEmpty
                    ? state.city[0].cityName.toString()
                    : foundCity[0].cityName.toString();
              });
            }
          }),
          BlocListener<UserBloc, UserState>(listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              Navigator.pop(context);
              showSnackbar(
                context: context,
                message: state.message,
                type: SnackbarType.success,
              );
              context.read<UserBloc>().add(GetCurrentUser());
            }

            if (state is UpdateProfileFailed) {
              showSnackbar(context: context, message: state.e);
            }

            if (state is UpdatePhotoProfileSuccess) {
              showSnackbar(
                context: context,
                message: state.message,
                type: SnackbarType.success,
              );
              context.read<UserBloc>().add(GetCurrentUser());
            }

            if (state is UpdatePhotoProfileFailed) {
              showSnackbar(context: context, message: state.e);
            }

            if (state is CurrentUserSuccess) {
              photo = state.user.photo.toString();
            }
          }),
        ],
        child: Builder(
          builder: (context) {
            final provinceState = context.watch<ProvinceBloc>().state;
            final cityState = context.watch<CityBloc>().state;
            final userState = context.watch<UserBloc>().state;

            return Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    if (photo.isNotEmpty)
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: Image.network(
                            photo,
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
                        onPressed: onChangePhoto,
                        style: TextButton.styleFrom(
                          foregroundColor: whiteColor,
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                            side: BorderSide(color: whiteColor, width: 1),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Change Photo',
                              style: whiteTextStyle.copyWith(),
                            ),
                            if (userState is UpdatePhotoProfileLoading)
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 10,
                                height: 10,
                                child: CircularProgressIndicator(
                                  color: whiteColor,
                                  strokeWidth: 2,
                                ),
                              ),
                          ],
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
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
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
                    if (provinceState is ProvinceSuccess &&
                        provinceController.text.isNotEmpty)
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
                            value: provinceController.text,
                            items: provinceState.province
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.provinceId,
                                    child: Text(
                                      e.province.toString(),
                                      style: blackTextStyle.copyWith(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              final foundProvince = provinceState.province
                                  .where((item) => item.provinceId == value)
                                  .toList();

                              context
                                  .read<CityBloc>()
                                  .add(GetCity(value.toString()));

                              setState(() {
                                provinceController.text = value.toString();
                                provinceName =
                                    foundProvince[0].province.toString();
                              });
                            }),
                      ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text('City/Regency',
                          style: whiteTextStyle.copyWith()),
                    ),
                    if (cityState is CitySuccess &&
                        cityController.text.isNotEmpty)
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
                            value: cityController.text,
                            items: cityState.city
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.cityId,
                                    child: Text(
                                      e.cityName.toString(),
                                      style: blackTextStyle.copyWith(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              final foundCity = cityState.city
                                  .where((item) => item.cityId == value)
                                  .toList();

                              setState(() {
                                cityName = foundCity[0].cityName.toString();
                                cityController.text = value.toString();
                              });
                            }),
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
                        onPressed: onSave,
                        icon: Icon(
                          Icons.save,
                          color: whiteColor,
                        ),
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Save',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            ),
                            if (userState is UpdateProfileLoading)
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 10,
                                height: 10,
                                child: CircularProgressIndicator(
                                  color: whiteColor,
                                  strokeWidth: 2,
                                ),
                              ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          )),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(blueColor),
                          overlayColor:
                              MaterialStateProperty.all<Color>(greyColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/city/city_bloc.dart';
import 'package:jersipedia/blocs/province/province_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/models/register_model.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/text_input.dart';

class RegisterAddress extends StatefulWidget {
  final RegisterModel data;
  const RegisterAddress({
    super.key,
    required this.data,
  });

  @override
  State<RegisterAddress> createState() => _RegisterAddressState();
}

class _RegisterAddressState extends State<RegisterAddress> {
  final TextEditingController addressController =
      TextEditingController(text: '');
  String provinceName = '';
  String provinceId = '';
  String cityName = '';
  String cityId = '';

  @override
  void initState() {
    super.initState();
    context.read<ProvinceBloc>().add(GetProvince());
  }

  void onContinue() {
    if (addressController.text.trim().isEmpty ||
        provinceName.isEmpty ||
        cityName.isEmpty) {
      return showSnackbar(
          context: context, message: 'Input your email and password.');
    }

    context.read<UserBloc>().add(
          RegisterUser(
            widget.data.copyWith(
              address: addressController.text,
              province: provinceName,
              city: cityName,
              isAdmin: false,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: MultiBlocListener(
        listeners: [
          BlocListener<ProvinceBloc, ProvinceState>(listener: (context, state) {
            if (state is ProvinceSuccess) {
              setState(() {
                provinceId = state.province[0].provinceId.toString();
                provinceName = state.province[0].province.toString();
              });

              context
                  .read<CityBloc>()
                  .add(GetCity(state.province[0].provinceId.toString()));
            }
          }),
          BlocListener<CityBloc, CityState>(listener: (context, state) {
            if (state is CitySuccess) {
              final foundCity = state.city
                  .where((item) => item.cityName == cityName)
                  .toList();

              setState(() {
                cityId = foundCity.isEmpty
                    ? state.city[0].cityId.toString()
                    : foundCity[0].cityId.toString();
                cityName = foundCity.isEmpty
                    ? state.city[0].cityName.toString()
                    : foundCity[0].cityName.toString();
              });
            }
          }),
          BlocListener<UserBloc, UserState>(listener: (context, state) {
            if (state is RegisterUserSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
              showSnackbar(
                context: context,
                message: state.message,
                type: SnackbarType.success,
              );
            }

            if (state is RegisterUserFailed) {
              showSnackbar(context: context, message: state.e);
            }
          }),
        ],
        child: Builder(builder: (context) {
          final provinceState = context.watch<ProvinceBloc>().state;
          final cityState = context.watch<CityBloc>().state;
          final userState = context.watch<UserBloc>().state;

          return ListView(
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
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                placeholder: 'Address',
                title: 'Address',
                isMultipleLine: true,
                minLine: 5,
                borderRadius: 20,
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text('Province', style: whiteTextStyle.copyWith()),
              ),
              if (provinceState is ProvinceSuccess && provinceId.isNotEmpty)
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      icon: Icon(Icons.expand_more, color: blackColor),
                      value: provinceId,
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

                        context.read<CityBloc>().add(GetCity(value.toString()));

                        setState(() {
                          provinceId = value.toString();
                          provinceName = foundProvince[0].province.toString();
                        });
                      }),
                ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text('City/Regency', style: whiteTextStyle.copyWith()),
              ),
              if (cityState is CitySuccess && cityId.isNotEmpty)
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      icon: Icon(Icons.expand_more, color: blackColor),
                      value: cityId,
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
                          cityId = value.toString();
                          cityName = foundCity[0].cityName.toString();
                        });
                      }),
                ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onContinue,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Continue',
                        style: whiteTextStyle.copyWith(),
                      ),
                      if (userState is RegisterUserLoading)
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
              const SizedBox(height: 30),
            ],
          );
        }),
      ),
    );
  }
}

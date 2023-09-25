import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/models/update_password_model.dart';
import 'package:jersipedia/utils/function.dart';
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

  void onSave() {
    if (oldPasswordController.text.trim().isEmpty ||
        newPasswordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      return showSnackbar(context: context, message: 'Please input your data.');
    }

    if (newPasswordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      return showSnackbar(
          context: context, message: "New passwords don't match");
    }

    context.read<UserBloc>().add(
          UpdatePassword(
            UpdatePasswordModel(
              oldPassword: oldPasswordController.text,
              newPassword: newPasswordController.text,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'Update Password',
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
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UpdatePasswordFailed) {
            showSnackbar(context: context, message: state.e);
          }

          if (state is UpdatePasswordSuccess) {
            Navigator.pop(context);
            showSnackbar(
              context: context,
              message: state.message,
              type: SnackbarType.success,
            );
            context.read<UserBloc>().add(GetCurrentUser());
          }
        },
        child: Builder(builder: (context) {
          final userState = context.watch<UserBloc>().state;

          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  TextInput(
                    controller: oldPasswordController,
                    placeholder: 'Old Password',
                    title: 'Old Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 15),
                  TextInput(
                    controller: newPasswordController,
                    placeholder: 'New Password',
                    title: 'New Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 15),
                  TextInput(
                    controller: confirmPasswordController,
                    placeholder: 'Confirm New Password',
                    title: 'Confirm New Password',
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
                          if (userState is UpdatePasswordLoading)
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
        }),
      ),
    );
  }
}

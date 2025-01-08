import 'dart:io';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/category/data/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
class CreateCategoryBody extends StatefulWidget {
  const CreateCategoryBody({super.key, required this.nameCategoryController, required this.descriptionController, required this.TotalProductsController, required this.fromkey});
  final TextEditingController nameCategoryController;
  final TextEditingController descriptionController;
  final  TextEditingController TotalProductsController;
  final GlobalKey<FormState>fromkey;

  @override
  State<CreateCategoryBody> createState() => _CreateCategoryBodyState();
}

class _CreateCategoryBodyState extends State<CreateCategoryBody> {
  bool selectedChoice = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          CustomAppBarTitleArrow(arrow_back: true,
              onpressed: () {
                Navigator.pop(context);
              },
              title: "Create Category"),
          Padding(
            padding: EdgeInsets.only(
                top: 18.0.r,
                left: 18.0.r,
                right: 18.0.r,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                SizedBox(height: 30.h,),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter NameCategory ";
                    } else {
                      return null;
                    }
                  },
                  controller:widget.nameCategoryController ,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "NameCategory",
                ),
                SizedBox(height: 30.h,),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter Description ";
                    } else {
                      return null;
                    }
                  },
                  controller:widget.descriptionController ,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  label: "Description",
                ),SizedBox(height: 30.h,),

                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "You Must Enter TotalProducts ";
                    } else {
                      return null;
                    }
                  },
                  controller:widget.TotalProductsController ,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  label: "TotalProducts",
                ),
                SizedBox(height: 40.h,),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        CategoryCubit.get(context)
                            .imagepicker==null?  Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                            ),GestureDetector(
                              onTap:(){
                                ImagePicker()
                                    .pickImage(source: ImageSource.camera)
                                    .then((value) => CategoryCubit.get(context).pickImage(value!));},
                              child: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.myNavy,
                                      borderRadius: BorderRadius.circular(360.r)),
                                  child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.camera,
                                        color: AppColors.myWhite,
                                      ))),
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) => CategoryCubit.get(context).pickImage(value!));

                              },
                              child: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.myNavy,
                                      borderRadius: BorderRadius.circular(360.r)),
                                  child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.photoFilm,
                                        color: AppColors.myWhite,
                                      ))),
                            ),],):SizedBox(),
                        SizedBox(
                          width: 60.w,
                        ),
                        SizedBox(child:
                        CategoryCubit.get(context)
                            .imagepicker==null?
                        SizedBox():
                        ClipRRect(borderRadius: BorderRadius.circular(16),
                          child: Image.file(fit: BoxFit.fill, height: 150.h,
                              width: 150.w,File(CategoryCubit.get(context)
                                  .imagepicker!
                                  .path)),
                        ))
                      ],
                    );
                  },
                ),


                SizedBox(
                  height: 30.h,
                ),
                BlocConsumer<CategoryCubit, CategoryState>(
                  listener: (context, state) {
                    if(state is CreateCagetorySuccessState){
                      flutterToast(message: "Success", success: true);
                    }
                    if(state is CreateCagetoryErrorState){
                      flutterToast(message: state.errorMessage, success: false);
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomButton(text: "Create Category",color: AppColors.primaryColor,width: 300.w
                    ,  isLoading: state is CreateCagetoryLoadingState?false:true,
                      onTap: () {
                        int priceProd = int
                            .tryParse(
                            widget.TotalProductsController
                                .text) ?? 0;
                        if(widget.fromkey.currentState!.validate()){
                          if(CategoryCubit.get(context).imagepicker==null){
                            flutterToast(message: "please pick the image ", success: false);
                          }
                          else{
                            CategoryCubit.get(context).createCagetory(
                                isDeleted: true
                                , name: widget.nameCategoryController.text,
                                description: widget.descriptionController.text,
                                totalProducts:priceProd
                            );
                          }
                        }
                      },
                    );
                  },
                )],
            ),
          )
        ]
    );
  }
}

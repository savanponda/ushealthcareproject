
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:UShealthcare/apps/Model/location/City.dart';
import 'package:UShealthcare/apps/Model/location/Location.dart';
import 'package:UShealthcare/apps/Model/location/State.dart' as st;

import 'package:UShealthcare/apps/common/bottom_button_view.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/ValidationHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';

import 'package:UShealthcare/style/InputDecoration.dart';
import 'package:UShealthcare/utils/AppGlobal.dart';
class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  List<Location> countryList = [];
  Location? selectedCountry;

  List<st.State> stateList = [];
  st.State? selectedState;

  List<City> cityList = [];
  City? selectedCity;

  TextEditingController addressTitleIC = TextEditingController();
  TextEditingController zipCodeIC = TextEditingController();
  TextEditingController addressIC = TextEditingController();
  FocusNode addressTitleNode = FocusNode();
  FocusNode zipCodeNode = FocusNode();
  FocusNode addressNode = FocusNode();
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData(){
    AppGlobal.getCountriesData((List<Location> data){
      print(data.length);

      setState((){
        countryList = data;

        for(int countryIndex=0;countryIndex<countryList.length;countryIndex++){
          if(countryList[countryIndex].name==countryValue){
            selectedCountry = countryList[countryIndex];
            stateList.clear();
            stateList.addAll(selectedCountry!.states!);
            selectedState = null;

            for(int stateIndex=0;stateIndex<stateList.length;stateIndex++){
              if(stateList[stateIndex].name==stateValue){
                selectedState = stateList[stateIndex];
                cityList.clear();
                cityList.addAll(selectedState!.cities!);
                selectedCity = null;

                for(int cityIndex=0;cityIndex<cityList.length;cityIndex++){
                  if(cityList[cityIndex].name==cityValue){
                    selectedCity = cityList[cityIndex];
                  }
                }
              }
            }
          }
        }

      });



    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "addAddress"),
            showFilterIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            shownotificationIcon: false,
            showIcon: true,
            showBackIcon: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),

      body:  Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  WidgetHelper.getFieldSeparator(),
                  TextFormField(
                    focusNode: addressTitleNode,
                    controller: addressTitleIC,
                    decoration:CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "addressTitle"),
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                    textInputAction: TextInputAction.next,
                  ),

                  WidgetHelper.getFieldSeparator(),
                  DropdownSearch<Location>(
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      isFilterOnline: true,
                    ),
                    dropdownButtonProps: DropdownButtonProps(
                        icon: Icon(Icons.keyboard_arrow_down)
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: CustomInputDecoration.getInputDecoration(
                          hintText:  buildTranslate(context, "selectCountry"),
                          // labelText:  buildTranslate(context, "SelectCountry")
                      ),
                    ),
                    items: countryList,
                    selectedItem: selectedCountry,
                    itemAsString: (Location? row) => row!.name!,
                    onChanged: (Location? data) {
                      setState((){
                        selectedCountry = data!;

                        countryValue = selectedCountry!.name!;

                        stateList.clear();
                        stateList.addAll(selectedCountry!.states!);
                        selectedState = null;
                        stateValue = "";

                        cityList.clear();
                        selectedCity = null;
                        cityValue = "";

                      });
                    },
                    //validator: (value) => ValidationHelper.checkBlankValidation(context, value, "countryValidation"),
                    //  selectedItem: dropdownSelectedItems
                  ),

                  WidgetHelper.getFieldSeparator(),
                  DropdownSearch<st.State>(
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      isFilterOnline: true,
                    ),
                    dropdownButtonProps: DropdownButtonProps(
                        icon: Icon(Icons.keyboard_arrow_down)
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: CustomInputDecoration.getInputDecoration(
                          hintText:  buildTranslate(context, "selectState"),
                          // labelText:  buildTranslate(context, "selectState")
                      ),
                    ),
                    items: stateList,
                    selectedItem: selectedState,
                    itemAsString: (st.State? row) => row!.name!,
                    onChanged: (st.State? data) {
                      setState((){
                        selectedState = data!;
                        stateValue = selectedState!.name!;

                        cityList.clear();
                        cityList.addAll(selectedState!.cities!);
                        selectedCity = null;
                        cityValue = "";

                      });
                    },
                    //validator: (value) => ValidationHelper.checkBlankValidation(context, value, "stateValidation"),
                    //  selectedItem: dropdownSelectedItems
                  ),

                  WidgetHelper.getFieldSeparator(),
                  DropdownSearch<City>(
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      isFilterOnline: true,
                    ),
                    dropdownButtonProps: DropdownButtonProps(
                        icon: Icon(Icons.keyboard_arrow_down)
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: CustomInputDecoration.getInputDecoration(
                          hintText:  buildTranslate(context, "selectCity"),
                          // labelText:  buildTranslate(context, "selectCity")
                      ),
                    ),
                    items: cityList,
                    selectedItem: selectedCity,
                    itemAsString: (City? row) => row!.name!,
                    onChanged: (City? data) {
                      selectedCity = data!;
                      cityValue = selectedCity!.name!;
                    },
                    //validator: (value) => ValidationHelper.checkBlankValidation(context, value, "cityValidation"),
                    //  selectedItem: dropdownSelectedItems
                  ),

                  WidgetHelper.getFieldSeparator(),
                  TextFormField(
                    focusNode: zipCodeNode,
                    controller: zipCodeIC,
                    decoration:CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "zipCode"),
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                    textInputAction: TextInputAction.next,
                  ),

                  WidgetHelper.getFieldSeparator(),
                  TextFormField(
                    focusNode: addressNode,
                    decoration: CustomInputDecoration.getInputDecoration(
                      hintText: buildTranslate(context, "addressField"),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    controller: addressIC,
                    minLines: 3,
                    maxLines: 5,
                    inputFormatters: [LengthLimitingTextInputFormatter(250)],
                    validator: (value) => ValidationHelper.checkBlankValidation(context, value, "messageValidation"),
                  ),

                ],),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonView(
        ButtonTitle: 'addAddress',
        deSelect: true,
        callback: (){
          NavigatorHelper.remove();
        },),
    );
  }
}

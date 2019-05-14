import 'package:flutter/material.dart';
import 'package:flutter_wan_android/blocs/app_bloc.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/constants/constants.dart';
import 'package:flutter_wan_android/model/language_model.dart';
import 'package:flutter_wan_android/res/localizations.dart';
import 'package:flutter_wan_android/utlis/sp_helper.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<LanguageModel> _list;
  LanguageModel _currentLanguage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _list = LanguageModel.getList(context);
    print('====>LanguageModel ${_list.length}');
    _currentLanguage = SpHelper.getObject<LanguageModel>(Constants.language);
    if (_currentLanguage == null) {
      _currentLanguage = _list[0];
    }
    _updateData();
  }

  @override
  Widget build(BuildContext context) {
    AppBloc bloc = BlocProvider.of<AppBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationsControl.of(context).get(Ids.language)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 65.0,
              child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(LocalizationsControl.of(context).get(Ids.sure)),
                  onPressed: () {
                    SpHelper.putObject(Constants.language, _currentLanguage);
                    bloc.updateApp(Constants.update_app);
                    Navigator.of(context).pop();
                  }),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          LanguageModel model = _list[index];
          return ListTile(
            title: Text(
              model.titleId,
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Radio(
                value: true,
                groupValue: model.isSelected == true,
                onChanged: (value) {
                  setState(() {
                    _currentLanguage = model;
                    _updateData();
                  });
                }),
            onTap: () {
              setState(() {
                _currentLanguage = model;
                _updateData();
              });
            },
          );
        },
      ),
    );
  }

  void _updateData() {
    String language = _currentLanguage.countryCode;
    for (int i = 0, length = _list.length; i < length; i++) {
      _list[i].isSelected = (_list[i].countryCode == language);
    }
  }
}

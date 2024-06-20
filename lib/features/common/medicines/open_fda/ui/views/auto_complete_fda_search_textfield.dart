import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/logic/cubit/open_fda_drugs_cubit.dart';
import 'package:rxdart/rxdart.dart';

class SearchForFdaDrugsTextField extends StatefulWidget {
  const SearchForFdaDrugsTextField({super.key});

  @override
  State<SearchForFdaDrugsTextField> createState() =>
      _SearchForFdaDrugsTextFieldState();
}

class _SearchForFdaDrugsTextFieldState
    extends State<SearchForFdaDrugsTextField> {
  final TextEditingController _controller = TextEditingController();
  final _searchQuerySubject = BehaviorSubject<String>();

  @override
  void initState() {
    super.initState();
    _searchQuerySubject.stream
        .debounceTime(const Duration(milliseconds: 500))
        .listen((query) {
      context.read<OpenFdaDrugsCubit>().getAutoCompleteDrugs(query);
    });
  }

  @override
  void dispose() {
    _searchQuerySubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (d) async {
        _searchQuerySubject.add(d);
      },
      style: AppTextStyles.jannat14OnSurface(context),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        hintText: 'Start typing...English only',
      ),
    );
  }
}

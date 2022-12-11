import 'package:debt_example/config/constants/app_colors.dart';
import 'package:debt_example/di/dependency_injection.dart';
import 'package:debt_example/presentation/pages/home_page/presentation/manager/debt_cubit.dart';
import 'package:debt_example/presentation/pages/home_page/presentation/widgets/appbar_title_widget.dart';
import 'package:debt_example/presentation/pages/home_page/presentation/widgets/debt_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(''),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage.screen(),
              )),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
        create: (context) => di<DebtCubit>()..getDebtData(),
        child: const HomePage(),
      );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 80.h,
        title: const AppBarTitle(),
      ),
      body: BlocBuilder<DebtCubit, DebtState>(
        builder: (context, state) {
          if (state is DebtLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
              ),
            );
          } else if (state is DebtFailureState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is DebtLoadedState) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: size.height / 20),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return DebtListItemWidget(
                  size: size,
                  model: state.data[index],
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

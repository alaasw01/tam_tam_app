import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/custom_widgets/custom_category.dart';
part 'cubit/categories_cubit.dart';
part 'cubit/categories_state.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Categories',
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocProvider(
        create: (context) => CategoriesCubit(),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            final cubit = context.read<CategoriesCubit>();
            return Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.8,
                ),
                itemCount: cubit.categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Customcategory(
                    title: cubit.categories[index]['title'],
                    image: cubit.categories[index]['image'],
                    color: cubit.categories[index]['color'],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

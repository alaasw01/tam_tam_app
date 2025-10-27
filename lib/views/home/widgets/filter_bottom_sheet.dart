part of '../home_view.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key, required this.cubit});
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'Filter',
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 15,
                            child: Icon(
                              Icons.close_rounded,
                              color: Colors.grey.shade400,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Age',
                  style: AppStyles.textStyle20.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.ages.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: BottomSheetItem(
                        title: cubit.ages[index],
                        selectedItem: cubit.selectedAge == index,
                        onItemTap: () => cubit.changeSelectedAge(index),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.grey.shade300, thickness: 2, height: 20),
                const SizedBox(height: 20),
                Text(
                  'Gender',
                  style: AppStyles.textStyle20.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.gender.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: BottomSheetItem(
                        title: cubit.gender[index],
                        selectedItem: cubit.selectedGender == index,
                        onItemTap: () => cubit.changeSelectedGender(index),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.grey.shade300, thickness: 2, height: 20),
                const SizedBox(height: 20),
                Text(
                  'Quick price selection',
                  style: AppStyles.textStyle20.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.prices.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: BottomSheetItem(
                        title: cubit.prices[index],
                        selectedItem: cubit.selectedPrice == index,
                        onItemTap: () => cubit.changeSelectedPrice(index),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: CustomButton(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    onPressed: () {},
                    raduis: 50,
                    text: 'Apply',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

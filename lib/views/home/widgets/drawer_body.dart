part of '../home_view.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff7b4b8), Color(0xfff0939b)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Image.asset(
                    AppImages.logo,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                SliverList.builder(
                  itemCount: cubit.drawerItem.length,
                  itemBuilder: (context, index) => DrawerItem(
                    icon: cubit.drawerItem[index]['icon'],
                    title: cubit.drawerItem[index]['title'],
                    onTap: () => cubit.onDrawerItemTap(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

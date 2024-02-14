import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibaza_mock_data/assets/constants/icons.dart';
import 'package:ibaza_mock_data/features/category/data/model/status.dart';
import 'package:ibaza_mock_data/features/category/presentation/bloc/category_bloc.dart';
import 'package:ibaza_mock_data/features/category/presentation/widgets/category_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 116,
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(2),
                leading: SvgPicture.asset(
                  "assets/icons/navbar/category.svg",
                  color: Colors.yellow,
                ),
                title: const Text(
                  "Katalog",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              // const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 44, vertical: 13.5),
                          prefixIcon: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.search),
                            ),
                          ),
                          // suffixIcon: Container(
                          //   child: GestureDetector(
                          //     onTap: () {},
                          //     child: Padding(
                          //         padding: const EdgeInsets.all(12.0),
                          //         child: Icon(Icons.search)),
                          //   ),
                          // ),
                          filled: true,
                          fillColor: Color.fromRGBO(243, 242, 245, 1),
                          hintText: "Izlash",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          switch (state.status) {
            case LoadingStatus.pure:
              print("object");
              context.read<CategoryBloc>().add(LoadingCategory());
              return const SizedBox();
            case LoadingStatus.loading:
              return const Center(child: const CupertinoActivityIndicator());
            case LoadingStatus.loadedWithSuccess:
              return state.isSearching
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                      ),
                      itemCount: state.searchedCategory.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          category: state.searchedCategory[index],
                        );
                      },
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                      ),
                      itemCount: state.categoryList.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          category: state.categoryList[index],
                        );
                      },
                    );
            default:
              return Container(
                color: Colors.red,
                width: 50,
                height: 50,
              );
          }
        },
      ),
    );
  }
}

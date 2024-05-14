import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_code_test/core/router/app_router.dart';
import 'package:salt_code_test/core/ui_constants/app_fonts.dart';
import 'package:salt_code_test/core/ui_constants/app_size.dart';
import 'package:salt_code_test/injection.dart';
import 'package:salt_code_test/presentations/bloc/home_bloc/home_bloc.dart';
import 'package:salt_code_test/presentations/widget/news_shimmer.dart';
import 'package:salt_code_test/presentations/widget/on_going_loading.dart';

import '../widget/news_item.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => locator<HomeBloc>(), child: this);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<HomeBloc>(context).add(NewsFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.20;
      if (maxScroll - currentScroll <= delta) {
        context.read<HomeBloc>().add(NextNewsFetched());
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Today",
          style: AppFonts.primaryBoldTextStyle,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeBloc>().add(NewsFetched());
          },
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case RequestStatus.failure:
                        return Center(
                          child: Text(
                            state.errorMessage,
                          ),
                        );
                      case RequestStatus.success:
                        if (state.articles.isEmpty) {
                          return const Center(child: Text('no posts'));
                        }
                        return ListView.builder(
                          itemCount: state.hasReachMax
                              ? state.articles.length
                              : state.articles.length + 1,
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.padding),
                          itemBuilder: (BuildContext context, int index) {
                            final article =state.articles[index];
                            return index >= state.articles.length
                                ? const OnGoingLoading()
                                : InkWell(
                                  onTap: (){
                                    context.router.push(DetailNewsRoute(article: article));
                                  },
                                  child: NewsItem(
                                      article: article,
                                      index: index,
                                    ),
                                );
                          },
                        );
                      case RequestStatus.intital:
                        return ListView.builder(
                          itemCount: 5,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.padding),
                          itemBuilder: (BuildContext context, int index) {
                            return const NewsShimmerItem();
                          },
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

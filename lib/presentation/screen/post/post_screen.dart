import 'package:admin_portal/application/post/bloc/post_bloc.dart';
import 'package:admin_portal/infrastructure/core/app_extension.dart';
import 'package:admin_portal/presentation/common_widget.dart/app_loading_widget.dart';
import 'package:admin_portal/presentation/core/app_color.dart';
import 'package:admin_portal/presentation/core/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _columnPadding = 20;

@RoutePage()
class PostScreen extends StatefulWidget {
  const PostScreen({super.key, @PathParam('id') this.id});
  final int? id;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostListFetched(id: widget.id ?? -1));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state.status == PostStatus.loading) {
          return const AppLoadingWidget();
        }
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                context.loc.post.extralargeText,
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: scrollController,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Table(
                          children: [
                            TableRow(
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.all(_columnPadding),
                                    child: ("Id".toUpperCase()).customText(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.all(_columnPadding),
                                    child: ("Title".toUpperCase()).customText(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.all(_columnPadding),
                                    child: ("Body".toUpperCase()).customText(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                            ...state.postList.map((e) => TableRow(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: AppColor.greyColor),
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    children: [
                                      TableRowInkWell(
                                        onTap: () {
                                          AutoRouter.of(context)
                                              .push(PostDetailsRoute(id: e.id));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              _columnPadding),
                                          child: (e.id.toString()).mediumText,
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              _columnPadding),
                                          child: (e.title ?? "").mediumText,
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              _columnPadding),
                                          child: (e.body ?? "").mediumText,
                                        ),
                                      )
                                    ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

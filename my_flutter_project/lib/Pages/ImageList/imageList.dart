import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Class/ImageList/ProviderClass/imageProvider.dart';
import '../../Class/widgetClass/GenericWidget/appBarWidget.dart';

class MyImageListPage extends ConsumerStatefulWidget {
  const MyImageListPage({super.key});

  @override
  ConsumerState<MyImageListPage> createState() => _MyImageListPageState();
}

class _MyImageListPageState extends ConsumerState<MyImageListPage> {
  int pageIndex = 1;
  int pageLimit = 3;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initial load of images
    ref.read(imageStateProvider.notifier).loadMoreImages(pageIndex, pageLimit);
  }

  @override
  Widget build(BuildContext context){
    //state class here
    final stateManager = ref.watch(imageStateProvider);

    return Scaffold(
      appBar: const AppBarWidget(title: "Scrollable List View",
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo){
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent
              && !isLoading) {
            isLoading = true;
            pageIndex += 1;
            ref.read(imageStateProvider.notifier).
            loadMoreImages(pageIndex, pageLimit).then((_) {
              isLoading = false;
            });
            return true;
          }
          return false;
        },
        child: SizedBox(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, _) => const SizedBox(height: 12),
            itemCount: stateManager.imageUrl.length,
            itemBuilder: (context, index) => buildCard(
                stateManager.imageID[index],
                stateManager.imageUrl[index],
                stateManager.imageAuthor[index]),
          ),
        ),
      ),
    );
  }

  //UI code here
  Widget buildCard(String imageId, String imageUrl, String imageAuthor) => Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey[200],
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.6),
          spreadRadius: 5,
          blurRadius: 8,
          offset: const Offset(0, 3), // Changes the position of the shadow
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded( // Text block
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(imageId, style: TextStyle(fontSize: 12), textAlign: TextAlign.left,),
              Text(imageAuthor, style: TextStyle(fontSize: 16), textAlign: TextAlign.left,),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, imageUrl) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, imageUrl, error) => const Icon(Icons.error),
            width: 100, // Set width for the image
            height: 100, // Set height for the image
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

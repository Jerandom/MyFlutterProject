import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Class/Providers/imageProvider.dart';

class MyImageListPage extends ConsumerStatefulWidget {
  const MyImageListPage({super.key});

  @override
  ConsumerState<MyImageListPage> createState() => _MyImageListPageState();
}

class _MyImageListPageState extends ConsumerState<MyImageListPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // Use addPostFrameCallback to defer provider access until the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //check if the list is empty
      final imageState = ref.read(imageProvider);
      if(imageState.imageUrl.isEmpty){
        // Access the initial values from the provider
        final int pageIndex = imageState.pageIndex;
        final int pageLimit = imageState.pageLimit;

        //initial load of images
        ref.read(imageProvider.notifier).loadAndDecodeImages(pageIndex, pageLimit);
        ref.read(imageProvider.notifier).setPageIndex(pageIndex + 2);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    //state class here
    final imageState = ref.watch(imageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text( "Image List"),
        centerTitle: true,
        elevation: 0,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo){
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent
              && !isLoading) {
            isLoading = true;
            ref.read(imageProvider.notifier).setPageIndex(imageState.pageIndex + 1);
            ref.read(imageProvider.notifier).
            loadAndDecodeImages(imageState.pageIndex, imageState.pageLimit).then((void _) {
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
            itemCount: imageState.imageUrl.length,
            itemBuilder: (context, index) => buildCard(
                imageState.imageID[index],
                imageState.imageUrl[index],
                imageState.imageAuthor[index]),
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

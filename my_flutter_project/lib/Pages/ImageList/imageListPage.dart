import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_flutter_project/Class/Providers/imageIndexProvider.dart';

import '../../Class/Providers/imageProvider.dart';
import '../GenericWidget/appBarWidget.dart';

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
        final imageIndexState = ref.read(imageIndexProvider);
        final int pageIndex = imageIndexState.pageIndex;
        final int pageLimit = imageIndexState.pageLimit;

        //initial load of images
        ref.read(imageProvider.notifier).loadAndDecodeImages(pageIndex, pageLimit);
        ref.read(imageIndexProvider.notifier).setPageIndex(pageIndex + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    //state class here
    final imageState = ref.watch(imageProvider);
    final imageIndexState = ref.watch(imageIndexProvider);
    final int pageIndex = imageIndexState.pageIndex;
    final int pageLimit = imageIndexState.pageLimit;

    return Scaffold(
      appBar: AppBar(
        title: Text( "Image List",
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo){
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent
              && !isLoading) {
            isLoading = true;
            ref.read(imageIndexProvider.notifier).setPageIndex(pageIndex + 1);
            ref.read(imageProvider.notifier).
            loadAndDecodeImages(pageIndex, pageLimit).then((_) {
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

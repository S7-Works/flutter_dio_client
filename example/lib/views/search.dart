import 'package:any_link_preview/any_link_preview.dart';
import 'package:example/provider/companies_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchFromApi extends HookConsumerWidget {
  const SearchFromApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(getCompanyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search from API'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // controller: _controller,
              cursorColor: Colors.greenAccent,
              decoration: InputDecoration(
                hintText: "Enter text here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  ref.read(getCompanyProvider.notifier).fetchCompanies(value);
                } else {
                  ref.read(getCompanyProvider.notifier).clear();
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: companies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: AnyLinkPreview(
                    link: "https://${companies[index].domain}",
                    displayDirection: UIDirection.uiDirectionHorizontal,
                    showMultimedia: false,
                    bodyMaxLines: 5,
                    bodyTextOverflow: TextOverflow.ellipsis,
                    titleStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    bodyStyle:
                        const TextStyle(color: Colors.grey, fontSize: 12),
                    errorBody: 'Show my custom error body',
                    errorTitle: 'Show my custom error title',
                    errorWidget: Container(
                      color: Colors.grey[300],
                      child: const Text('Oops!'),
                    ),
                    errorImage: "https://google.com/",
                    cache: const Duration(days: 7),
                    backgroundColor: Colors.grey[300],
                    borderRadius: 12,
                    removeElevation: true,
                    boxShadow: const [
                      BoxShadow(blurRadius: 3, color: Colors.grey)
                    ],
                    onTap: () {}, // This disables tap event
                  ),
                );

                // SimpleUrlPreview(
                //   elevation: 0,
                //   isShowLink: true,
                //   bgColor: const Color(0xFFF2F2F7),
                //   url: 'https://${companies[index].domain}',
                //   titleStyle: const TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                //   descriptionStyle: const TextStyle(
                //     fontSize: 14,
                //     color: Color(0xFF3C3C43),
                //   ),
                //   siteNameStyle: TextStyle(
                //     fontSize: AppSizes.appCustomSize(14.0),
                //     color: Theme.of(context).primaryColor,
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class SliverFirst extends StatelessWidget {
  const SliverFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            toolbarHeight: 60,
            floating: false,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              background: Image(

                image: NetworkImage(
                  "https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg",
                ),
                fit: BoxFit.fitWidth,
              ),
              title: Text(
                "Hi! Karanbir Singh",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.purpleAccent,
                      Colors.purple,
                      Colors.deepPurpleAccent,
                      Colors.deepPurple,
                    ],
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$ 12345",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    Text(
                      "Current Balance",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              title: Text("Wallet", style: TextStyle(color: Colors.white)),
            ),
          ),

          SliverAppBar(
            backgroundColor: Colors.white,
            //              foregroundColor: Colors.deepPurple,
            pinned: true,
            expandedHeight: 120,
            toolbarHeight: 120,

            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quick Actions",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildQuickAction(
                        actionLebal: 'Top up',
                        actionIcon: Icons.add,
                      ),
                      buildQuickAction(
                        actionLebal: 'Send',
                        actionIcon: Icons.send,
                      ),
                      buildQuickAction(
                        actionLebal: 'Request',
                        actionIcon: Icons.call_received,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
                ) {
              return buildTransactionTile(
                title: "Transaction ${index + 1}",
                subTitle: "subTitle Transaction $index",
                amount: "${123 * (index + 1)}",
                isPositive: index.isEven,
              );
            }, childCount: 20),
          ),

          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: 64,
                  color: Colors.deepPurple,
                ),

                SizedBox(height: 16),

                Text(
                  "Explore New Features",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    elevation: 2,
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Explore"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget buildQuickAction({
    required String actionLebal,
    required IconData actionIcon,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(actionIcon, color: Colors.deepPurple, size: 32),

        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            actionLebal,
            style: TextStyle(fontSize: 16, color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }

  Widget buildTransactionTile({
    required String title,
    required String subTitle,
    required String amount,
    required bool isPositive,
  }) {
    var iconData = isPositive ? Icons.arrow_upward : Icons.arrow_downward;
    var colorTransaction = isPositive ? Colors.green : Colors.red;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: colorTransaction,
            child: Icon(iconData),
          ),

          title: Text(title),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: Text(subTitle),
          ),

          trailing: Text(
            amount,
            style: TextStyle(fontSize: 18, color: colorTransaction),
          ),

          titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
          subtitleTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }

}


/*
*
*   CachedNetworkImage(
                imageUrl: 'https://via.placeholder.com/300x150',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.colorBurn,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),*/

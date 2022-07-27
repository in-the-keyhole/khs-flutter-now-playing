import 'package:graphql_flutter/graphql_flutter.dart';
/*
const uri = 'https://movies.keyhole.institute/graphql'; // <-- add the URL of the GraphQL server here
export function createApollo(httpLink: HttpLink): ApolloClientOptions<any> {
  return {
    link: httpLink.create({uri}),
    cache: new InMemoryCache(),
  };
}

@NgModule({
  exports: [ApolloModule],
  providers: [
    {
      provide: APOLLO_OPTIONS,
      useFactory: createApollo,
      deps: [HttpLink],
    },
  ],
})
export class GraphQLModule {}

*/
class MyHomePage extends StatelessWidget {
    //@override
    /*Widget build(BuildContext) {
        return Query(
            options: QueryOptions(
                document: gql(readCounters),
                variables: {
                'counterId': 23,
                },
                pollInterval: Duration(seconds: 10),
            ),
            builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
                if (result.hasException) {
                    return Text(result.exception.toString());
                }

                if (result.isLoading) {
                    return Text('Loading');
                }

                // it can be either Map or List
                List counters = result.data['counter'];

                return ListView.builder(
                itemCount: repositories.length,
                itemBuilder: (context, index) {
                    return Text(counters\[index\]['name']);
                });
            },
        )
    }*/
}
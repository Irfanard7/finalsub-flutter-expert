library tvseries;

//Data
export 'data/datasources/db/database_helper_tvs.dart';
export 'data/datasources/tvs_local_data_source.dart';
export 'data/datasources/tvs_remote_data_source.dart';

export 'data/models/tvs_detail_model.dart';
export 'data/models/tvs_model.dart';
export 'data/models/tvs_response.dart';
export 'data/models/tvs_table.dart';

export 'data/repositories/tvs_repository_impl.dart';

//Domain
export 'domain/entities/tvs.dart';
export 'domain/entities/tvs_detail.dart';

export 'domain/repositories/tvs_repository.dart';

export 'domain/usecases/get_now_playing_tvs.dart';
export 'domain/usecases/get_popular_tvs.dart';
export 'domain/usecases/get_top_rated_tvs.dart';
export 'domain/usecases/get_tvs_detail.dart';
export 'domain/usecases/get_tvs_recommendations.dart';
export 'domain/usecases/get_watchlist_tvs.dart';
export 'domain/usecases/get_watchlist_tvs_status.dart';
export 'domain/usecases/remove_tvs_watchlist.dart';
export 'domain/usecases/save_tvs_watchlist.dart';

//Presentation
export 'presentation/bloc/tvs_bloc.dart';

export 'presentation/pages/home_tvs_page.dart';
export 'presentation/pages/popular_tvs_page.dart';
export 'presentation/pages/top_rated_tvs_page.dart';
export 'presentation/pages/tvs_detail_page.dart';
export 'presentation/pages/watchlist_tvs_page.dart';

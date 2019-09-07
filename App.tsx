import React from "react";
import {Header} from "react-native-elements";
import {View} from "react-native";
import OrganizationSelector from "./src/components/views/OrganizationSelector";
import {Provider} from "react-redux";
import {applyMiddleware, combineReducers, compose, createStore} from "redux";
import {organizationsReducer} from "./src/store/organizations/reducer";
import createSagaMiddleware from "redux-saga"
import rootSaga from "./src/store/rootSaga";

const sagaMiddleware = createSagaMiddleware();

// @ts-ignore
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

const store = createStore(
    combineReducers(
        {
            organizations: organizationsReducer
        }
    ),
    composeEnhancers(
        applyMiddleware(sagaMiddleware)
    )
);

sagaMiddleware.run(rootSaga);

const App = () => {
    return (
        <Provider store={store}>
            <View>
                <Header
                    leftComponent={{icon: 'menu', color: '#fff'}}
                    centerComponent={{text: 'Buggerino', style: {color: '#fff'}}}
                />

                <OrganizationSelector/>
            </View>
        </Provider>
    );
};

export default App;

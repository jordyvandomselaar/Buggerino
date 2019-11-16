import {applyMiddleware, combineReducers, compose, createStore} from "redux";
import {organizationsReducer} from "./organizations/reducer";
import createSagaMiddleware from "@redux-saga/core";
import rootSaga from "./rootSaga";
import {projectsReducer} from "./projects/reducer";
import {errorsReducer} from "./errors/reducer";
import {eventsReducer} from "./events/reducer";
import {userReducer} from "./user/reducer";

const sagaMiddleware = createSagaMiddleware();

// @ts-ignore
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

const rootReducer = combineReducers(
    {
        organizations: organizationsReducer,
        projects: projectsReducer,
        errors: errorsReducer,
        events: eventsReducer,
        user: userReducer
    }
);

export type AppState = ReturnType<typeof rootReducer>;

const store = createStore(
    rootReducer,
    composeEnhancers(
        applyMiddleware(sagaMiddleware)
    )
);

sagaMiddleware.run(rootSaga);

export default store;

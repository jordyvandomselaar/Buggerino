import {all} from "redux-saga/effects"
import launchSaga from "./launchSaga";
import watchFetchOrganizations from "./organizations/saga";
import watchFetchProjects from "./projects/saga";
import watchFetchErrors from "./errors/saga";
import watchFetchEvents from "./events/saga";

export default function* rootSaga() {
    yield all([
        launchSaga(),
        watchFetchOrganizations(),
        watchFetchProjects(),
        watchFetchErrors(),
        watchFetchEvents()
    ]);
};

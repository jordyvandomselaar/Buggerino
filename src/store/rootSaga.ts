import {all} from "redux-saga/effects"
import launchSaga from "./launchSaga";
import watchFetchOrganizations from "./organizations/saga";
import watchFetchProjects from "./projects/saga";

export default function* rootSaga() {
    yield all([
        launchSaga(),
        watchFetchOrganizations(),
        watchFetchProjects()
    ]);
};

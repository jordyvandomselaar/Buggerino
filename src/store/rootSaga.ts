import {all} from "redux-saga/effects"
import launchSaga from "./launchSaga";
import watchFetchOrganizations from "./organizations/saga";

export default function* rootSaga() {
    yield all([
        launchSaga(),
        watchFetchOrganizations()
    ]);
};

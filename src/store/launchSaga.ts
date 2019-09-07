import {put} from "redux-saga/effects"
import {loadOrganizations} from "./organizations/actions";

export default function* launchSaga() {
    yield put(loadOrganizations())
};

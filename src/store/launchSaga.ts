import {put} from "redux-saga/effects"
import {loadOrganizations} from "./organizations/actions";
import {loadUserInformation} from "./user/actions";

export default function* launchSaga() {
    yield put(loadOrganizations())
    yield put(loadUserInformation());
};

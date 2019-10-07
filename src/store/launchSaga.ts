import {put} from "redux-saga/effects"
import {loadUserInformation} from "./user/actions";

export default function* launchSaga() {
    yield put(loadUserInformation());
};

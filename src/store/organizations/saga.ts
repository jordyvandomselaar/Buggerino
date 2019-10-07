import {getOrganizations} from "../../api/organizations";
import {call, put, takeLatest} from "redux-saga/effects"
import {LOAD_ORGANIZATIONS, setOrganizations} from "./actions";
import {saveUserInformation, setPassword, setUsername} from "../user/actions";

function* fetchOrganizations() {
    try {
        const response = yield call(getOrganizations);
        const {data: organizations} = response;
        yield put(yield call(setOrganizations, organizations));
    } catch (e) {
        yield put(yield call(saveUserInformation, {username: "", password: ""}));
        yield put(yield call(setUsername, ""));
        yield put(yield call(setPassword, ""));
    }
}

export default function* watchFetchOrganizations() {
    yield takeLatest(LOAD_ORGANIZATIONS, fetchOrganizations);
}

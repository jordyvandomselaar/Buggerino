import {getOrganizations} from "../../api/organizations";
import {call, put, takeLatest} from "redux-saga/effects"
import {LOAD_ORGANIZATIONS, setOrganizations} from "./actions";

function* fetchOrganizations() {
    const response = yield call(getOrganizations);
    const {data: organizations} = response;

    yield put(setOrganizations(organizations));
}

export default function* watchFetchOrganizations() {
    yield takeLatest(LOAD_ORGANIZATIONS, fetchOrganizations);
}

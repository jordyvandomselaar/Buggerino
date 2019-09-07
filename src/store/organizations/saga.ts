import {getOrganizations} from "../../api/organizations";
import {call, put, takeLatest} from "redux-saga/effects"
import {LOAD_ORGANIZATIONS, setOrganizations} from "./actions";

function* fetchOrganizations() {
    const {data: organizations} = yield call(getOrganizations);

    yield put(setOrganizations(organizations));
}

export default function* watchFetchOrganizations() {
    yield takeLatest(LOAD_ORGANIZATIONS, fetchOrganizations);
}

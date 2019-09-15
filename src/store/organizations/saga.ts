import {getOrganizations} from "../../api/organizations";
import {call, put, takeLatest} from "redux-saga/effects"
import {LOAD_ORGANIZATIONS, setOrganizations} from "./actions";
import {Client} from "@bugsnag/core";

function* fetchOrganizations() {
    try {
        const response = yield call(getOrganizations);
        const {data: organizations} = response;
        yield put(setOrganizations(organizations));
    } catch (e) {
        console.error(e);
    }
}

export default function* watchFetchOrganizations() {
    yield takeLatest(LOAD_ORGANIZATIONS, fetchOrganizations);
}

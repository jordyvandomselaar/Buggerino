import {call, put, takeLatest} from "redux-saga/effects"
import {
    LOAD_USER_INFORMATION,
    loadUserInformationAction,
    SAVE_USER_INFORMATION,
    saveUserInformationAction,
    setPassword,
    setUsername
} from "./actions";
import * as SecureStore from "expo-secure-store"
import {bugsnagClient} from "../../api/Client";
import {loadOrganizations} from "../organizations/actions";

function* saveUserInformation(action: saveUserInformationAction) {
    yield call(SecureStore.setItemAsync, "username", action.payload.username);
    yield call(SecureStore.setItemAsync, "password", action.payload.password);

    bugsnagClient.defaults.auth = {
        username: action.payload.username,
        password: action.payload.password
    };

    if(!!action.payload.username && !!action.payload.password) {
        yield put(yield call(loadOrganizations));
    }
}

function* loadUserInformation(action: loadUserInformationAction) {
    const username = yield call(SecureStore.getItemAsync, "username");
    const password = yield call(SecureStore.getItemAsync, "password");

    yield put(yield call(setUsername, username));
    yield put(yield call(setPassword, password));

    bugsnagClient.defaults.auth = {
        username,
        password
    };
    if(!!username && !!password) {
        yield put(yield call(loadOrganizations));
    }
}

export default function* watchUser() {
    yield takeLatest(SAVE_USER_INFORMATION, saveUserInformation);
    yield takeLatest(LOAD_USER_INFORMATION, loadUserInformation);
}

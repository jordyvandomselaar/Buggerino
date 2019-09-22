import {takeLatest, call, put} from "redux-saga/effects"
import {
    LOAD_USER_INFORMATION,
    loadUserInformationAction,
    SAVE_USER_INFORMATION,
    saveUserInformationAction, setPassword, setUsername
} from "./actions";
import * as SecureStore from "expo-secure-store"

function* saveUserInformation(action: saveUserInformationAction) {
    call(SecureStore.setItemAsync, "username", action.payload.username);
    call(SecureStore.setItemAsync, "password", action.payload.password);
}

function* loadUserInformation(action: loadUserInformationAction) {
    const username = yield call(SecureStore.getItemAsync, "username");
    const password = yield call(SecureStore.getItemAsync, "password");

    put(yield call (setUsername, username));
    put(yield call(setPassword, password));
}

export default function* watchUser() {
    yield takeLatest(SAVE_USER_INFORMATION, saveUserInformation);
    yield takeLatest(LOAD_USER_INFORMATION, loadUserInformation);
}

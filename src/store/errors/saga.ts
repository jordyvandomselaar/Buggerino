import {getProjects} from "../../api/projects";
import {call, put, takeLatest} from "redux-saga/effects"
import {LOAD_ERRORS, loadErrorsAction, setErrors} from "./actions";
import {getErrorsForProject} from "../../api/errors";

function* fetchErrors(action: loadErrorsAction) {
    const {data: errors} = yield call(getErrorsForProject, action.payload.projectId);

    yield put(setErrors(errors));
}

export default function* watchFetchErrors() {
    yield takeLatest(LOAD_ERRORS, fetchErrors);
}

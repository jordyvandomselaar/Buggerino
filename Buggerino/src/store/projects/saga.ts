import {getProjects} from "../../api/projects";
import {call, put, takeLatest} from "redux-saga/effects"
import {LOAD_PROJECTS, loadProjectsAction, setProjects} from "./actions";

function* fetchProjects(action: loadProjectsAction) {
    const {data: projects} = yield call(getProjects, action.payload.organizationId);

    yield put(yield call(setProjects, projects));
}

export default function* watchFetchProjects() {
    yield takeLatest(LOAD_PROJECTS, fetchProjects);
}

import {call, put, takeLatest} from "redux-saga/effects"
import {LOAD_EVENTS, loadEventsAction, setEvents} from "./actions";
import {getEventsForError} from "../../api/events";

function* fetchEvents(action: loadEventsAction) {
    const {data: events} = yield call(getEventsForError, action.payload.error);

    yield put(setEvents(events));
}

export default function* watchFetchEvents() {
    yield takeLatest(LOAD_EVENTS, fetchEvents);
}

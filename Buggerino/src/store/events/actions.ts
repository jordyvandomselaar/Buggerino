import {BugsnagEvent} from "../../types/BugsnagEvent";
import {BugsnagError} from "../../types/BugsnagError";

export const LOAD_EVENTS = "LOAD_EVENTS";
export const SET_EVENTS = "SET_EVENTS";

export const loadEvents = (error: BugsnagError) => ({
    type: LOAD_EVENTS,
    payload: {
        error
    }
});

export const setEvents = (events: BugsnagEvent[]) => ({
    type: SET_EVENTS,
    payload: {events}
});

export interface loadEventsAction {
    type: typeof LOAD_EVENTS,
    payload: {
        error: BugsnagError
    }
}

export interface setEventsAction {
    type: typeof SET_EVENTS,
    payload: { events: BugsnagEvent[] }
}

export type eventsActionTypes = loadEventsAction | setEventsAction;

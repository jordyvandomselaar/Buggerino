import {eventsActionTypes, SET_EVENTS} from "./actions";
import {BugsnagEvent} from "../../types/BugsnagEvent";

export interface EventsState {
    events: BugsnagEvent[];
}

const initialState: EventsState = {
    events: [],
};

export const eventsReducer = (state: EventsState = initialState, action: eventsActionTypes): EventsState => {
    switch (action.type) {
        case SET_EVENTS:
            return {
                ...state,
                events: action.payload.events
            };

        default:
            return state;
    }
};

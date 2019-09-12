import {errorsActionTypes, SET_ERRORS} from "./actions";
import {BugsnagError} from "../../types/BugsnagError";

export interface ErrorsState {
    errors: BugsnagError[];
}

const initialState: ErrorsState = {
    errors: [],
};

export const errorsReducer = (state: ErrorsState = initialState, action: errorsActionTypes): ErrorsState => {
    switch (action.type) {
        case SET_ERRORS:
            return {
                ...state,
                errors: action.payload.errors
            };

        default:
            return state;
    }
};

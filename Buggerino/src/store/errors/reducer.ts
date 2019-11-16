import {errorsActionTypes, SET_ERRORS} from "./actions";
import {BugsnagError} from "../../types/BugsnagError";

export interface ErrorsState {
    errors: BugsnagError[];
    loading: boolean;
}

const initialState: ErrorsState = {
    errors: [],
    loading: true
};

export const errorsReducer = (state: ErrorsState = initialState, action: errorsActionTypes): ErrorsState => {
    switch (action.type) {
        case "LOAD_ERRORS":
            return {
                ...state,
                loading: true
            };
        case SET_ERRORS:
            return {
                ...state,
                errors: action.payload.errors,
                loading: false
            };

        default:
            return state;
    }
};

import {Organization} from "../../types/Organization";
import {Error} from "../../types/Error";

export const LOAD_ERRORS = "LOAD_ERRORS";
export const SET_ERRORS = "SET_ERRORS";

export const loadErrors = (projectId: string) => ({
    type: LOAD_ERRORS,
    payload: {
        projectId
    }
});

export const setErrors = (errors: Error[]) => ({
    type: SET_ERRORS,
    payload: {errors}
});

export interface loadErrorsAction {
    type: typeof LOAD_ERRORS,
    payload: {
        projectId: string
    }
}

export interface setErrorsAction {
    type: typeof SET_ERRORS,
    payload: {errors: Error[]}
}

export type errorsActionTypes = loadErrorsAction | setErrorsAction;

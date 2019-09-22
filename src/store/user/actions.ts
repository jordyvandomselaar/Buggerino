import {BugsnagError} from "../../types/BugsnagError";
import {LOAD_EVENTS} from "../events/actions";
import {User} from "../../types/User";

export const SET_USERNAME = "SET_USERNAME";
export const SET_PASSWORD = "SET_PASSWORD";
export const SAVE_USER_INFORMATION = "SAVE_USER_INFORMATION";
export const LOAD_USER_INFORMATION = "LOAD_USER_INFORMATION";

export const setUsername = (username: string) => ({
    type: SET_USERNAME,
    payload: {
        username
    }
});

export const setPassword = (password: string) => ({
    type: SET_PASSWORD,
    payload: {
        password
    }
});

export const saveUserInformation = (user: User) => ({
    type: SAVE_USER_INFORMATION,
    payload: user
});

export const loadUserInformation = () => ({
    type: LOAD_USER_INFORMATION
});

export interface setUsernameAction {
    type: typeof SET_USERNAME,
    payload: {
        username: string;
    }
}

export interface setPasswordAction {
    type: typeof SET_PASSWORD,
    payload: {
        password: string;
    }
}

export interface saveUserInformationAction {
    type: typeof SAVE_USER_INFORMATION,
    payload: User
}

export interface loadUserInformationAction {
    type: typeof LOAD_USER_INFORMATION,
}

export type usersActionTypes = setUsernameAction | setPasswordAction | saveUserInformationAction | loadUserInformationAction;

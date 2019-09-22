import {User} from "../../types/User";
import {usersActionTypes} from "./actions";

const initialState: User = {
    username: "",
    password: ""
};

export const userReducer = (state: User = initialState, action: usersActionTypes): User => {
    switch (action.type) {
        case "SET_USERNAME":
            return {
                ...state,
                username: action.payload.username
            };
        case "SET_PASSWORD":
            return {
                ...state,
                password: action.payload.password
            };
        default:
            return state;
    }
};

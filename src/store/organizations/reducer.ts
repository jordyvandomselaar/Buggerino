import {Organization} from "../../types/Organization";
import {organizationsActionTypes, SET_ORGANIZATIONS} from "./actions";

export interface OrganizationsState {
    organizations: Organization[]
}

const initialState: OrganizationsState = {
  organizations: []
};

export const organizationsReducer = (state: OrganizationsState = initialState, action: organizationsActionTypes): OrganizationsState => {
    switch(action.type) {
        case SET_ORGANIZATIONS:
            return {
                ...state,
                organizations: action.data.organizations
            };
        default:
            return state;
    }
};

import {Organization} from "../../types/Organization";

export const LOAD_ORGANIZATIONS = "LOAD_ORGANIZATIONS";
export const SET_ORGANIZATIONS = "SET_ORGANIZATIONS";

export const loadOrganizations = () => ({
    type: LOAD_ORGANIZATIONS
});

export const setOrganizations = (organizations: Organization[]) => ({
    type: SET_ORGANIZATIONS,
    data: {organizations}
});

interface loadOrganizationsAction {
    type: typeof LOAD_ORGANIZATIONS,
}

interface setOrganizationsAction {
    type: typeof SET_ORGANIZATIONS,
    data: {organizations: Organization[]}
}

export type organizationsActionTypes = loadOrganizationsAction | setOrganizationsAction;

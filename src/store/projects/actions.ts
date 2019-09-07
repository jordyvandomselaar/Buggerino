import {Organization} from "../../types/Organization";
import {Project} from "../../types/Project";

export const LOAD_PROJECTS = "LOAD_PROJECTS";
export const SET_PROJECTS = "SET_PROJECTS";

export const loadProjects = (organizationId: string) => ({
    type: LOAD_PROJECTS,
    payload: {
        organizationId
    }
});

export const setProjects = (projects: Project[]) => ({
    type: SET_PROJECTS,
    payload: {projects}
});

export interface loadProjectsAction {
    type: typeof LOAD_PROJECTS,
    payload: {
        organizationId: string
    }
}

export interface setProjectsAction {
    type: typeof SET_PROJECTS,
    payload: {projects: Project[]}
}

export type projectsActionTypes = loadProjectsAction | setProjectsAction;

import {projectsActionTypes, SET_PROJECTS} from "./actions";
import {Project} from "../../types/Project";

export interface ProjectsState {
    projects: Project[];
}

const initialState: ProjectsState = {
    projects: [],
};

export const projectsReducer = (state: ProjectsState = initialState, action: projectsActionTypes): ProjectsState => {
    switch(action.type) {
        case SET_PROJECTS:
            return {
                ...state,
                projects: action.payload.projects
            };

        default:
            return state;
    }
};

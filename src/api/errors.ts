import {bugsnagClient} from "./Client";
import {AxiosPromise} from "axios";
import {BugsnagError} from "../types/BugsnagError";

export const getErrorsForProject = (projectId: string): AxiosPromise<BugsnagError[]> => bugsnagClient.get(`/projects/${projectId}/errors?filters[error.status][][type]=eq&filters[error.status][][value]=open`);

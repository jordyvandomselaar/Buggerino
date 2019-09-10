import {bugsnagClient} from "./Client";
import {AxiosPromise} from "axios";
import {Error} from "../types/Error";

export const getErrorsForProject = (projectId: string): AxiosPromise<Error[]> => bugsnagClient.get(`/projects/${projectId}/errors`);

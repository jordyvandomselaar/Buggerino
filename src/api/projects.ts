import {bugsnagClient} from "./Client";
import {AxiosPromise} from "axios";
import {Project} from "../types/Project";

export const getProjects = (organizationId: string): AxiosPromise<Project[]> => bugsnagClient.get(`/organizations/${organizationId}/projects`);

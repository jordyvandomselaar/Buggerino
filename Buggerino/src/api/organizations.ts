import {bugsnagClient} from "./Client";
import {AxiosPromise} from "axios";
import {Organization} from "../types/Organization";

export const getOrganizations = (): AxiosPromise<Organization[]> => bugsnagClient.get("/user/organizations");

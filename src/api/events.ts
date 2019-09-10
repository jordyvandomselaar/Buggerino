import {bugsnagClient} from "./Client";
import {AxiosPromise} from "axios";
import {Error} from "../types/Error";
import {BugsnagEvent} from "../types/BugsnagEvent";

export const getEventsForError = (error: Error): AxiosPromise<BugsnagEvent> => bugsnagClient.get(error.events_url);

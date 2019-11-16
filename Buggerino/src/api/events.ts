import {bugsnagClient} from "./Client";
import {AxiosPromise} from "axios";
import {BugsnagError} from "../types/BugsnagError";
import {BugsnagEvent} from "../types/BugsnagEvent";

export const getEventsForError = (error: BugsnagError): AxiosPromise<BugsnagEvent> => bugsnagClient.get(error.events_url);

export const getEventDetails = (event: BugsnagEvent): AxiosPromise<BugsnagEvent> => bugsnagClient.get(event.url);

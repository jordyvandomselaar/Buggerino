import Axios from "axios";
import {BUGSNAG_PASSWORD, BUGSNAG_USERNAME} from "../../env";

export const bugsnagClient = Axios.create({
    headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "X-version": "2",
    },
    baseURL: "https://api.bugsnag.com"
});

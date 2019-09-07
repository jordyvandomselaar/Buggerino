import Axios from "axios";
import {BUGSNAG_PASSWORD, BUGSNAG_USERNAME} from "../../env";

export const bugsnagClient = Axios.create({
    headers: {
        "accept": "application/json",
        "content-type": "application/json",
        // "authorization": `token ${BUGSNAG_API_KEY}`,
        "X-version": "2",
    },
    auth: {
        username: BUGSNAG_USERNAME,
        password: BUGSNAG_PASSWORD
    },
    baseURL: "https://api.bugsnag.com"
});

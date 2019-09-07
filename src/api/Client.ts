import Axios from "axios";
import {BUGSNAG_API_KEY} from "../../env";

export const bugsnagClient = Axios.create({
    headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "authorization": `token ${BUGSNAG_API_KEY}`,
        "X-version": "2",
    },
    baseURL: "https://api.bugsnag.com"
});

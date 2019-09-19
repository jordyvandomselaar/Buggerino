import React from "react";

import {storiesOf} from "@storybook/react-native";
import CenterView from "./CenterView";
import EventDetail from "../../src/components/molecules/EventDetail";
import ErrorItem from "../../src/components/atoms/ErrorItem";
import LoginScreen from "../../src/components/views/LoginScreen";
// eslint-disable-next-line import/extensions

const error = {
    "id": "5d603453970a710019ca7037",
    "project_id": "5c4ef671c4e59b001722c04a",
    "error_class": "Error",
    "message": "Request failed with status code 404",
    "context": "/matches",
    "severity": "warning",
    "original_severity": "warning",
    "overridden_severity": null,
    "events": 71,
    "events_url": "https://api.bugsnag.com/projects/5c4ef671c4e59b001722c04a/errors/5d603453970a710019ca7037/events",
    "unthrottled_occurrence_count": 71,
    "users": 45,
    "first_seen": "2019-08-23T18:45:39.000Z",
    "last_seen": "2019-09-12T11:21:14.000Z",
    "first_seen_unfiltered": "2019-08-23T18:45:39.000Z",
    "last_seen_unfiltered": "2019-09-12T11:21:14.501Z",
    "status": "ignored",
    "created_issue": {},
    "reopen_rules": null,
    "assigned_collaborator_id": null,
    "comment_count": 0,
    "missing_dsyms": [],
    "release_stages": [
        "production",
    ],
    "grouping_reason": "js-structure",
    "grouping_fields": {
        "surroundingCode": "x.x(\"return\",x.x);case 9:if(x.x=9,x.x=x.catch(3),x=\"\",x.x.x&&(x=x.x.x.x||\"\"),404!==x){x.x=15;break}throw x.x;case 15:if(x(x.x),401!==x&&400!==x){x.x=19;break}return x(),x.x(\"return\");case 19:if(!(x>=500&&x<600",
        "errorClass": "Error",
    },
    "url": "https://api.bugsnag.com/projects/5c4ef671c4e59b001722c04a/errors/5d603453970a710019ca7037",
    "project_url": "https://api.bugsnag.com/projects/5c4ef671c4e59b001722c04a",
};

const event = {
    "id": "5d7a2a2a004fdf84eb180000",
    "url": "https://api.bugsnag.com/projects/5c4ef671c4e59b001722c04a/events/5d7a2a2a004fdf84eb180000",
    "project_url": "https://api.bugsnag.com/projects/5c4ef671c4e59b001722c04a",
    "is_full_report": false,
    "error_id": "5d603453970a710019ca7037",
    "received_at": "2019-09-12T11:21:14.000Z",
    "exceptions": [
        {
            "error_class": "Error",
            "message": "Request failed with status code 404",
            "stacktrace": [
                {
                    "line_number": 1234,
                    "file": "controllers/users_controller.rb",
                    "in_project": true,
                    "method": "exports",
                    "source_control_name": "github",
                    "code": {
                        "1231": "\"  def a\"",
                        "1232": "\"\"",
                        "1233": "\"    if problem?\"",
                        "1234": "\"      raise 'something went wrong'\"",
                        "1235": "\"    end\"",
                        "1236": "\"\"",
                        "1237": "\"  end\""
                    }
                }
            ]
        },
    ],
    "severity": "warning",
    "context": "/matches",
    "unhandled": false,
    "app": {
        "releaseStage": "production",
    },
};

storiesOf("EventDetail", module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add("default", () => (
        <EventDetail error={error} event={event}/>
    ));

storiesOf("ErrorItem", module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add("Error", () => (
        <ErrorItem error={error}/>
    ))
    .add("Event", () => (
        <ErrorItem error={error} event={event}/>
    ));

storiesOf("LoginScreen", module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add("default", () => (
        <LoginScreen navigation={{}}/>
    ));

import React, {useEffect, useState} from "react";
import {useSelector} from "react-redux";
import {AppState} from "../../store";
import {NavigationScreenProps} from "react-navigation";
import {Error} from "../../types/Error";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import EventDetail from "../molecules/EventDetail";
import {getEventDetails} from "../../api/events";
import {AxiosPromise} from "axios";

const EventDetailContainer = ({navigation}: NavigationScreenProps) => {
    const eventId = navigation.getParam('eventId');
    const errorId = navigation.getParam('errorId');
    const error = useSelector<AppState, Error>(state => state.errors.errors.find(error => error.id === errorId));
    const eventInAppState = useSelector<AppState, BugsnagEvent>(state => state.events.events.find(event => event.id === eventId));

    const [bugsnagEvent, setBugsnagEvent] = useState<BugsnagEvent>(null);

    useEffect(() => {
        getEventDetails(eventInAppState).then((response) => setBugsnagEvent(response.data));
    }, [eventInAppState.url]);


    if(!bugsnagEvent) {
        return null;
    }

    return (
        <EventDetail error={error} event={bugsnagEvent}/>
    );
};

export default EventDetailContainer;

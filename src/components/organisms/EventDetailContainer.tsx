import React from "react";
import {useSelector} from "react-redux";
import {AppState} from "../../store";
import {NavigationScreenProps} from "react-navigation";
import {Error} from "../../types/Error";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import EventDetail from "../molecules/EventDetail";

const EventDetailContainer = ({navigation}: NavigationScreenProps) => {
    const eventId = navigation.getParam('eventId');
    const errorId = navigation.getParam('errorId');
    const error = useSelector<AppState, Error>(state => state.errors.errors.find(error => error.id === errorId));
    const event = useSelector<AppState, BugsnagEvent>(state => state.events.events.find(event => event.id === eventId));


    // const handleRedirect = (errorId: string) => navigation.navigate("EventList", {errorId});
    return (
        <EventDetail error={error} event={event}/>
    );
};

export default EventDetailContainer;

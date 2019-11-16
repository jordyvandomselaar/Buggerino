import React, {useEffect} from "react";
import {useDispatch, useSelector} from "react-redux";
import {AppState} from "../../store";
import {BugsnagError} from "../../types/BugsnagError";
import {loadEvents} from "../../store/events/actions";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import EventList from "../molecules/EventList";
import {NavigationStackScreenComponent} from "react-navigation-stack"

const EventSelector: NavigationStackScreenComponent = ({navigation}) => {
    const dispatch = useDispatch();
    const errorId = navigation.getParam('errorId');
    const events = useSelector<AppState, BugsnagEvent[]>(state => state.events.events);
    const error = useSelector<AppState, BugsnagError>(state => state.errors.errors.find(error => error.id === errorId));

    const handleRedirect = (eventId: string) => navigation.navigate("EventDetail", {eventId, errorId});

    useEffect(() => {
        dispatch(loadEvents(error));
    }, [errorId]);
    return (
        <EventList error={error} events={events} onSelectEvent={handleRedirect}/>
    );
};

export default EventSelector;

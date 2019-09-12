import React from "react";
import {ListItem} from "react-native-elements"
import {Organization} from "../../types/Organization";
import {FlatList, SafeAreaView, View} from "react-native";
import {Project} from "../../types/Project";
import {BugsnagError} from "../../types/BugsnagError";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import ErrorItem from "../atoms/ErrorItem";

interface IProps {
    events: BugsnagEvent[],
    error: BugsnagError
    onSelectEvent: (eventId) => void
}

const EventList = ({events, error, onSelectEvent}: IProps) => {
    return (
        <FlatList
                data={events}
                keyExtractor={(item) => item.id}
                renderItem={({item}) => (
                    <ErrorItem error={error} event={item} onSelectEvent={onSelectEvent}/>
                )}
            />
    );
};

export default EventList;

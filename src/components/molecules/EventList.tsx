import React from "react";
import {ListItem} from "react-native-elements"
import {Organization} from "../../types/Organization";
import {FlatList, SafeAreaView, View} from "react-native";
import {Project} from "../../types/Project";
import {Error} from "../../types/Error";
import {BugsnagEvent} from "../../types/BugsnagEvent";

interface IProps {
    events: BugsnagEvent[],
    error: Error
    onSelectEvent: (eventId) => void
}

const EventList = ({events, error, onSelectEvent}: IProps) => {
    return (
        <FlatList
                data={events}
                keyExtractor={(item) => item.id}
                renderItem={({item}) => (
                    <ListItem onPress={() => {
                        onSelectEvent(item.id)
                    }} title={error.message}/>
                )}
            />
    );
};

export default EventList;

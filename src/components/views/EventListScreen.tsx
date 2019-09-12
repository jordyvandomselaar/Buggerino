import React from "react";
import {View} from "react-native";
import {NavigationScreenProps} from "react-navigation";
import EventSelector from "../organisms/EventSelector";

const EventListScreen = (props: NavigationScreenProps) => {
    return (
        <View>
            <EventSelector {...props}/>
        </View>
    );
};

EventListScreen.navigationOptions = {
    title: "Events"
};

export default EventListScreen;

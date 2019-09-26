import React from "react";
import {View} from "react-native";
import {NavigationStackScreenComponent} from "react-navigation-stack"
import EventSelector from "../organisms/EventSelector";

const EventListScreen: NavigationStackScreenComponent = props => {
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

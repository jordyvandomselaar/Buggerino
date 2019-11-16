import React from "react";
import {View} from "react-native";
import {NavigationStackScreenComponent} from "react-navigation-stack"
import EventDetailContainer from "../organisms/EventDetailContainer";

const EventDetailScreen: NavigationStackScreenComponent = props => {
    return (
        <View>
            <EventDetailContainer {...props}/>
        </View>
    );
};

EventDetailScreen.navigationOptions = {
    title: "Event detail"
};

export default EventDetailScreen;

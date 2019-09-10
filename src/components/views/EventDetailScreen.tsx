import React from "react";
import {View} from "react-native";
import {Text} from "react-native-elements";
import {NavigationScreenProps} from "react-navigation";
import ProjectSelector from "../organisms/ProjectSelector";
import ErrorSelector from "../organisms/ErrorSelector";
import EventDetailContainer from "../organisms/EventDetailContainer";

const EventDetailScreen = (props: NavigationScreenProps) => {
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

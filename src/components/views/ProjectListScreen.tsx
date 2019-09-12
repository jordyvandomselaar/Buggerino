import React from "react";
import {View} from "react-native";
import {Text} from "react-native-elements";
import {NavigationScreenProps} from "react-navigation";
import ProjectSelector from "../organisms/ProjectSelector";

const ProjectListScreen = (props: NavigationScreenProps) => {
    return (
        <View>
            <ProjectSelector {...props}/>
        </View>
    );
};

ProjectListScreen.navigationOptions = {
    title: "Projects"
};

export default ProjectListScreen;

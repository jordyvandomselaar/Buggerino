import React from "react";
import {View} from "react-native";
import ProjectSelector from "../organisms/ProjectSelector";
import {NavigationStackScreenComponent} from "react-navigation-stack"

const ProjectListScreen: NavigationStackScreenComponent = props => {
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

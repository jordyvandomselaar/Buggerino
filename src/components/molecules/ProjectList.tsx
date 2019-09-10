import React from "react";
import {ListItem} from "react-native-elements"
import {Organization} from "../../types/Organization";
import {FlatList, SafeAreaView, View} from "react-native";
import {Project} from "../../types/Project";

interface IProps {
    projects: Project[],
    onSelectProject: (projectId: string) => void
}

const ProjectList = ({projects, onSelectProject}: IProps) => {
    return (
        <FlatList
                data={projects}
                keyExtractor={(item) => item.id}
                renderItem={({item}) => (
                    <ListItem onPress={() => {
                        onSelectProject(item.id)
                    }} title={item.name}/>
                )}
            />
    );
};

export default ProjectList;

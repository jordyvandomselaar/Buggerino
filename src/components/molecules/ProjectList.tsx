import React from "react";
import {ListItem} from "react-native-elements"
import {Organization} from "../../types/Organization";
import {FlatList, SafeAreaView, View} from "react-native";
import {Project} from "../../types/Project";

interface IProps {
    projects: Project[]
}

const ProjectList = ({projects}: IProps) => {
    return (
        <FlatList
                data={projects}
                keyExtractor={(item) => item.id}
                renderItem={({item}) => (
                    <ListItem onPress={() => {
                        // onSelectOrganization(item.id)
                    }} title={item.name}/>
                )}
            />
    );
};

export default ProjectList;

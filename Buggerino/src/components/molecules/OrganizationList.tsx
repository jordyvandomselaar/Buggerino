import React from "react";
import {ListItem} from "react-native-elements"
import {Organization} from "../../types/Organization";
import {FlatList, SafeAreaView, View} from "react-native";

interface IProps {
    organizations: Organization[]
    onSelectOrganization: (organizationId: string) => void
}

const OrganizationList = ({organizations, onSelectOrganization}: IProps) => {
    return (
        <FlatList
                data={organizations}
                keyExtractor={(item) => item.id}
                renderItem={({item}) => (
                    <ListItem onPress={() => {
                        onSelectOrganization(item.id)
                    }} title={item.name}/>
                )}
            />
    );
};

export default OrganizationList;

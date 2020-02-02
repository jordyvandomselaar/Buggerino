import React, {FunctionComponent} from 'react';
import {FlatList, Text} from 'react-native';
import ListItem from './ListItem';

interface Props {}

const DATA = [
  {name: 'DIJ', id: 1},
  {name: 'DIJ', id: 2},
  {name: 'DIJ', id: 3},
  {name: 'DIJ', id: 4},
];

const SelectOrganization: FunctionComponent<Props> = () => {
  return (
    <FlatList
      data={DATA}
      renderItem={({item}) => (
        <ListItem>
          <Text>{item.name}</Text>
        </ListItem>
      )}
      keyExtractor={item => item.id.toString()}
    />
  );
};

export default SelectOrganization;

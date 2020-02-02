import React, {FunctionComponent, useRef, useState} from 'react';
import {
  Animated,
  FlatList,
  ScrollView,
  ScrollViewProps,
  Text,
} from 'react-native';
import ListItem from './ListItem';
import {AnimatedContainer, Container} from './Layout';
import CollapsibleHeader, {HEADER_MAX_HEIGHT} from './CollapsibleHeader';

interface Props {}

const DATA = [
  {name: 'DIJ', id: 1},
  {name: 'DIJ', id: 2},
  {name: 'DIJ', id: 3},
  {name: 'DIJ', id: 4},
  {name: 'DIJ', id: 5},
  {name: 'DIJ', id: 6},
  {name: 'DIJ', id: 7},
  {name: 'DIJ', id: 8},
  {name: 'DIJ', id: 9},
  {name: 'DIJ', id: 10},
  {name: 'DIJ', id: 11},
  {name: 'DIJ', id: 12},
  {name: 'DIJ', id: 13},
  {name: 'DIJ', id: 14},
  {name: 'DIJ', id: 15},
  {name: 'DIJ', id: 16},
  {name: 'DIJ', id: 17},
  {name: 'DIJ', id: 18},
  {name: 'DIJ', id: 19},
  {name: 'DIJ', id: 20},
  {name: 'DIJ', id: 21},
  {name: 'DIJ', id: 22},
  {name: 'DIJ', id: 23},
  {name: 'DIJ', id: 24},
  {name: 'DIJ', id: 25},
  {name: 'DIJ', id: 26},
  {name: 'DIJ', id: 27},
  {name: 'DIJ', id: 28},
  {name: 'DIJ', id: 29},
  {name: 'DIJ', id: 30},
  {name: 'DIJ', id: 31},
  {name: 'DIJ', id: 32},
  {name: 'DIJ', id: 33},
  {name: 'DIJ', id: 34},
  {name: 'DIJ', id: 35},
  {name: 'DIJ', id: 36},
  {name: 'DIJ', id: 37},
  {name: 'DIJ', id: 38},
  {name: 'DIJ', id: 39},
  {name: 'DIJ', id: 40},
  {name: 'DIJ', id: 41},
  {name: 'DIJ', id: 42},
  {name: 'DIJ', id: 43},
  {name: 'DIJ', id: 44},
  {name: 'DIJ', id: 45},
  {name: 'DIJ', id: 46},
  {name: 'DIJ', id: 47},
  {name: 'DIJ', id: 48},
  {name: 'DIJ', id: 49},
  {name: 'DIJ', id: 50},
  {name: 'DIJ', id: 51},
  {name: 'DIJ', id: 52},
  {name: 'DIJ', id: 53},
  {name: 'DIJ', id: 54},
  {name: 'DIJ', id: 55},
  {name: 'DIJ', id: 56},
  {name: 'DIJ', id: 57},
];

const SelectOrganization: FunctionComponent<Props> = () => {
  const scrollY = useRef<Animated.Value>(new Animated.Value(0)).current;

  return (
    <Container bg="white" size="100%">
      <FlatList
        data={DATA}
        contentContainerStyle={{marginTop: HEADER_MAX_HEIGHT}}
        renderItem={({item}) => (
          <ListItem>
            <Text>{item.name}</Text>
          </ListItem>
        )}
        keyExtractor={item => item.id.toString()}
        onScroll={Animated.event([
          {
            nativeEvent: {
              contentOffset: {y: scrollY},
            },
          },
        ])}
        scrollEventThrottle={16}
      />
      <CollapsibleHeader scrollY={scrollY} title="Select an organization" />
    </Container>
  );
};

export default SelectOrganization;

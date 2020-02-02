import React, {FunctionComponent} from 'react';
import {Container} from './Layout';

interface Props {}

const ListItem: FunctionComponent<Props> = ({children}) => {
  return <Container p="20px">{children}</Container>;
};

export default ListItem;

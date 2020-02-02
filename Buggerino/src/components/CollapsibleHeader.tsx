import React, {FunctionComponent} from 'react';
import {AnimatedContainer} from './Layout';
import {Animated} from 'react-native';

interface Props {
  scrollY: Animated.Value;
  title: string;
}

export const HEADER_MAX_HEIGHT = 300;

const HEADER_MIN_HEIGHT = 60;
const HEADER_SCROLL_DISTANCE = HEADER_MAX_HEIGHT - HEADER_MIN_HEIGHT;

const CollapsibleHeader: FunctionComponent<Props> = ({scrollY, title}) => {
  const headerHeight = scrollY.interpolate({
    inputRange: [0, HEADER_SCROLL_DISTANCE],
    outputRange: [HEADER_MAX_HEIGHT, HEADER_MIN_HEIGHT],
    extrapolate: 'clamp',
  });

  const fontSize = scrollY.interpolate({
    inputRange: [0, HEADER_SCROLL_DISTANCE],
    outputRange: [42, 24],
    extrapolate: 'clamp',
  });

  return (
    <AnimatedContainer
      style={{height: headerHeight}}
      position="absolute"
      top={0}
      right={0}
      left={0}
      overflow="hidden"
      bg="white"
      justifyContent="center"
      alignItems="center">
      <Animated.Text style={{fontSize: fontSize}}>{title}</Animated.Text>
    </AnimatedContainer>
  );
};

export default CollapsibleHeader;

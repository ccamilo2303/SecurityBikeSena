import * as React from "react";
import {
  View,
  Text,
  Dimensions,
  Image,
  StyleSheet,
  TextInput,
  SafeAreaView,
  ScrollView,
} from "react-native";
import { CheckBox, Button } from "react-native-elements";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import MapView from "react-native-maps";
import Icon from 'react-native-vector-icons/FontAwesome';

export default function Mapa() {
  const windowWidth = Dimensions.get("window").width;
  const windowHeight = Dimensions.get("window").height;
  const styles = StyleSheet.create({
    container: {
      width: windowWidth,
      height: windowHeight,
      justifyContent: "center",
      alignContent: "center",
      backgroundColor: "white",
    },
    map: {
      width: windowWidth,
      height: windowHeight * 0.7,
    },
  });

  return (
    <SafeAreaView
      style={{
        flex: 1,
        flexDirection: "column",
        justifyContent: "space-between",
        backgroundColor: "white",
      }}
    >
      <ScrollView>
        <View
          style={{
            width: windowWidth,
            height: 120,
            backgroundColor: "#caecef",
            alignItems: "center",
            justifyContent: "center",
          }}
        >
          <Text style={{ color: "#0e99a6", fontSize: 43, fontWeight: "bold" }}>
            BIKE <Text style={{ color: "#e2571a" }}>FINDER</Text>
          </Text>
        </View>
        <MapView
          style={styles.map}
          loadingEnabled={true}
          region={{
            latitude: 4.7066519,
            longitude: -74.097861,
            latitudeDelta: 0.015,
            longitudeDelta: 0.0121,
          }}
        >
          <MapView.Marker
            coordinate={{
              latitude: 4.7101747,
              longitude: -74.0954187,
            }}
            title={"servipet"}
            description={"Servipet"}
          />
        </MapView>
        <View
          style={{
            width: windowWidth,
            height: 70,
            backgroundColor: "white",
            alignItems: "center",
            justifyContent: "center",
          }}
        >
          <Button
            title="Ubicar mi Bicicleta"
            icon={
                <Icon
                  name="map-marker"
                  size={15}
                  color="white" style = {{marginRight : 20}}
                />
              }
            buttonStyle={{
              backgroundColor: "#09a7b5",
              color: "white",
              borderRadius: 25,
              width: 250,
              height: 50,
              marginBottom: 10,
            }}
          />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

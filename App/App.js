import * as React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import Login from "./Login";
import Registro from "./Registro";
import Mapa from "./Mapa";

const Stack = createStackNavigator();

function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen
          name="Login"
          component={Login}
          options={{ headerShown: false }}
        />
        <Stack.Screen
          name="Registro"
          component={Registro}
          options={{
            title: "Atrás",
            headerStyle: {
              backgroundColor: "#09a7b5",
            },
            headerTintColor: "#fff"
          }}
        />
        <Stack.Screen
          name="Mapa"
          component={Mapa}
          options={{
            title: "Atrás",
            headerStyle: {
              backgroundColor: "#09a7b5",
            },
            headerTintColor: "#fff"
          }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;

import React, { useState } from "react";
import {
  View,
  Text,
  Dimensions,
  Image,
  StyleSheet,
  TextInput,
  SafeAreaView,
  ScrollView,
  Modal,
  TouchableHighlight,
} from "react-native";
import { Icon, CheckBox, Button } from "react-native-elements";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import enviroment from "./enviroment";

export default function Login({ navigation }) {
  const windowWidth = Dimensions.get("window").width;
  const windowHeight = Dimensions.get("window").height;
  const [email, setEmail] = useState("");
  const [pass, setPass] = useState("");
  const [modalVisible, setModalVisible] = useState(false);
  const [mensaje, setMensaje] = useState("");

  const styles = StyleSheet.create({
    titulo: {
      color: "#e2571a",
      fontWeight: "bold",
      fontSize: 20,
      marginVertical: 20,
    },
    searchSection: {
      flexDirection: "row",
      justifyContent: "center",
      alignItems: "center",
      backgroundColor: "#fff",
      borderColor: "#b2b2b2",
      borderWidth: 2,
      borderRadius: 40,
      height: 50,
      width: 250,
      marginBottom: 15,
    },
    searchIcon: {
      padding: 10,
    },
    input: {
      backgroundColor: "#fff",
      color: "#424242",
      height: 20,
      width: 200,
    },
    centeredView: {
      flex: 1,
      justifyContent: "center",
      alignItems: "center",
      marginTop: 22,
    },
    modalView: {
      margin: 20,
      backgroundColor: "white",
      borderRadius: 20,
      padding: 35,
      alignItems: "center",
      shadowColor: "#000",
      shadowOffset: {
        width: 0,
        height: 2,
      },
      shadowOpacity: 0.25,
      shadowRadius: 3.84,
      elevation: 5,
    },
    openButton: {
      backgroundColor: "#F194FF",
      borderRadius: 20,
      padding: 10,
      elevation: 2,
    },
    textStyle: {
      color: "white",
      fontWeight: "bold",
      textAlign: "center",
    },
    modalText: {
      marginBottom: 15,
      textAlign: "center",
    },
  });

  const validateUser = async () => {
    try {
      
      if (email != undefined && email.split(" ").join() == "") {
        setModalVisible(true);
        setMensaje("El Email no puede estar vacío");
        return;
      }
      if (pass != undefined && pass.split(" ").join() == "") {
        setModalVisible(true);
        setMensaje("La contraseña no puede estar vacía");
        return;
      }

      setModalVisible(true);
      setMensaje("Consultando información ..");
      console.log("--> "+enviroment().ipBase+"/user/"+email+"/"+pass )
      let response = await fetch(
        enviroment().ipBase+"/user/"+email+"/"+pass 
      );
      let json = await response.json();
      setModalVisible(false);
      if (json.statusCode == "INTERNAL_SERVER_ERROR") {
        setModalVisible(true);
        setMensaje(json.message);
      } else {
        navigation.navigate("Mapa");
      }

    } catch (error) {
        setModalVisible(true);
        setMensaje(error);
    }
  };

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
        <Modal animationType="slide" transparent={true} visible={modalVisible}>
          <View style={styles.centeredView}>
            <View style={styles.modalView}>
              <Text style={styles.modalText}>{mensaje}</Text>

              <TouchableHighlight
                style={{ ...styles.openButton, backgroundColor: "#2196F3" }}
                onPress={() => {
                  setModalVisible(!modalVisible);
                }}
              >
                <Text style={styles.textStyle}>Cerrar</Text>
              </TouchableHighlight>
            </View>
          </View>
        </Modal>

        <Image
          style={{
            width: windowWidth,
            height: windowHeight * 0.6,
            backgroundColor: "white",
          }}
          resizeMode="cover"
          source={require("./assets/headLogin.png")}
        />

        <View
          style={{
            width: windowWidth,
            height: windowHeight * 0.48,
            backgroundColor: "white",
            alignItems: "center",
          }}
        >
          <Text style={styles.titulo}>BIENVENIDO</Text>

          <View style={styles.searchSection}>
            <Icon
              style={styles.searchIcon}
              name="envelope"
              type="font-awesome"
              size={20}
              color="#b2b2b2"
            />
            <TextInput
              style={styles.input}
              placeholder="Email"
              onChangeText={(e) => setEmail(e)}
              underlineColorAndroid="transparent"
            />
          </View>
          <View style={styles.searchSection}>
            <Icon
              style={styles.searchIcon}
              name="lock"
              type="font-awesome"
              size={20}
              color="#b2b2b2"
            />
            <TextInput
              style={styles.input}
              placeholder="Contraseña"
              onChangeText={(e) => setPass(e)}
              secureTextEntry={true}
              underlineColorAndroid="transparent"
            />
          </View>
          <View>
            <CheckBox title={"Deseo recordar mis datos"} />
          </View>
          <View>
            <Button
              title="Iniciar Sesión"
              buttonStyle={{
                backgroundColor: "#09a7b5",
                color: "white",
                borderRadius: 25,
                width: 250,
                height: 50,
                marginBottom: 10,
              }}
              onPress={validateUser}
            />
          </View>
          <View style={{ marginBottom: 5, marginTop: 10 }}>
            <Text>
              Aún no estoy registrado,
              <Text
                style={{ color: "#e77340" }}
                onPress={() => navigation.navigate("Registro")}
              > Registrarme
              </Text>
              
            </Text>

            <Text>
              He Olvidado mi contraseña,
              <Text
                style={{ color: "#e77340" }}
                onPress={() => navigation.navigate("RecuperarPass")}
              > Recuperar </Text>
              
            </Text>
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

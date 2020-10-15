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

export default function RecuperarPass({ navigation }) {
  const windowWidth = Dimensions.get("window").width;
  const windowHeight = Dimensions.get("window").height;
  const [email, setEmail] = useState("");
  const [pass, setPass] = useState("");
  const [modalVisible, setModalVisible] = useState(false);
  const [mensaje, setMensaje] = useState("");

  const recuperar = async () => {
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

      let response = await fetch(enviroment().ipBase + "/user/", {
        method: "PUT",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email: email,
          pass: pass
        }),
      });
  
      let json = await response.json();
        setModalVisible(false);
        if (json.statusCode == "INTERNAL_SERVER_ERROR") {
          setModalVisible(true);
          setMensaje(json.message);
        } else {
          setModalVisible(true);
          setMensaje("Contraseña actualizada correctamente, por favor inicie sesión");
        }
  }


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

        <View
          style={{
            width: windowWidth,
            height: windowHeight,
            backgroundColor: "#09a7b5",
            alignItems: "center",
            justifyContent: "center",
          }}
        >
          <View
            style={{
              width: windowWidth * 0.85,
              height: windowHeight * 0.6,
              backgroundColor: "white",
              borderRadius: 30,
              padding: 50,
              alignItems: "center",
            }}
          >
            <Text
              style={{
                color: "#e2571a",
                fontSize: 30,
                width: 200,
                textAlign: "center",
                fontWeight: "bold",
                marginBottom: 20
              }}
            >
              Recuperar Contraseña
            </Text>

            <Text
              style={{
                color: "#aaa",
                fontSize: 17,
                width: 280,
                textAlign: "center",
                marginBottom: 20
              }}
            >
              Por favor ingresa el correo electrónico con el cual realizaste tu registro, y despúes ingresa tu nueva contraseña
            </Text>


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
            <Button
              title="Recuperar"
              buttonStyle={{
                backgroundColor: "#09a7b5",
                color: "white",
                borderRadius: 25,
                width: 250,
                height: 50,
                marginBottom: 10,
              }}
              onPress={recuperar}
            />
          </View>

          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

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
  TouchableHighlight
} from "react-native";
import { Icon, CheckBox, Button } from "react-native-elements";
import enviroment from "./enviroment";

export default function Registro() {
  const windowWidth = Dimensions.get("window").width;
  const windowHeight = Dimensions.get("window").height;

  const [nombres, setNombres] = useState("");
  const [apellidos, setApellidos] = useState("");
  const [celular, setCelular] = useState("");
  const [email, setEmail] = useState("");
  const [pass, setPass] = useState("");
  const [idGps, setIdGps] = useState("");
  const [marca, setMarca] = useState("");
  const [referencia, setReferencia] = useState("");
  const [color, setColor] = useState("");
  const [numeroSerie, setNumeroSerie] = useState("");
  const [modalVisible, setModalVisible] = useState(false);
  const [mensaje, setMensaje] = useState("");
  
  const styles = StyleSheet.create(
      {
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
      }
  )
  const registrar = async () => {
    setModalVisible(true);
    setMensaje("Registrando información ...");

    let response = await fetch(enviroment().ipBase + "/user/", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        nombres: nombres,
        apellidos: apellidos,
        celular: celular,
        email: email,
        pass: pass,
        bike: {
          marca: marca,
          referencia: referencia,
          color: color,
          foto: "",
        },
      }),
    });

    let json = await response.json();
      setModalVisible(false);
      if (json.statusCode == "INTERNAL_SERVER_ERROR") {
        setModalVisible(true);
        setMensaje(json.message);
      } else {
        setModalVisible(true);
        setMensaje("Usuario registrado correctamente, por favor inicie sesión");
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
        <View style={{ alignItems: "center", justifyContent: "center" }}>
          <View>
            <Text
              style={{
                color: "#e2571a",
                fontSize: 20,
                fontWeight: "bold",
                marginTop: 20,
                marginBottom: 20,
              }}
            >
              REGISTRO
            </Text>
          </View>
          <View style={{ alignItems: "center", justifyContent: "center" }}>
            <View
              style={{
                backgroundColor: "#caecef",
                height: 60,
                width: windowWidth,
                marginLeft: windowWidth * 0.4 * -1,
                alignItems: "center",
                justifyContent: "center",
                borderRadius: 40,
              }}
            >
              <View
                style={{
                  width: 100,
                  height: 100,
                  backgroundColor: "#caebef",
                  borderRadius: 50,
                  alignItems: "center",
                  justifyContent: "center",
                  position: "absolute",
                  left: 80,
                }}
              >
                <View
                  style={{
                    width: 80,
                    height: 80,
                    backgroundColor: "white",
                    borderRadius: 50,
                    alignItems: "center",
                    justifyContent: "center",
                  }}
                >
                  <Image
                    source={require("./assets/Icono_Usuario.png")}
                    style={{ width: 50, height: 50, backgroundColor: "white" }}
                  />
                </View>
              </View>

              <Text style={{ color: "#29b3bf", fontSize: 17, marginLeft: 150 }}>
                Información de Usuario
              </Text>
            </View>

            <View style={{ marginTop: 30 }}>
              <Text style={{ color: "#808080" }}>Nombres</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                onChangeText={(e) => setNombres(e)}
              ></TextInput>
              <Text style={{ color: "#808080" }}>Apellidos</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                onChangeText={(e) => setApellidos(e)}
              ></TextInput>
              <Text style={{ color: "#808080" }}>Celular</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                keyboardType='numeric'
                onChangeText={(e) => setCelular(e)}
              ></TextInput>
              <Text style={{ color: "#808080" }}>E-mail</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                onChangeText={(e) => setEmail(e)}
              ></TextInput>
              <Text style={{ color: "#808080" }}>Contraseña</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                secureTextEntry={true}
                onChangeText={(e) => setPass(e)}
              ></TextInput>
            </View>
          </View>

          <View
            style={{
              alignItems: "center",
              justifyContent: "center",
              marginTop: 30,
            }}
          >
            <View
              style={{
                backgroundColor: "#caecef",
                height: 60,
                width: windowWidth,
                marginLeft: windowWidth * 0.4 * -1,
                alignItems: "center",
                justifyContent: "center",
                borderRadius: 40,
              }}
            >
              <View
                style={{
                  width: 100,
                  height: 100,
                  backgroundColor: "#caebef",
                  borderRadius: 50,
                  alignItems: "center",
                  justifyContent: "center",
                  position: "absolute",
                  left: 80,
                }}
              >
                <View
                  style={{
                    width: 80,
                    height: 80,
                    backgroundColor: "white",
                    borderRadius: 50,
                    alignItems: "center",
                    justifyContent: "center",
                  }}
                >
                  <Image
                    source={require("./assets/Icono_GPS_Naranja.png")}
                    style={{ width: 50, height: 50, backgroundColor: "white" }}
                  />
                </View>
              </View>

              <Text style={{ color: "#29b3bf", fontSize: 17, marginLeft: 150 }}>
                Información del GPS
              </Text>
            </View>

            <View style={{ marginTop: 30 }}>
              <Text style={{ color: "#808080" }}>ID GPS</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                keyboardType='numeric'
                onChangeText={(e) => setIdGps(e)}
              ></TextInput>
            </View>
          </View>

          <View
            style={{
              alignItems: "center",
              justifyContent: "center",
              marginTop: 30,
            }}
          >
            <View
              style={{
                backgroundColor: "#caecef",
                height: 60,
                width: windowWidth,
                marginLeft: windowWidth * 0.4 * -1,
                alignItems: "center",
                justifyContent: "center",
                borderRadius: 40,
              }}
            >
              <View
                style={{
                  width: 100,
                  height: 100,
                  backgroundColor: "#caebef",
                  borderRadius: 50,
                  alignItems: "center",
                  justifyContent: "center",
                  position: "absolute",
                  left: 80,
                }}
              >
                <View
                  style={{
                    width: 80,
                    height: 80,
                    backgroundColor: "white",
                    borderRadius: 50,
                    alignItems: "center",
                    justifyContent: "center",
                  }}
                >
                  <Image
                    source={require("./assets/Icono_Bicicleta.png")}
                    style={{ width: 50, height: 50, backgroundColor: "white" }}
                  />
                </View>
              </View>

              <Text style={{ color: "#29b3bf", fontSize: 17, marginLeft: 160 }}>
                Información de la bicicleta
              </Text>
            </View>

            <View style={{ marginTop: 30 }}>
              <Text style={{ color: "#808080" }}>Marca</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                onChangeText={(e) => setMarca(e)}
              ></TextInput>
              <Text style={{ color: "#808080" }}>Referencia</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                onChangeText={(e) => setReferencia(e)}
              ></TextInput>
              <Text style={{ color: "#808080" }}>Color</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                onChangeText={(e) => setColor(e)}
              ></TextInput>
              <Text style={{ color: "#808080" }}>Número de serie</Text>
              <TextInput
                style={{
                  backgroundColor: "#fff",
                  color: "#424242",
                  height: 40,
                  width: 300,
                  borderColor: "#b2b2b2",
                  borderWidth: 2,
                  borderRadius: 40,
                }}
                onChangeText={(e) => setNumeroSerie(e)}
              ></TextInput>
            </View>
          </View>

          <View
            style={{
              marginTop: 10,
              width: 300,
              backgroundColor: "white",
              color: "#9d9d9d",
            }}
          >
            <CheckBox title={"He leído y acepto las condiciones de uso"} />
          </View>
          <View style={{ marginTop: 10, width: 300, backgroundColor: "white" }}>
            <CheckBox
              title={"Acepto el tratamiento y uso de mis datos personales"}
            />
          </View>

          <View>
            <Button
              title="Registrarme"
              buttonStyle={{
                backgroundColor: "#09a7b5",
                color: "white",
                borderRadius: 25,
                width: 250,
                height: 50,
                marginBottom: 10,
              }}
              onPress={registrar}
            />
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

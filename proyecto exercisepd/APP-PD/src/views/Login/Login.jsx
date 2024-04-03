import React, { useState } from "react";
import { Text, StyleSheet, View, TextInput, ScrollView, Pressable, Alert } from "react-native";
import { useNavigation } from '@react-navigation/native';
import axios from 'axios';
import bcrypt from 'bcryptjs'; // Importa la función compare de bcryptjs

const Login = () => {
  const [idDocumento, setIdDocumento] = useState("");
  const [contraseña, setContraseña] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const navigation = useNavigation();

  const handleLogin = async (doc, contra) => {

    console.log("Documento: ", doc)
    console.log("Contraseña: ", contra)

    try {
      const respuesta = await axios.get('http://127.0.0.1:5000/obtener_usuarios', { headers: { "Content-Type": "multipart-form-data" } });
      console.log(respuesta)
      const dataUser = respuesta.data.usuarios
      console.log("Data: ", dataUser)
      const usuarioEncontrado = dataUser.find(usuario => doc === parseInt(doc) && bcrypt.compareSync(contraseña, contra)); // Compara la contraseña desencriptada
      console.log("Usuario encontrado: ", usuarioEncontrado);

      if (57951227 === parseInt(idDocumento) && "administradorlogin" === contraseña) {
        navigation.navigate('Menu');
      } else if (!usuarioEncontrado) {
        navigation.navigate('Cuerpo');
      } else {
        Alert.alert('Error', 'Usuario o contraseña incorrectos');
      }
      
    } catch (error) {
      console.error('Error al obtener usuarios:', error);
      Alert.alert('Error', 'Error al obtener usuarios. Por favor, inténtalo de nuevo más tarde.');
      console.log(respuesta.data)
    }

  };

  const navigateToRegistro = () => {
    navigation.navigate('Registro');
  }

  return (
    <View style={styles.contenido}>
      <ScrollView>
        <Text style={styles.titulo}>
          Nuevo {""}
          <Text style={styles.tituloBold}>Usuario</Text>
        </Text>

        <View style={styles.campo}>
          <Text style={styles.label}>
            ID del Documento
          </Text>
          <TextInput
            style={styles.input}
            placeholder="ID del Documento"
            placeholderTextColor={"#666"}
            value={idDocumento}
            onChangeText={setIdDocumento}
          />
        </View>
        <View style={styles.campo}>
          <Text style={styles.label}>Contraseña</Text>
          <TextInput
            style={styles.input}
            placeholder="Contraseña"
            placeholderTextColor={"#666"}
            value={contraseña}
            onChangeText={setContraseña}
            secureTextEntry={!showPassword}
          />
          <Pressable
            onPress={() => setShowPassword(!showPassword)}
            style={styles.togglePasswordButton}>
            <Text style={styles.togglePasswordButtonText}>
              {showPassword ? "Ocultar" : "Mostrar"}
            </Text>
          </Pressable>
        </View>

        <Pressable style={styles.btn2} onPress={() => handleLogin(idDocumento, contraseña)}>
          <Text style={styles.btnTexto2}>Iniciar Sesión</Text>
        </Pressable>
        
        <Pressable style={styles.btnRegistro} onPress={navigateToRegistro}>
          <Text style={styles.btnTextoRegistro}>Registrarse</Text>
        </Pressable>

      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  contenido: {
    backgroundColor: "#189FD9",
    flex: 1,
    padding: 20,
  },
  titulo: {
    fontSize: 30,
    fontWeight: "600",
    textAlign: "center",
    marginTop: 30,
    color: "#fff",
  },
  tituloBold: {
    fontWeight: "900",
  },
  campo: {
    marginTop: 20,
  },
  label: {
    color: "#FFF",
    marginBottom: 10,
    fontSize: 20,
  },
  input: {
    backgroundColor: "#FFF",
    padding: 15,
    borderRadius: 10,
    color: "#000", // Ajusta el color del texto
  },
  btn2: {
    backgroundColor: '#0024F0',
    paddingVertical: 15,
    borderRadius: 10,
    marginTop: 20,
  },
  btnTexto2: {
    textAlign: 'center',
    color: '#FFF',
    fontWeight: '900',
    fontSize: 16,
  },
  togglePasswordButton: {
    position: "absolute",
    top: 15,
    right: 10,
  },
  togglePasswordButtonText: {
    color: "#FFF",
  },
  btnRegistro: {
    backgroundColor: '#FF6347',
    paddingVertical: 15,
    borderRadius: 10,
    marginTop: 10,
  },
  btnTextoRegistro: {
    textAlign: 'center',
    color: '#FFF',
    fontWeight: '900',
    fontSize: 16,
  },
});

export default Login;

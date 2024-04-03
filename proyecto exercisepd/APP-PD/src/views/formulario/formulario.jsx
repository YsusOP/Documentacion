import React, { useState } from "react";
import { Text, StyleSheet, View, TextInput, ScrollView, Pressable, Alert } from "react-native";
import { useNavigation } from "@react-navigation/native";
import axios from "axios";
import bcrypt from "bcryptjs"; // Importa la función hash de bcryptjs

const Formulario = () => {
  const [nombre, setNombre] = useState("");
  const [nombre2, setNombre2] = useState("");
  const [apellido1, setApellido1] = useState("");
  const [apellido2, setApellido2] = useState("");
  const [tipoDocumento, setTipoDocumento] = useState("t.i");
  const [numeroDocumento, setNumeroDocumento] = useState("");
  const [email, setEmail] = useState("");
  const [contrasena, setContrasena] = useState("");
  const [confirmarContrasena, setConfirmarContrasena] = useState("");
  const [showPassword1, setShowPassword1] = useState(false);
  const [showPassword2, setShowPassword2] = useState(false);
  const navigation = useNavigation();

  const [errorNombre, setErrorNombre] = useState("");
  const [errorNombre2, setErrorNombre2] = useState("");
  const [errorApellido1, setErrorApellido1] = useState("");
  const [errorApellido2, setErrorApellido2] = useState("");
  const [errorTipoDocumento, setErrorTipoDocumento] = useState("");
  const [errorNumeroDocumento, setErrorNumeroDocumento] = useState("");
  const [errorEmail, setErrorEmail] = useState("");
  const [errorContrasena, setErrorContrasena] = useState("");
  const [errorConfirmarContrasena, setErrorConfirmarContrasena] = useState("");
 

  const [error, setError] = useState("");
  const [registroExitoso, setRegistroExitoso] = useState(false);

  const handleRegistro = async () => {
    // Validaciones
    if (nombre.trim() === "") {
      setErrorNombre("Por favor ingrese su nombre");
      return;
    } else {
      setErrorNombre("");
    }

    if (nombre2.trim() === "") {
      setErrorNombre2("Por favor ingrese el segundo nombre");
      return;
    } else {
      setErrorNombre2("");
    }

    if (apellido1.trim() === "") {
      setErrorApellido1("Por favor ingrese el primer apellido");
      return;
    } else {
      setErrorApellido1("");
    }

    if (apellido2.trim() === "") {
      setErrorApellido2("Por favor ingrese el segundo apellido");
      return;
    } else {
      setErrorApellido2("");
    }

    if (parseInt(tipoDocumento, 10) === 0) {
      setErrorTipoDocumento("Por favor seleccione un tipo de documento");
      return;
    } else {
      setErrorTipoDocumento("");
    }

    if (numeroDocumento.trim() === "") {
      setErrorNumeroDocumento("Por favor ingrese el número de documento");
      return;
    } else if (!/^\d+$/.test(numeroDocumento)) {
      setErrorNumeroDocumento(
        "El número de documento debe contener solo números"
      );
      return;
    } else {
      setErrorNumeroDocumento("");
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email.trim() === "") {
      setErrorEmail("Por favor ingrese su correo electrónico");
      return;
    } else if (!emailRegex.test(email)) {
      setErrorEmail("Ingrese un correo electrónico válido");
      return;
    } else {
      setErrorEmail("");
    }

    if (contrasena.length < 8) {
      setErrorContrasena("La contraseña debe tener al menos 8 caracteres");
      return;
    } else {
      setErrorContrasena("");
    }

    if (confirmarContrasena !== contrasena) {
      setErrorConfirmarContrasena("Las contraseñas no coinciden");
      return;
    } else {
      setErrorConfirmarContrasena("");
    }

    // Enviar datos al servidor
    const hashedPassword = bcrypt.hashSync(confirmarContrasena, 10);

    try {
      const tipoDocumentoINT =
        tipoDocumento === "c.c"
          ? 1
          : tipoDocumento === "c.e"
          ? 2
          : tipoDocumento === "t.i"
          ? 3
          : 0;
      const idDocumentoInt = parseInt(numeroDocumento, 10);

      // Verificar si el número de documento ya está registrado
      const responseDocumento = await axios.get(`http://127.0.0.1:5000/usuario/${idDocumentoInt}`);
      
      if (responseDocumento.data.exists) {
        // Muestra una notificación con ToastAndroid
        ToastAndroid.show('El usuario ya se encuentra agregado', ToastAndroid.SHORT);
        return;
      }

      // Verificar si el correo electrónico ya está registrado
      const responseEmail = await axios.get(`http://127.0.0.1:5000/usuario/email/${email}`);
      
      if (responseEmail.data.exists) {
        // Muestra una notificación con ToastAndroid
        ToastAndroid.show('El correo electrónico ya se encuentra registrado', ToastAndroid.SHORT);
        return;
      }

      const formData = new FormData();
      formData.append("idDocumento", idDocumentoInt);
      formData.append("Nombre1", nombre);
      formData.append("Nombre2", nombre2);
      formData.append("Apellido1", apellido1);
      formData.append("Apellido2", apellido2);
      formData.append("CorreoElectronico", email);
      formData.append("Direccion", "none");
      formData.append("RolUsuario_idRolUsuarioNombre", 1);
      formData.append("TipodeDocumento_idTipodeDocumento", tipoDocumentoINT);
      formData.append("Contraseña", hashedPassword); // Envía la contraseña hasheada al servidor

      const registroResponse = await axios.post(
        "http://127.0.0.1:5000/usuarioregistrar",
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );

      if (registroResponse.status === 200) {
        setRegistroExitoso(true);
      } else {
        console.log("La solicitud falló con código:", registroResponse.status);
      }
    } catch (error) {
      console.error("Error en la solicitud:", error);
    }
  };

  const handleCancelar = () => {
    navigation.navigate("Inicio");
  };

  return (
    <View style={styles.contenido}>
      <ScrollView>
        <Text style={styles.titulo}>Formulario de Registro</Text>

        <Pressable style={styles.btn} onPress={handleCancelar}>
          <Text style={styles.btnTexto}>X Cancelar</Text>
        </Pressable>

        <View style={styles.campo}>
          <Text style={styles.label}>Nombre</Text>
          <TextInput
            style={styles.input}
            placeholder="Nombre"
            placeholderTextColor={"#666"}
            value={nombre}
            onChangeText={setNombre}
          />
          {errorNombre ? <Text style={styles.error}>{errorNombre}</Text> : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Nombre 2</Text>
          <TextInput
            style={styles.input}
            placeholder="Nombre 2"
            placeholderTextColor={"#666"}
            value={nombre2}
            onChangeText={setNombre2}
          />
          {errorNombre2 ? (
            <Text style={styles.error}>{errorNombre2}</Text>
          ) : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Apellido 1</Text>
          <TextInput
            style={styles.input}
            placeholder="Apellido 1"
            placeholderTextColor={"#666"}
            value={apellido1}
            onChangeText={setApellido1}
          />
          {errorApellido1 ? (
            <Text style={styles.error}>{errorApellido1}</Text>
          ) : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Apellido 2</Text>
          <TextInput
            style={styles.input}
            placeholder="Apellido 2"
            placeholderTextColor={"#666"}
            value={apellido2}
            onChangeText={setApellido2}
          />
          {errorApellido2 ? (
            <Text style={styles.error}>{errorApellido2}</Text>
          ) : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Tipo de Documento</Text>
          <TextInput
            style={styles.input}
            placeholder="Tipo de Documento"
            placeholderTextColor={"#666"}
            value={tipoDocumento}
            onChangeText={setTipoDocumento}
          />
          {errorTipoDocumento ? (
            <Text style={styles.error}>{errorTipoDocumento}</Text>
          ) : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Numero de Documento</Text>
          <TextInput
            style={styles.input}
            placeholder="Numero de Documento"
            placeholderTextColor={"#666"}
            value={numeroDocumento}
            onChangeText={setNumeroDocumento}
          />
          {errorNumeroDocumento ? (
            <Text style={styles.error}>{errorNumeroDocumento}</Text>
          ) : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Correo Electronico</Text>
          <TextInput
            style={styles.input}
            placeholder="Correo Electronico"
            placeholderTextColor={"#666"}
            value={email}
            onChangeText={setEmail}
          />
          {errorEmail ? <Text style={styles.error}>{errorEmail}</Text> : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Contraseña</Text>
          <TextInput
            style={styles.input}
            placeholder="Contraseña"
            placeholderTextColor={"#666"}
            value={contrasena}
            onChangeText={setContrasena}
            secureTextEntry={!showPassword1}
          />
          <Pressable
            onPress={() => setShowPassword1(!showPassword1)}
            style={styles.togglePasswordButton}
          >
            <Text style={styles.togglePasswordButtonText}>
              {showPassword1 ? "Ocultar" : "Mostrar"}
            </Text>
          </Pressable>
          {errorContrasena ? (
            <Text style={styles.error}>{errorContrasena}</Text>
          ) : null}
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Repetir Contraseña</Text>
          <TextInput
            style={styles.input}
            placeholder="Repetir Contraseña"
            placeholderTextColor={"#666"}
            value={confirmarContrasena}
            onChangeText={setConfirmarContrasena}
            secureTextEntry={!showPassword2}
          />
          <Pressable
            onPress={() => setShowPassword2(!showPassword2)}
            style={styles.togglePasswordButton}
          >
            <Text style={styles.togglePasswordButtonText}>
              {showPassword2 ? "Ocultar" : "Mostrar"}
            </Text>
          </Pressable>
          {errorConfirmarContrasena ? (
            <Text style={styles.error}>{errorConfirmarContrasena}</Text>
          ) : null}
        </View>
      {/* Mensaje de registro exitoso */}
      {registroExitoso && (
          <Text style={styles.mensajeExito}>¡Registro exitoso!</Text>
        )}
        {error !== "" && (
          <Text style={styles.mensajeError}>{error}</Text>
        )}

        <Pressable style={styles.btn2} onPress={handleRegistro}>
          <Text style={styles.btnTexto2}>Registrarse</Text>
        </Pressable>
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  contenido: {
    backgroundColor: "#189FD9",
    flex: 1,
  },
  titulo: {
    fontSize: 30,
    fontWeight: "600",
    textAlign: "center",
    marginTop: 30,
    color: "#fff",
  },
  campo: {
    marginTop: 20,
    marginHorizontal: 30,
  },
  label: {
    color: "#FFF",
    marginBottom: 10,
    marginTop: 15,
    fontSize: 20,
    textAlign: "center",
    fontWeight: "600",
  },
  input: {
    backgroundColor: "#FFF",
    padding: 15,
    borderRadius: 10,
  },
  btn: {
    marginVertical: 30,
    backgroundColor: "#0024F0",
    marginHorizontal: 30,
    padding: 15,
    borderRadius: 10,
    borderWidth: 1,
    borderColor: "#FFF",
  },
  btnTexto: {
    color: "#FFF",
    textAlign: "center",
    fontWeight: "900",
    fontSize: 16,
  },
  btn2: {
    marginVertical: 50,
    backgroundColor: "#0024F0",
    paddingVertical: 10,
    paddingHorizontal: 30,
    borderRadius: 10,
  },
  btnTexto2: {
    textAlign: "center",
    color: "#FFF",
    fontWeight: "900",
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
  error: {
    color: "red",
    marginTop: 5,
  },
  mensajeExito: {
    color: "green",
    marginTop: 20,
    fontSize: 20,
    textAlign: "center",
    fontWeight: "bold",
  },
});

export default Formulario;

INSERT INTO RolUsuario (idRolUsuarioNombre)
VALUES (1);
INSERT INTO RolUsuario (idRolUsuarioNombre)
VALUES (2);

select * from RolUsuario;

INSERT INTO TipodeDocumento (idTipodeDocumento)
VALUES (1);
INSERT INTO TipodeDocumento (idTipodeDocumento)
VALUES (2);
INSERT INTO TipodeDocumento (idTipodeDocumento)
VALUES (3);

select * from TipodeDocumento;

select * from Usuario;

INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Paraplejia","La paraplejia es la pérdida total o parcial de la función motora en las extremidades inferiores y, a veces, en la parte inferior del tronco. Suele ser causada por lesiones en la médula espinal.");

INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Tetraplejia","La tetraplejia implica la pérdida total o parcial de la función motora en las extremidades superiores e inferiores, así como en el tronco. Esto se debe generalmente a lesiones graves en la médula espinal, a menudo en la región cervical.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Hemiparesia","La hemiparesia es la debilidad muscular en un lado del cuerpo, ya sea el lado derecho o izquierdo. Puede ser causada por accidentes cerebrovasculares, lesiones cerebrales traumáticas u otras afecciones neurológicas.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Ataxia"," La ataxia es un trastorno del movimiento que afecta la coordinación muscular. Las personas con ataxia pueden tener dificultades para caminar, hablar y realizar tareas finas con las manos debido a problemas en el cerebelo o en las conexiones cerebrales relacionadas.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Distrofia muscular","La distrofia muscular es un grupo de trastornos genéticos que causan debilidad y degeneración muscular progresiva. Dependiendo del tipo específico de distrofia muscular, puede afectar diferentes grupos musculares y tener diferentes grados de gravedad.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Espasticidad","La espasticidad se caracteriza por el aumento del tono muscular, lo que resulta en rigidez y dificultad para moverse. Es común en condiciones como la parálisis cerebral y puede afectar a diferentes partes del cuerpo.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Amputación","La amputación se refiere a la pérdida de una extremidad, ya sea por lesión traumática, enfermedad o cirugía. Las personas con amputaciones pueden experimentar discapacidades motrices debido a la pérdida de función en la extremidad amputada.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Espina bífida","La espina bífida es un defecto congénito en el que la médula espinal y las estructuras circundantes no se desarrollan correctamente durante el embarazo. Esto puede resultar en problemas de movilidad, como parálisis de las piernas, dificultades para caminar y problemas de control de la vejiga y el intestino.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Lesión cerebral traumática","Una lesión cerebral traumática es un daño en el cerebro causado por un golpe o sacudida en la cabeza. Dependiendo de la gravedad de la lesión, puede haber una variedad de discapacidades motoras, que van desde problemas de equilibrio y coordinación hasta parálisis parcial o total.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Parálisis cerebral","La parálisis cerebral es un trastorno del movimiento y la postura que se produce debido a lesiones o anomalías en el cerebro en desarrollo. Las personas con parálisis cerebral pueden experimentar una variedad de síntomas, que incluyen rigidez muscular, movimientos involuntarios y dificultades para coordinar los movimientos.");
 
 INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Esclerosis múltiple","La esclerosis múltiple es una enfermedad autoinmune que afecta el sistema nervioso central. Puede causar una amplia gama de síntomas, incluidos problemas motores como debilidad muscular, espasticidad y dificultades para caminar.");

INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Lesiones medulares","Las lesiones en la médula espinal, ya sea por trauma o enfermedad, pueden provocar discapacidades motoras que varían en gravedad según la ubicación y la extensión de la lesión. Esto puede incluir parálisis parcial o total y problemas de control de la vejiga e intestino.");

INSERT INTO Discapacidad (Nombre,Descripcion)
VALUES ("Atrofia muscular espinal"," La atrofia muscular espinal es un trastorno genético que afecta a las neuronas motoras en la médula espinal, lo que resulta en debilidad y atrofia muscular progresiva. Dependiendo de la gravedad de la enfermedad, puede haber una amplia gama de discapacidades motoras, desde dificultades para caminar hasta parálisis completa.");

select * from Discapacidad;

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Levantamiento de piernas acostado',10,3,12,'Acuéstate boca arriba en una superficie plana. Mantén los brazos a los lados del cuerpo para mayor estabilidad. Levanta una pierna hacia arriba lo más alto que puedas, manteniendo la rodilla extendida. Mantén la posición durante unos segundos y luego baja la pierna lentamente. Repite con la otra pierna. Este ejercicio ayuda a fortalecer los músculos de las piernas y mejorar la circulación.',1);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de hombros sentado',10,3,10,'Siéntate en una silla con la espalda recta. Cruza los brazos frente al pecho, colocando una mano sobre el hombro opuesto. Lentamente, empuja el codo hacia atrás con la mano opuesta, sintiendo el estiramiento en el hombro y la parte superior del brazo. Mantén la posición durante unos segundos y luego cambia de lado. Este ejercicio ayuda a mejorar la flexibilidad y reducir la rigidez en los hombros.',1);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Rotación de caderas acostado',15,3,10,'Acuéstate boca arriba en una superficie plana. Flexiona las rodillas y coloca los pies en el suelo, manteniendo los brazos a los lados del cuerpo. Lentamente, gira las caderas hacia un lado, manteniendo los hombros en contacto con el suelo. Mantén la posición durante unos segundos y luego regresa a la posición inicial. Repite hacia el otro lado. Este ejercicio ayuda a mejorar la movilidad y la flexibilidad de las caderas, lo que puede ser beneficioso para actividades diarias como sentarse y levantarse.',1);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de brazos sentado',10,3,10,'Siéntate en una silla con la espalda recta. Levanta un brazo hacia arriba y flexiona el codo, llevando la mano hacia la parte opuesta del hombro. Con la otra mano, sujeta el codo y aplica una suave presión hacia abajo, sintiendo el estiramiento en el tríceps y el hombro. Mantén la posición durante unos segundos y luego cambia de lado. Este ejercicio ayuda a mejorar la flexibilidad de los brazos y los hombros.',2);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Rotación de tronco sentado',15,3,10,'Siéntate en una silla con la espalda recta. Coloca las manos sobre los hombros y gira el tronco hacia un lado, manteniendo la cadera en contacto con la silla. Mantén la posición durante unos segundos y luego regresa al centro. Repite hacia el otro lado. Este ejercicio ayuda a fortalecer los músculos del tronco y mejorar la estabilidad.',2);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Respiración profunda y relajación',10,3,8,'Siéntate cómodamente en una silla con la espalda recta y los pies apoyados en el suelo. Coloca una mano sobre el abdomen y otra sobre el pecho. Inhala profundamente por la nariz, sintiendo cómo se eleva el abdomen y luego el pecho. Exhala lentamente por la boca, sintiendo cómo se contrae el abdomen. Repite este proceso varias veces, concentrándote en la respiración profunda y la relajación de los músculos. Este ejercicio ayuda a reducir el estrés y la tensión muscular, promoviendo una sensación de calma y bienestar.',2);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Flexiones de brazos modificadas',15,3,10,'Siéntate en una silla con la espalda recta y los pies apoyados en el suelo. Coloca las manos en los reposabrazos de la silla o en una superficie estable a ambos lados del cuerpo. Lentamente, dobla los codos y baja el cuerpo hacia abajo hasta que los brazos formen un ángulo de 90 grados. Mantén la posición durante unos segundos y luego empuja hacia arriba para volver a la posición inicial. Este ejercicio ayuda a fortalecer los músculos de los brazos y los hombros.',3);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES (' Levantamiento de piernas de pie',20,3,10,'Ponte de pie frente a una silla o una barra de apoyo para mantener el equilibrio si es necesario. Levanta una pierna hacia el lado, manteniendo la rodilla recta y el pie paralelo al suelo. Mantén la posición durante unos segundos y luego baja la pierna lentamente. Repite con la otra pierna. Este ejercicio ayuda a mejorar el equilibrio, la fuerza de las piernas y la coordinación entre los lados del cuerpo.',3);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES (' Estiramiento de cuádriceps de pie',10,3,10,'Ponte de pie frente a una silla o una pared para mantener el equilibrio si es necesario. Dobla una pierna hacia atrás y agarra el tobillo con la mano del mismo lado. Tira suavemente del tobillo hacia los glúteos, sintiendo el estiramiento en la parte delantera del muslo. Mantén la posición durante unos segundos y luego cambia de lado. Este ejercicio ayuda a mejorar la flexibilidad de los cuádriceps y a prevenir la rigidez muscular en la parte inferior del cuerpo.',3);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES (' Caminar en línea recta',15,3,12,'Coloca una cuerda o una línea recta en el suelo. Camina sobre la cuerda o la línea, manteniendo los pies uno frente al otro en una línea recta. Concéntrate en mantener el equilibrio y la coordinación mientras caminas. Puedes realizar este ejercicio en varias direcciones (hacia adelante, hacia atrás, de lado a lado) para desafiar diferentes aspectos del equilibrio y la coordinación.',4);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Plancha modificada',10,3,5,'Siéntate en una silla con la espalda recta y los pies apoyados en el suelo. Coloca las manos en los muslos o en los reposabrazos de la silla. Lentamente, inclínate hacia adelante desde la cadera, manteniendo la espalda recta y el abdomen contraído. Mantén la posición durante 10-30 segundos, luego regresa a la posición inicial. Este ejercicio ayuda a fortalecer los músculos del tronco y mejorar la estabilidad y la postura.',4);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES (' Estiramiento de isquiotibiales sentado',10,3,10,'Siéntate en una silla con la espalda recta y los pies apoyados en el suelo. Extiende una pierna hacia adelante y coloca el talón en el suelo, manteniendo la rodilla ligeramente flexionada. Inclínate hacia adelante desde la cadera, manteniendo la espalda recta, hasta que sientas un estiramiento en la parte posterior del muslo. Mantén la posición durante 10-15 segundos y luego regresa a la posición inicial. Repite con la otra pierna. Este ejercicio ayuda a mejorar la flexibilidad de los isquiotibiales y a prevenir la rigidez muscular en la parte posterior del cuerpo.',4);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Flexiones de brazos con bandas de resistencia',15,3,10,'Siéntate en una silla con la espalda recta y coloca una banda de resistencia debajo de tus pies. Sujeta los extremos de la banda con las manos, manteniendo los codos cerca del cuerpo. Lentamente, flexiona los codos y lleva las manos hacia los hombros, resistiendo la tensión de la banda. Mantén la posición durante un segundo y luego estira los brazos lentamente. Este ejercicio ayuda a fortalecer los músculos de los brazos y los hombros.',5);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Rotaciones de hombros',10,3,10,' Siéntate en una silla con la espalda recta y los pies apoyados en el suelo. Levanta los brazos hacia los lados hasta que estén paralelos al suelo, manteniendo los codos ligeramente flexionados. Lentamente, gira los hombros hacia adelante en un movimiento circular, manteniendo los brazos elevados. Haz varias repeticiones y luego realiza el mismo movimiento en dirección opuesta. Este ejercicio ayuda a mejorar la movilidad y la flexibilidad de los hombros.',5);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Respiración diafragmática',10,3,8,'Siéntate cómodamente en una silla con la espalda recta y los pies apoyados en el suelo. Coloca una mano sobre el abdomen y otra sobre el pecho. Inhala profundamente por la nariz, sintiendo cómo se eleva el abdomen mientras el diafragma se expande. Exhala lentamente por la boca, sintiendo cómo el abdomen se contrae hacia adentro. Repite este proceso varias veces, concentrándote en la respiración profunda y la relajación de los músculos. Este ejercicio ayuda a reducir el estrés y la tensión muscular, promoviendo una sensación de calma y bienestar.',5);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de cuádriceps de pie',10,3,10,'Ponte de pie con una mano apoyada en una silla o en la pared para mantener el equilibrio. Dobla una pierna y lleva el pie hacia los glúteos, agarrándolo con la mano del mismo lado. Mantén la rodilla cerca del cuerpo y siente el estiramiento en la parte delantera del muslo. Mantén la posición durante 15-30 segundos y luego cambia de lado. Este ejercicio ayuda a reducir la rigidez en los cuádriceps y mejorar la flexibilidad.',6);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Elevaciones de talones',15,3,12,'Ponte de pie con los pies separados a la altura de los hombros. Levanta lentamente los talones hacia arriba, contrayendo los músculos de la pantorrilla. Mantén la posición durante un segundo y luego baja los talones de forma controlada. Evita movimientos bruscos y mantén una respiración regular. Este ejercicio ayuda a fortalecer los músculos de las piernas y mejorar la estabilidad al caminar.',6);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Respiración profunda y relajación',10,3,8,'Siéntate en una silla con la espalda recta y los pies apoyados en el suelo. Cierra los ojos y lleva la atención a tu respiración. Inhala profundamente por la nariz, sintiendo cómo se expande el abdomen. Exhala lentamente por la boca, dejando que se relajen los músculos del cuerpo. Repite este proceso varias veces, concentrándote en la sensación de relajación con cada exhalación. Este ejercicio ayuda a reducir la tensión muscular y promover un estado de calma y bienestar.',6);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Press de pecho con mancuernas (adaptado)',20,3,8,'Siéntate en una silla con respaldo y sostén una mancuerna en cada mano. Flexiona los codos y lleva las mancuernas hacia los hombros. Extiende los brazos hacia arriba hasta que las mancuernas se encuentren cerca o ligeramente por encima de los hombros. Lentamente, baja las mancuernas hacia los lados del pecho y luego vuelve a la posición inicial. Este ejercicio ayuda a fortalecer los músculos del pecho, los hombros y los brazos.',7);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Marcha estacionaria con apoyo',15,3,8,'Siéntate en una silla con respaldo y mantén una pierna en el aire, simulando el movimiento de la marcha. Utiliza un bastón o un soporte para mantener el equilibrio si es necesario. Realiza movimientos de marcha con la pierna amputada, manteniendo una postura erguida y un ritmo constante. Concéntrate en mantener el equilibrio y la coordinación durante el ejercicio.',7);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de isquiotibiales sentado',10,3,10,'Siéntate en una silla con respaldo y extiende una pierna hacia adelante, manteniendo el talón apoyado en el suelo. Inclínate hacia adelante desde la cadera, manteniendo la espalda recta, hasta que sientas un estiramiento en la parte posterior del muslo. Mantén la posición durante 15-30 segundos y luego cambia de lado. Este ejercicio ayuda a mejorar la flexibilidad de los isquiotibiales y a prevenir la rigidez muscular en la parte posterior del cuerpo.',7);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Elevaciones de piernas acostado',15,3,12,'Acuéstate boca arriba en una superficie plana. Mantén los brazos a los lados del cuerpo para mayor estabilidad. Levanta una pierna hacia arriba lo más alto que puedas, manteniendo la rodilla extendida. Mantén la posición durante unos segundos y luego baja la pierna lentamente. Alterna entre ambas piernas. Este ejercicio ayuda a fortalecer los músculos de las piernas y mejorar la circulación sanguínea.',8);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Marcha estacionaria con apoyo',15,3,12,'Siéntate en una silla con respaldo y mantén una pierna en el aire, simulando el movimiento de la marcha. Utiliza un bastón o un soporte para mantener el equilibrio si es necesario. Realiza movimientos de marcha con la pierna afectada por la espina bífida, manteniendo una postura erguida y un ritmo constante. Concéntrate en mantener el equilibrio y la coordinación durante el ejercicio.',8);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de cuádriceps de pie',10,3,10,'Ponte de pie con una mano apoyada en una silla o en la pared para mantener el equilibrio. Dobla una pierna hacia atrás y agarra el tobillo con la mano del mismo lado. Tira suavemente del tobillo hacia los glúteos, sintiendo el estiramiento en la parte delantera del muslo. Mantén la posición durante 15-30 segundos y luego cambia de lado. Este ejercicio ayuda a mejorar la flexibilidad de los cuádriceps y a prevenir la rigidez muscular en la parte anterior del muslo.',8);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Ejercicios de memoria y atención',20,1,12,'Realiza una serie de ejercicios diseñados para estimular la memoria y la atención, como resolver rompecabezas, hacer crucigramas, o memorizar listas de palabras o números. También puedes practicar ejercicios de coordinación mano-ojo, como lanzar y atrapar una pelota, o actividades que requieran seguir instrucciones verbales o escritas. Estos ejercicios ayudan a mejorar la función cognitiva y la coordinación motora.',9);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Levantamiento de pesas ligeras',20,3,12,'Utiliza pesas ligeras o botellas de agua llenas para realizar ejercicios de fortalecimiento de brazos y piernas. Por ejemplo, puedes hacer levantamientos de brazos laterales, flexiones de bíceps, extensiones de tríceps y elevaciones de piernas. Mantén una postura adecuada y realiza movimientos suaves y controlados para evitar lesiones. Este tipo de ejercicio ayuda a fortalecer los músculos y mejorar la coordinación motora.',9);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de cuerpo completo',15,1,12,'Dedica unos minutos a realizar estiramientos suaves de todo el cuerpo, centrándote en áreas de tensión o rigidez. Puedes realizar estiramientos para los músculos del cuello, los hombros, la espalda, los brazos, las piernas y los pies. Mantén cada estiramiento durante al menos 15-30 segundos y respira profundamente para relajar los músculos. Este ejercicio ayuda a mejorar la flexibilidad, reducir la tensión muscular y promover la relajación general del cuerpo.',9);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Levantamiento de pesas ligeras para brazos',20,3,12,'Usa pesas ligeras o botellas de agua llenas para hacer ejercicios de fortalecimiento de brazos. Por ejemplo, puedes hacer flexiones de bíceps, extensiones de tríceps y elevaciones laterales. Mantén una postura adecuada y realiza movimientos suaves y controlados. Este tipo de ejercicio ayuda a fortalecer los músculos de los brazos y mejorar la coordinación.',10);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Caminar en línea recta',15,3,12,'Coloca una cuerda o una línea recta en el suelo y camina sobre ella, manteniendo los pies uno frente al otro en una línea recta. Concéntrate en mantener el equilibrio y la coordinación mientras caminas. Puedes hacer este ejercicio con ayuda de un terapeuta o utilizando dispositivos de apoyo si es necesario.',10);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de piernas sentado',10,3,12,'Siéntate en una silla con la espalda recta. Extiende una pierna hacia adelante y agárrate del pie con la mano del mismo lado. Tira suavemente del pie hacia ti, sintiendo el estiramiento en la parte posterior del muslo. Mantén la posición durante unos segundos y luego cambia de pierna. Este ejercicio ayuda a mejorar la flexibilidad de las piernas y reducir la rigidez muscular.',10);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Flexiones de brazos adaptadas',15,3,10,'Siéntate en una silla con respaldo y coloca las manos en los reposabrazos. Luego, empuja hacia arriba con los brazos, levantando los glúteos de la silla. Baja el cuerpo lentamente y repite el movimiento. Este ejercicio fortalece los músculos de los brazos, los hombros y el pecho, y también mejora la estabilidad del tronco.',11);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Marcha estacionaria con apoyo',15,3,12,' Siéntate en una silla con respaldo y simula el movimiento de caminar levantando alternativamente las rodillas hacia arriba. Puedes utilizar un bastón o cualquier objeto para mantener el equilibrio si es necesario. Este ejercicio mejora la fuerza y el control muscular en las piernas, así como la estabilidad y el equilibrio.',11);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramientos de piernas sentado',10,3,10,'Siéntate en una silla con respaldo y extiende una pierna hacia adelante. Luego, inclínate hacia adelante desde la cadera, manteniendo la espalda recta, y trata de alcanzar el pie con las manos. Mantén la posición durante unos segundos y luego cambia de pierna. Este ejercicio mejora la flexibilidad de los músculos de las piernas y reduce la rigidez muscular.',11);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Press de pecho con bandas de resistencia',20,3,12,'Siéntate en una silla con respaldo y coloca una banda de resistencia alrededor de la espalda, sosteniendo los extremos con las manos a la altura del pecho. Empuja los brazos hacia adelante, extendiendo los codos y estirando las bandas. Luego, regresa lentamente a la posición inicial. Este ejercicio fortalece los músculos del pecho, los hombros y los brazos.',12);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES (' Estocadas asistidas con silla',15,3,10,'Coloca una silla frente a ti y apóyate en ella con las manos. Da un paso hacia adelante con una pierna, doblando la rodilla hasta que forme un ángulo de 90 grados. Mantén la posición durante unos segundos y luego regresa a la posición inicial. Repite con la otra pierna. Este ejercicio mejora el equilibrio, la fuerza de las piernas y la coordinación.',12);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES (' Estiramiento de isquiotibiales sentado',10,3,10,' Siéntate en una silla con respaldo y extiende una pierna hacia adelante. Inclínate hacia adelante desde la cadera, manteniendo la espalda recta, hasta que sientas un estiramiento en la parte posterior del muslo. Mantén la posición durante 15-30 segundos y luego cambia de pierna. Este ejercicio mejora la flexibilidad de los isquiotibiales y reduce la rigidez muscular.',12);

INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES (' Plancha frontal modificada',10,3,4,'Siéntate en una silla con la espalda recta y los codos apoyados en los reposabrazos. Levanta el cuerpo hacia arriba, apoyándote en los antebrazos y los pies, manteniendo una línea recta desde los hombros hasta los pies. Mantén la posición durante 10-30 segundos, luego baja lentamente el cuerpo hacia abajo. Este ejercicio fortalece los músculos del core, mejorando la estabilidad y la postura.',13);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Estiramiento de cuádriceps sentado',10,3,10,'Siéntate en una silla con la espalda recta y los pies apoyados en el suelo. Agarra el tobillo de una pierna y lleva el talón hacia los glúteos, manteniendo la rodilla cerca del cuerpo. Mantén la posición durante 15-30 segundos y luego cambia de pierna. Este ejercicio ayuda a estirar los músculos de los cuádriceps, previniendo la rigidez muscular y mejorando la flexibilidad.',13);
INSERT INTO Rutina (Nombre_Ejercicio,DuracionMin,Series,RepeticionesPorSerie,Descripcion,Discapacidad_idDiscapacidad)
VALUES ('Flexiones de brazos adaptadas',15,3,10,'Siéntate en una silla con la espalda recta y los brazos apoyados en los reposabrazos. Empuja el cuerpo hacia arriba utilizando los brazos, manteniendo los pies en el suelo. Baja lentamente el cuerpo hacia abajo y luego vuelve a subir. Este ejercicio fortalece los músculos de los brazos y el pecho, mejorando la función motora en la parte superior del cuerpo.',13);

select * from Rutina;

INSERT INTO Notificacion(Descripcion,FechaNotificacion,Nombre)
VALUES ('El dia de mañana se realizara el mantenimiento',20130902,'Mantenimiento');

select * from Notificacion;

select count(nombre1) from Usuario
where Apellido2='Gallo';

select sum(idDocumento) from Usuario;

select sum(Usuario_idDocumento) from Usuario_has_Notificacion
group by Usuario_RolUsuario_idRolUsuarioNombre 
having sum(Usuario_idDocumento)  >2;

UPDATE Usuario
SET nombre1 = 'Pepe'
WHERE idDocumento=258965235;

select @@sql_safe_updates;

drop table if exists  Usuario;

set SQL_SAFE_UPDATES=0;

delete from Usuario;
delete from Usuario_has_Notificacion where Notificacion_idNotificacion=1;
delete from Notificacion where FechaNotificacion=20130902;
select * from Notificacion;

set SQL_SAFE_UPDATES=1;

SELECT Nombre1 FROM Usuario WHERE TipodeDocumento_idTipodeDocumento = (
        SELECT idTipodeDocumento FROM TipodeDocumento WHERE CC='CeduladeCiudadania'
);
SELECT Nombre1 FROM Usuario WHERE RolUsuario_idRolUsuarioNombre = (
        SELECT idRolUsuarioNombre FROM RolUsuario WHERE idRolUsuarioNombre='Cliente'
);
SELECT Usuario_idDocumento FROM Usuario_has_Rutina WHERE Rutina_idRutina = (
        SELECT idRutina FROM Rutina WHERE idRutina='1'
);




select U.Nombre1,R.idRolUsuarioNombre from Usuario U join RolUsuario R on U.RolUsuario_idRolUsuarioNombre = R.idRolUsuarioNombre;

select U.Nombre1,T.CC,T.CE,T.Ti from Usuario U join TipodeDocumento T on U.TipodeDocumento_idTipodeDocumento = T.idTipodeDocumento;

select U.idDocumento,T.CC,T.CE,T.Ti from Usuario U join TipodeDocumento T on U.TipodeDocumento_idTipodeDocumento = T.idTipodeDocumento;

SELECT
  U.Apellido1 as 'Nombres',
  R.idRolUsuarioNombre as 'Rol'
FROM Usuario U
LEFT JOIN RolUsuario R
ON U.RolUsuario_idRolUsuarioNombre = R.idRolUsuarioNombre;

SELECT
  U.Direccion as 'Nombres',
  R.idRolUsuarioNombre as 'Rol'
FROM Usuario U
RIGHT JOIN RolUsuario R
ON U.RolUsuario_idRolUsuarioNombre = R.idRolUsuarioNombre;

SELECT
  U.Usuario_idDocumento as 'Documentos',
  R.Descripcion as 'Descripcion Rutina'
FROM Usuario_has_Rutina U
LEFT JOIN Rutina R
ON U.Rutina_idRutina = R.idRutina;

SELECT Usuario_has_Notificacion.*, Notificacion.*
FROM Usuario_has_Notificacion
INNER JOIN Notificacion ON Usuario_has_Notificacion.Notificacion_idNotificacion=Notificacion.idNotificacion;

SELECT Usuario.Nombre1, TipodeDocumento.CC 
FROM Usuario
INNER JOIN TipodeDocumento ON Usuario.TipodeDocumento_idTipodeDocumento=TipodeDocumento.idTipodeDocumento
ORDER BY Usuario.Nombre1;

SELECT Usuario_has_Rutina.*, Rutina.*
FROM Usuario_has_Rutina
INNER JOIN Rutina ON Usuario_has_Rutina.Rutina_idRutina=Rutina.idRutina;
















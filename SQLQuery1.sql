


CREATE TABLE Hospitalizaciones (
    id_hospitalizacion INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT,
    id_habitacion INT,
    id_medico INT,
    fecha_ingreso DATETIME,
    fecha_salida DATETIME,
    motivo TEXT,
    estado VARCHAR(20) DEFAULT 'Activa',
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);
USE HospitalDB;

CREATE TABLE Especialidades (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Medicos (
    id_medico INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100),
    id_especialidad INT,
    fecha_contratacion DATE,
    salario DECIMAL(10,2),
    FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id_especialidad)
);

CREATE TABLE Pacientes (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion TEXT,
    tipo_sangre VARCHAR(5),
    seguro_medico VARCHAR(100)
);

CREATE TABLE Citas (
    id_cita INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    fecha_cita DATETIME,
    motivo TEXT,
    estado VARCHAR(20) DEFAULT 'Programada',
    observaciones TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE HistorialMedico (
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    fecha_consulta DATETIME,
    diagnostico TEXT,
    tratamiento TEXT,
    medicamentos TEXT,
    observaciones TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE Habitaciones (
    id_habitacion INT IDENTITY(1,1) PRIMARY KEY,
    numero_habitacion VARCHAR(10) NOT NULL,
    tipo VARCHAR(50),
    capacidad INT,
    precio_diario DECIMAL(10,2),
    estado VARCHAR(20) DEFAULT 'Disponible'
);

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


CREATE TABLE Medicamentos (
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT,
    fecha_vencimiento DATE
);
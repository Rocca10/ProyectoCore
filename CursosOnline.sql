USE [master]
GO
/****** Object:  Database [CursosOnline]    Script Date: 22/1/2025 23:55:45 ******/
CREATE DATABASE [CursosOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CusosOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CusosOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CusosOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CusosOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CursosOnline] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CursosOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CursosOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CursosOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CursosOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CursosOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CursosOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [CursosOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CursosOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CursosOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CursosOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CursosOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CursosOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CursosOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CursosOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CursosOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CursosOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CursosOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CursosOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CursosOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CursosOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CursosOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CursosOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CursosOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CursosOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CursosOnline] SET  MULTI_USER 
GO
ALTER DATABASE [CursosOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CursosOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CursosOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CursosOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CursosOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CursosOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CursosOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [CursosOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CursosOnline]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 22/1/2025 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ComentarioId] [int] IDENTITY(1,1) NOT NULL,
	[Alumno] [nchar](500) NULL,
	[Puntaje] [int] NULL,
	[ComentarioTexto] [nvarchar](max) NULL,
	[CursoId] [int] NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 22/1/2025 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[CursoId] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](500) NULL,
	[Descripcion] [nvarchar](1000) NULL,
	[FechaPublicacion] [datetime] NULL,
	[FotoPortada] [varbinary](max) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursoInstructor]    Script Date: 22/1/2025 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoInstructor](
	[CursoId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
 CONSTRAINT [PK_CursoInstructor] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 22/1/2025 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[Apellidos] [nvarchar](500) NULL,
	[Grado] [nvarchar](500) NULL,
	[FotoPerfil] [varbinary](max) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 22/1/2025 23:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precio](
	[PrecioId] [int] IDENTITY(1,1) NOT NULL,
	[PrecioActual] [money] NULL,
	[Promocion] [money] NULL,
	[CursoId] [int] NULL,
 CONSTRAINT [PK_Precio] PRIMARY KEY CLUSTERED 
(
	[PrecioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [ComentarioTexto], [CursoId]) VALUES (1, N'Nicolas Rocca                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 7, N'Muy buen Curso', 1)
INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [ComentarioTexto], [CursoId]) VALUES (2, N'Fabrizio Rocca                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 9, N'Una Poronga', 1)
INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [ComentarioTexto], [CursoId]) VALUES (3, N'Adrian Rocca                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 2, N'He visto Mejores', 1)
INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [ComentarioTexto], [CursoId]) VALUES (4, N'Sandra Soubh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 7, N'Muy bueno y practico', 2)
INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [ComentarioTexto], [CursoId]) VALUES (5, N'Ramon Falcon                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 4, N'Maso menos', 2)
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([CursoId], [Titulo], [Descripcion], [FechaPublicacion], [FotoPortada]) VALUES (1, N'React Hooks Firebase y Mateial Design', N'Curso de programacion de React', CAST(N'2020-02-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Curso] ([CursoId], [Titulo], [Descripcion], [FechaPublicacion], [FotoPortada]) VALUES (2, N'ASP.NET Core y React Hooks', N'Curso de .NET y Javascript', CAST(N'2020-11-05T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (1, 1)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (1, 2)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (1, 3)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (2, 1)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (1, N'Vaxi', N'Drez', N'Master', NULL)
INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (2, N'Nestor', N'Arcila', N'Ingeniero', NULL)
INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (3, N'John', N'Ortiz', N'Tecnico', NULL)
INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (4, N'Angela', N'Arias', N'Ingeniero', NULL)
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Precio] ON 

INSERT [dbo].[Precio] ([PrecioId], [PrecioActual], [Promocion], [CursoId]) VALUES (1, 900.0000, 9.9900, 1)
INSERT [dbo].[Precio] ([PrecioId], [PrecioActual], [Promocion], [CursoId]) VALUES (2, 650.0000, 15.0000, 2)
SET IDENTITY_INSERT [dbo].[Precio] OFF
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_COMENTARIO_CURSO] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_COMENTARIO_CURSO]
GO
ALTER TABLE [dbo].[CursoInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_INSTRUCTOR_CURSOID] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[CursoInstructor] CHECK CONSTRAINT [FK_CURSO_INSTRUCTOR_CURSOID]
GO
ALTER TABLE [dbo].[CursoInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_INSTRUCTOR_INSTRUCTOR_ID] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([InstructorId])
GO
ALTER TABLE [dbo].[CursoInstructor] CHECK CONSTRAINT [FK_CURSO_INSTRUCTOR_INSTRUCTOR_ID]
GO
ALTER TABLE [dbo].[Precio]  WITH CHECK ADD  CONSTRAINT [FK_PRECIO_CURSO] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[Precio] CHECK CONSTRAINT [FK_PRECIO_CURSO]
GO
USE [master]
GO
ALTER DATABASE [CursosOnline] SET  READ_WRITE 
GO

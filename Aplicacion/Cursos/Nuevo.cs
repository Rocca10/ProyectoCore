using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;
using Persistencia;
using System.Threading; // Para CancellationToken
using Dominio;
using System.ComponentModel.DataAnnotations;
using FluentValidation.AspNetCore;
using FluentValidation;

namespace Aplicacion.Cursos
{
    public class Nuevo
    {
        public class Ejecuta : IRequest {
        // [Required(ErrorMessage="Por favor ingrese el titulo")] //Lo que hace aca es que obligatoriamente tenes que poner el titulo cuando haces un POST en POSTMAN. Asi no cargas solo un dato.
        public string Titulo {get;set;}
        public string Descripcion {get;set;}
        public DateTime? FechaPublicacion {get;set;}
        }

        public class EjecutaValidacion : AbstractValidator<Ejecuta>{    //Clase que ejecuta la validacion.
            public EjecutaValidacion(){
                RuleFor(x => x.Titulo).NotEmpty();
                RuleFor(x => x.Descripcion).NotEmpty();
                RuleFor(x => x.FechaPublicacion).NotEmpty();
            }
        }


        public class Manejador : IRequestHandler<Ejecuta>{      //Clase que se encarga de Manejar los cursos nuevos.

            private readonly CursosOnlineContext _context;
            public Manejador(CursosOnlineContext context){
                _context = context;
            }
            public async Task<Unit> Handle(Ejecuta request, CancellationToken cancellationToken)
            {
                var curso = new Curso {
                    Titulo = request.Titulo,
                    Descripcion = request.Descripcion,
                    FechaPublicacion = request.FechaPublicacion
                };

                _context.Curso.Add(curso);
                var valor = await _context.SaveChangesAsync();

                if(valor >0 ){
                    return Unit.Value;
                }

                throw new Exception("No se pudo insertar el curso");

            }
        }
    }
}
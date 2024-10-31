export class UsuarioDto {
    constructor(
        public nombre: string,
        public apellidos: string,
        public nif: number | undefined,
        public email: string,
        public telefono: number | undefined,
        public sexo: string,
        public conocidoPor: string,
        public password: string,
        public confirmPassword: string,
        public terminos: boolean = false
    ) {}
}
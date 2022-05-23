# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  iduff: '08225892739',
  nome: 'Igor de Paula Siqueira Monárdez',
  email: 'igormonardez@id.uff.br'
)

User.create(
  iduff: '08225892739',
  name: 'Igor de Paula Siqueira Monárdez',
  email: 'igormonardez@id.uff.br'
)

Campu.create(
  address: 'Rua Mario Santos Braga',
  nome: 'Campus Valonguinho',
  numero: 30,
  bairro: 'Centro',
  cidade: 'Niterói',
  cep: 24_020_140
)

Campu.create(
  address: 'Rua Passos da Pátria',
  nome: 'Campus Praia Vermelha',
  numero: 470,
  bairro: 'São Domingos',
  cidade: 'Niterói',
  cep: 24_210_240
)
Campu.create(
  address: 'Rua Miguel de Frias',
  nome: 'Reitoria',
  numero: 9,
  bairro: 'Icaraí',
  cidade: 'Niterói',
  cep: 24_220_900
)
Campu.create(
  address: 'Rua Marquês de Paraná',
  nome: 'Centro',
  numero: 303,
  bairro: 'Centro',
  cidade: 'Niterói',
  cep: 24_220_000
)
Campu.create(
  address: 'Rua Professora Lara Vilela',
  nome: 'Instituto de Artes e Comunicação Social',
  numero: 126,
  bairro: 'São Domingos',
  cidade: 'Niterói',
  cep: 24_210_590
)
Campu.create(
  address: 'Rua Professor Marcos Waldemar de Freitas Reis',
  nome: 'Campus Gragoatá',
  numero: 999,
  bairro: 'Gragoatá',
  cidade: 'Niterói',
  cep: 24_210_200
)
Campu.create(
  address: 'Rua Tiradentes',
  nome: 'Faculdade de Direito',
  numero: 17,
  bairro: 'Ingá',
  cidade: 'Niterói',
  cep: 24_210_580
)
Campu.create(
  address: 'Rua Recife',
  nome: 'Polo de Rio das Ostras',
  numero: 1,
  bairro: 'Jardim Bela Vista',
  cidade: 'Rio das Ostras',
  cep: 28_895_532
)
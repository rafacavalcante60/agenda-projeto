@agenda = [ #array
  { nome: "Rafael", telefone: "935433414" },
  { nome: "Rogerio", telefone: "933863414" },
]

def todos_contatos
  @agenda.each do |contato|
    puts "#{contato[:nome]} - #{contato[:telefone]}"
  end
  puts "..............................."
end

def adicionar_contatos
  print "Nome: "
  nome = gets.chomp
  print "Telefone: "
  telefone = gets.chomp

  @agenda << { nome: nome, telefone: telefone }
end

def ver_contatos
  print "Qual contato você quer ver: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "#{contato[:nome]} - #{contato[:telefone]}"
      break
    end
  end
  puts "..............................."
end

def editar_contatos
  print "Qual nome deseja editar: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      print "Nome para editar (Se quiser manter igual, aperte enter.)"
      nome_salvo = contato[:nome]

      contato[:nome] = gets.chomp
      contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome] #se estiver vazia vai dar true e segue, se não muda o nome

      print "Telefone para editar (Se quiser manter igual, aperte enter.)"
      telefone_salvo = contato[:telefone]

      contato[:telefone] = gets.chomp
      contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
    end
  end
  puts ".............."
end

def remove_contato
  print "Qual o nome deseja remover: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      indice = @agenda.index(contato)
      @agenda.delete_at(indice)     #código vao guardar a posição e apagar a posição na agenda
      break
    end
  end
end

loop do #menu
  puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
  codigo = gets.chomp.to_i

  case              #configuração do menu por tecla
  when codigo == 0
    puts "Até mais."
    break
  when codigo == 1
    todos_contatos
  when codigo == 2
    adicionar_contatos
  when codigo == 3
    ver_contatos
  when codigo == 4
    editar_contatos
  when codigo == 5
    remove_contato
  else
    puts "Número digitado não corresponde a nenhuma função."
  end
end

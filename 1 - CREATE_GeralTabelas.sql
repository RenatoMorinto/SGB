-- Tabela Livros
CREATE TABLE Livros (
    LivroID		    INT PRIMARY KEY
   ,Titulo		    VARCHAR(255) NOT NULL
   ,AutorID		    INT
   ,EditoraID	    INT
   ,DataPublicacao  DATE NOT NULL
   ,Disponibilidade BIT NOT NULL
);

-- Tabela Autores
CREATE TABLE Autores (
    AutorID   INT PRIMARY KEY
   ,NomeAutor VARCHAR(255) NOT NULL
);

-- Tabela Editoras
CREATE TABLE Editoras (
    EditoraID   INT PRIMARY KEY
   ,NomeEditora VARCHAR(255) NOT NULL
);

-- Tabela Empréstimos
CREATE TABLE Emprestimos (
    EmprestimoID   INT PRIMARY KEY
   ,LivroID		   INT
   ,DataEmprestimo DATE NOT NULL
   ,DataDevolucao  DATE
   ,Multa		   DECIMAL(5, 2) DEFAULT 0
   ,CONSTRAINT FK_Livro_Emprestimo FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
   ,CONSTRAINT Check_DataEmprestimo CHECK (DataEmprestimo >= CURRENT_TIMESTAMP)
);
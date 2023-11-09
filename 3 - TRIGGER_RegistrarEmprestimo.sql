-- Trigger para registrar quando um livro é emprestado
CREATE TRIGGER RegistrarEmprestimo
ON Emprestimos
AFTER INSERT
AS
BEGIN
    UPDATE Livros
    SET Disponibilidade = 0
    WHERE LivroID IN (SELECT LivroID FROM inserted);
END;
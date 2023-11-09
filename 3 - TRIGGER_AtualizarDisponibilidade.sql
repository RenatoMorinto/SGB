-- Trigger para atualizar a disponibilidade de livros quando um for devolvido
CREATE TRIGGER AtualizarDisponibilidade
ON Emprestimos
AFTER UPDATE
AS
BEGIN
    UPDATE 
		Livros
    SET 
		Disponibilidade = 1
    FROM 
		Livros JOIN inserted ON 
		Livros.LivroID = inserted.LivroID
    WHERE 
		inserted.DataDevolucao IS NOT NULL;
END;
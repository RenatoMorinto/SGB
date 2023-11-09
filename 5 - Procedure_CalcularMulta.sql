-- PROC calculo da multa do empréstimo
CREATE PROCEDURE CalcularMulta(@emprestimo_id INT)
AS
BEGIN
    DECLARE @multa_calculada DECIMAL(5, 2);

    SELECT @multa_calculada = DATEDIFF(DAY, DataEmprestimo, GETDATE()) * 0.5
    FROM Emprestimos
    WHERE EmprestimoID = @emprestimo_id;

    UPDATE Emprestimos
    SET Multa = @multa_calculada
    WHERE EmprestimoID = @emprestimo_id;
END;
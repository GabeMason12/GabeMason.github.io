CREATE TABLE EVIT (
    ProgramID INT AUTO_INCREMENT PRIMARY KEY,
    ProgramName VARCHAR(255) NOT NULL,
    CreditsPerSemester INT NOT NULL,
    CurrentFees DECIMAL(10, 2) NOT NULL,
    EndDate DATE
);

INSERT INTO EVIT (ProgramName, CreditsPerSemester, CurrentFees, EndDate)
VALUES
    ('Automotive Technology', 12, 1200.50, '2025-05-30'),
    ('Culinary Arts', 10, 1500.00, '2024-12-20'),
    ('Graphic Design', 9, 1100.75, '2025-08-15'),
    ('Welding Technology', 11, 1300.00, '2025-06-10'),
    ('Health Sciences', 15, 2000.00, '2024-11-30');




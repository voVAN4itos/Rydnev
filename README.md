# Курсовая работа: Разработка базы данных для театра

## Примеры типовых SQL-запросов

### 1. Получить спектакль с максимальной стоимостью билета

```
SELECT p.title AS Спектакль, MAX(t.price) AS Максимальная_цена_билета
FROM Performances p
JOIN Repertoire r ON p.performance_id = r.performance_id
JOIN Tickets t ON r.repertoire_id = t.repertoire_id
GROUP BY p.title
ORDER BY Максимальная_цена_билета DESC
LIMIT 1;
````
**Описание:**
Этот запрос выбирает спектакль с самой высокой ценой билета. Он объединяет таблицы `Performances` (спектакли), `Repertoire` (расписание спектаклей) и `Tickets` (билеты). Для каждого спектакля вычисляется максимальная цена билета, после чего выбирается спектакль с самой высокой стоимостью.

---

### 2. Получить список всех спектаклей с их жанрами и длительностью

```
SELECT title, genre, duration_minutes
FROM performances;
```

**Описание:**
Этот запрос выводит список всех спектаклей с указанием названия, жанра и продолжительности в минутах. Полезно для просмотра полного репертуара театра.

---

### 3. Получить расписание спектаклей в Большом зале на ближайшие даты

```
SELECT r.show_date, p.title, h.name AS hall_name
FROM repertoire r
JOIN performances p ON r.performance_id = p.performance_id
JOIN halls h ON r.hall_id = h.hall_id
WHERE h.name = 'Большой зал' AND r.show_date >= NOW()
ORDER BY r.show_date;
```

**Описание:**
Запрос показывает расписание всех спектаклей, которые пройдут в "Большом зале" начиная с текущего момента. Удобно для планирования посещения конкретного зала.

---

## Хранимые процедуры

### Процедура покупки билета

```
CREATE PROCEDURE BuyTicket(
    IN in_ticket_id INT,
    IN in_visitor_id INT,
    IN in_employee_id INT
)
BEGIN
    DECLARE ticket_exists INT DEFAULT 0;
    DECLARE already_sold BOOL DEFAULT FALSE;
    SELECT COUNT(*) INTO ticket_exists
    FROM Tickets
    WHERE ticket_id = in_ticket_id;

    IF ticket_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ошибка: Билет не существует!';
    ELSE
        SELECT is_sold INTO already_sold
        FROM Tickets
        WHERE ticket_id = in_ticket_id;

        IF already_sold THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ошибка: Билет уже продан!';
        ELSE
            INSERT INTO Sales (ticket_id, visitor_id, employee_id, sale_date)
            VALUES (in_ticket_id, in_visitor_id, in_employee_id, NOW());
        END IF;
    END IF;
END
```

**Описание:**
Процедура `BuyTicket` обрабатывает покупку билета. Она проверяет, существует ли билет и не продан ли он уже. Если всё в порядке, добавляет запись о продаже и помечает билет как проданный. В случае ошибки выдаёт информативное сообщение.

---

### Пример вызова процедуры покупки билета

```
CALL BuyTicket(1, 3, 2);
```

**Пояснение:**
Этот вызов означает, что посетитель с ID=3 покупает билет с ID=1, а сотрудник с ID=2 оформляет продажу.

---

## Триггеры

### Обновление статуса билета после продажи

```
DELIMITER $$
CREATE TRIGGER TicketStatus AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE Tickets
    SET is_sold = TRUE
    WHERE ticket_id = NEW.ticket_id;
END $$

DELIMITER ;

```

**Описание:**
Триггер автоматически обновляет статус билета в таблице `Tickets` после того, как в таблицу `Sales` добавлена новая запись о продаже. Это гарантирует целостность данных без необходимости ручного обновления.

---

## Представления (Views)

### Информация о сотрудниках с их должностями

```
CREATE OR REPLACE VIEW view_EmployeesDetails AS
SELECT
  employee_id,
  full_name AS name,
  position_id,
  hire_date,
  phone,
  email
FROM Employees;
```

**Описание:**
Представление `view_EmployeesDetails` упрощает получение основных сведений о сотрудниках, объединяя ключевые данные в одном удобном объекте.

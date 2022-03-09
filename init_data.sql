INSERT INTO client (username, email, password)
VALUES ('john', 'john@gmail.com', '96d9632f363564cc3032521409cf22a852f2032eec099ed5967c0d000cec607a'),
       ('anonymous', 'anonymous@anonymous.com', '1a64d447f7d144c6920e7b6bf6364d6d19074b8706529506c8252c8201e88061');

-- https://www.reddit.com/, https://9gag.com/
INSERT INTO website (url)
VALUES ('14830d0f42257f54aa3dbc91213a9a57837642a70d0987e8bb8f0677ecb5cc4b'),
       ('6e9334df52cba58324621e6ccdd1ce55c29a515ede4f7a78c21c65e649db7ec7');

INSERT INTO comment (comment_value, fk_client, fk_website)
VALUES ('Extremely useful website!', 1, 1),
       ('Fun website.', 2, 2);

INSERT INTO client_comment (fk_client, fk_comment)
VALUES (2, 1);

UPDATE comment
SET nr_likes = nr_likes + 1
WHERE id_comment = 1;

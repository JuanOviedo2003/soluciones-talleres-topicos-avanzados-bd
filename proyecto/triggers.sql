--DROP TRIGGER IF EXISTS insert_only_users ON Users;
SELECT user_id, email, ur."roleId" 
FROM users u
JOIN "_UserRole" ur 
ON ur."userId" = u.user_id;

UPDATE users
SET email='admin2@mail.com'
WHERE user_id=1

CREATE OR REPLACE FUNCTION func_modify_user() 
RETURNS trigger AS $$
BEGIN
  DELETE FROM "_UserRole" AS ur
  WHERE ur."userId" = NEW.user_id
    AND ur."roleId" = 1;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS insert_only_users ON users;
CREATE TRIGGER insert_only_users
AFTER UPDATE OF email ON users
FOR EACH ROW
WHEN (NEW.email IS DISTINCT FROM 'admin@example.com')
EXECUTE FUNCTION func_modify_user();


CREATE OR REPLACE FUNCTION func_userrole_only_admin_role()
RETURNS trigger AS $$
DECLARE
  v_email text;
BEGIN
  SELECT u.email INTO v_email
  FROM users u
  WHERE u.user_id = NEW."userId";
  
  IF NEW."roleId" = 1 AND v_email IS DISTINCT FROM 'admin@example.com' THEN
    RAISE EXCEPTION 'No se permite asignar roleId=1 a %, solo al admin.', v_email;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_userrole_only_admin_role ON "_UserRole";
CREATE TRIGGER trg_userrole_only_admin_role
BEFORE INSERT ON "_UserRole"
FOR EACH ROW
EXECUTE FUNCTION func_userrole_only_admin_role();

SELECT * FROM role;
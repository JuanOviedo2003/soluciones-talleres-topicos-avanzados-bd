CREATE TABLE IF NOT EXISTS users (
  user_id       SERIAL PRIMARY KEY,
  email         TEXT NOT NULL UNIQUE,
  name          TEXT NOT NULL,
  "lastName"    TEXT NOT NULL,
  password      TEXT NOT NULL,
  "createdAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  "updatedAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS role (
  role_id   SERIAL PRIMARY KEY,
  name      TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS address (
  address_id    SERIAL PRIMARY KEY,
  street        TEXT NOT NULL,
  city          TEXT NOT NULL,
  state         TEXT NOT NULL,
  zip           TEXT NOT NULL,
  "userId"      INTEGER UNIQUE,
  "createdAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  "updatedAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  CONSTRAINT address_user_fkey
    FOREIGN KEY ("userId") REFERENCES users(user_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS product (
  product_id    SERIAL PRIMARY KEY,
  name          TEXT NOT NULL,
  description   TEXT NOT NULL,
  price         NUMERIC(10,2) NOT NULL,
  "sellerId"    INTEGER NOT NULL,
  image         TEXT NOT NULL,
  quantity      NUMERIC(10,2) NOT NULL DEFAULT 1.00,
  "createdAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  "updatedAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  CONSTRAINT product_seller_fkey
    FOREIGN KEY ("sellerId") REFERENCES users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS category (
  category_id   SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS "order" (
  order_id      SERIAL PRIMARY KEY,
  "userId"      INTEGER NOT NULL,
  "totalPrice"  NUMERIC(10,2) NOT NULL,
  "createdAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  "updatedAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  CONSTRAINT order_user_fkey
    FOREIGN KEY ("userId") REFERENCES users(user_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS invoice (
  invoice_id    SERIAL PRIMARY KEY,
  "orderId"     INTEGER NOT NULL,
  "createdAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  "updatedAt"   TIMESTAMPTZ(3) NOT NULL DEFAULT NOW(),
  CONSTRAINT invoice_order_fkey
    FOREIGN KEY ("orderId") REFERENCES "order"(order_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- user <-> role
CREATE TABLE IF NOT EXISTS "_UserRole" (
  "userId" INTEGER NOT NULL,
  "roleId" INTEGER NOT NULL,
  PRIMARY KEY ("userId","roleId"),
  CONSTRAINT UR_user_fkey FOREIGN KEY ("userId") REFERENCES users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT UR_role_fkey FOREIGN KEY ("roleId") REFERENCES role(role_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- order <-> product
CREATE TABLE IF NOT EXISTS "_OrderProduct" (
  "orderId"   INTEGER NOT NULL,
  "productId" INTEGER NOT NULL,
  PRIMARY KEY ("orderId","productId"),
  CONSTRAINT OP_order_fkey FOREIGN KEY ("orderId") REFERENCES "order"(order_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT OP_product_fkey FOREIGN KEY ("productId") REFERENCES product(product_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- product <-> category
CREATE TABLE IF NOT EXISTS "_ProductCategory" (
  "productId"  INTEGER NOT NULL,
  "categoryId" INTEGER NOT NULL,
  PRIMARY KEY ("productId","categoryId"),
  CONSTRAINT PC_product_fkey FOREIGN KEY ("productId") REFERENCES product(product_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT PC_category_fkey FOREIGN KEY ("categoryId") REFERENCES category(category_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

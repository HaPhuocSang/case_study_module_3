create database if not exists phone_store character set utf8mb4 collate utf8mb4_unicode_ci;
use phone_store;
create table roles (
    id int auto_increment primary key,
    name varchar(50) not null unique
);
create table user_statuses (
    id int auto_increment primary key,
    name varchar(50) not null unique
);
create table users (
    id int auto_increment primary key,
    email varchar(100) not null unique,
    password varchar(255) not null,
    full_name varchar(100) not null,
    phone varchar(20),
    address varchar(255),
    role_id int not null,
    status_id int not null,
    created_at datetime default current_timestamp,
    last_login datetime null,
    foreign key (role_id) references roles(id),
    foreign key (status_id) references user_statuses(id)
);
create table categories (
    id int auto_increment primary key,
    name varchar(100) not null unique
);
create table product_statuses (
    id int auto_increment primary key,
    name varchar(50) not null unique
);
create table products (
    id int auto_increment primary key,
    category_id int not null,
    status_id int not null,
    name varchar(150) not null,
    price double not null,
    discount_price double null,
    quantity int not null default 0,
    description text,
    image varchar(255),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    foreign key (category_id) references categories(id),
    foreign key (status_id) references product_statuses(id)
);
create table order_statuses (
    id int auto_increment primary key,
    name varchar(50) not null unique 
);
create table orders (
    id int auto_increment primary key,
    user_id int not null,
    status_id int not null,
    receiver_name varchar(100) not null,
    receiver_phone varchar(20) not null,
    receiver_address varchar(255) not null, 
    description varchar(255),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    foreign key (user_id) references users(id) on delete cascade,
    foreign key (status_id) references order_statuses(id)
);
create table order_items (
    id int auto_increment primary key,
    order_id int not null,
    product_id int not null,
    product_name varchar(150) not null,
    price double not null,
    quantity int not null, 
    foreign key (order_id) references orders(id) on delete cascade,
	foreign key (product_id) references products(id)
);
create table payment_methods (
    id int auto_increment primary key,
    name varchar(50) not null unique
);
create table payment_statuses (
    id int auto_increment primary key,
    name varchar(50) not null unique
);
create table payments (
    id int auto_increment primary key,
    order_id int not null unique,
    payment_method_id int not null,
    payment_status_id int not null,
    transaction_code varchar(100),
    paid_at datetime null,
    foreign key (order_id) references orders(id) on delete cascade,
    foreign key (payment_method_id) references payment_methods(id),
    foreign key (payment_status_id) references payment_statuses(id)
);
create table messages (
    id int auto_increment primary key,
    sender_id int not null,
    receiver_id int not null,
    content text not null,
    is_read boolean default false,
    created_at datetime default current_timestamp,
    foreign key (sender_id) references users(id) on delete cascade,
	foreign key (receiver_id) references users(id) on delete cascade
);
insert into roles (name)
values
('admin'),
('user');
insert into user_statuses (name)
values
('active'),
('inactive'),
('locked');
insert into categories (name)
values
('iphone'),
('samsung'),
('xiaomi'),
('oppo');
insert into product_statuses (name)
values
('Đang bán'),
('Hết hàng'),
('Ẩn');
insert into order_statuses (name)
values
('pending'),
('confirmed'),
('shipping'),
('delivered'),
('cancelled');
insert into payment_methods (name)
values
('cod'),
('banking'),
('momo'),
('vnpay');
insert into payment_statuses (name)
values
('unpaid'),
('paid'),
('failed');

insert into users
(email, password, full_name, phone, address, role_id, status_id, created_at, last_login)
values
('admin@gmail.com', 'admin123', 'Nguyễn Văn Admin', '0901234567', 'Đà Nẵng', 1, 1, '2026-09-01 08:00:00', '2026-10-17 08:00:00'),
('user1@gmail.com', 'user123', 'Nguyễn Văn An', '0901111111', 'Đà Nẵng', 2, 1, '2026-09-05 09:00:00', '2026-10-16 20:00:00'),
('user2@gmail.com', 'user123', 'Trần Thị Bình', '0902222222', 'Hà Nội', 2, 1, '2026-09-10 10:00:00', '2026-10-15 19:00:00'),
('user3@gmail.com', 'user123', 'Lê Văn Cường', '0903333333', 'Hồ Chí Minh', 2, 1, '2026-06-01 08:00:00', '2026-07-01 08:00:00'),
('user4@gmail.com', 'user123', 'Phạm Thị Dung', '0904444444', 'Huế', 2, 3, '2026-08-01 08:00:00', null);
insert into products
(category_id, status_id, name, price, discount_price, quantity, description, image)
values
(1, 1, 'iPhone 17 Pro Max 256GB', 37990000, 35990000, 10, 'iPhone 17 Pro Max dung lượng 256GB, hàng chính hãng.', 'iphone-17-pro-max.png'),
(1, 1, 'iPhone 17 256GB', 24990000, 22990000, 15, 'iPhone 17 dung lượng 256GB, thiết kế hiện đại.', 'iphone-17.png'),
(1, 1, 'iPhone 16 Pro 128GB', 28990000, 25990000, 8, 'iPhone 16 Pro dung lượng 128GB.', 'iphone-16-pro.png'),
(1, 1, 'iPhone 15 128GB', 19990000, 16990000, 12, 'iPhone 15 dung lượng 128GB.', 'iphone-15.png'),

(2, 1, 'Samsung Galaxy S25 Ultra 256GB', 33990000, 30990000, 7, 'Samsung Galaxy S25 Ultra dung lượng 256GB.', 'samsung-s25-ultra.png'),
(2, 1, 'Samsung Galaxy S25 256GB', 22990000, 20990000, 10, 'Samsung Galaxy S25 dung lượng 256GB.', 'samsung-s25.png'),
(2, 1, 'Samsung Galaxy A56 5G', 10990000, 9990000, 20, 'Samsung Galaxy A56 hỗ trợ kết nối 5G.', 'samsung-a56.png'),
(2, 2, 'Samsung Galaxy A35 5G', 8490000, 7490000, 0, 'Samsung Galaxy A35 5G hiện đã hết hàng.', 'samsung-a35.png'),

(3, 1, 'Xiaomi 15 Ultra 512GB', 32990000, 29990000, 6, 'Xiaomi 15 Ultra dung lượng 512GB.', 'xiaomi-15-ultra.png'),
(3, 1, 'Xiaomi 15 256GB', 19990000, 17990000, 14, 'Xiaomi 15 dung lượng 256GB.', 'xiaomi-15.png'),
(3, 1, 'Redmi Note 14 Pro 5G', 9990000, 8990000, 18, 'Redmi Note 14 Pro hỗ trợ kết nối 5G.', 'redmi-note-14-pro.png'),

(4, 1, 'OPPO Find X8 Pro', 26990000, 24990000, 5, 'OPPO Find X8 Pro với hệ thống camera cao cấp.', 'oppo-find-x8-pro.png'),
(4, 1, 'OPPO Reno13 5G', 15990000, 13990000, 11, 'OPPO Reno13 hỗ trợ kết nối 5G.', 'oppo-reno13.png'),
(4, 3, 'OPPO A3x', 3990000, 3590000, 0, 'Sản phẩm hiện đang được ẩn khỏi danh sách bán hàng.', 'oppo-a3x.png');
insert into orders
(user_id, status_id, receiver_name, receiver_phone, receiver_address, description, created_at)
values
(2, 2, 'Nguyễn Văn An', '0901111111', '123 Nguyễn Văn Linh, Đà Nẵng', 'Giao hàng trong giờ hành chính.', '2026-10-10 09:30:00'),
(2, 1, 'Nguyễn Văn An', '0901111111', '123 Nguyễn Văn Linh, Đà Nẵng', 'Vui lòng gọi trước khi giao hàng.', '2026-10-17 10:00:00'),
(3, 3, 'Trần Thị Bình', '0902222222', '45 Cầu Giấy, Hà Nội', 'Giao hàng buổi chiều.', '2026-10-12 14:00:00'),
(3, 4, 'Trần Thị Bình', '0902222222', '45 Cầu Giấy, Hà Nội', 'Đơn hàng đã được giao thành công.', '2026-10-05 08:30:00'),
(4, 5, 'Lê Văn Cường', '0903333333', '78 Lê Lợi, Thành phố Hồ Chí Minh', 'Khách hàng đã hủy đơn hàng.', '2026-09-20 15:00:00');
insert into order_items
(order_id, product_id, product_name, price, quantity)
values
(1, 1, 'iPhone 17 Pro Max 256GB', 35990000, 1),
(2, 10, 'Xiaomi 15 256GB', 17990000, 1),
(3, 6, 'Samsung Galaxy S25 256GB', 20990000, 1),
(4, 11, 'Redmi Note 14 Pro 5G', 8990000, 1),
(5, 4, 'iPhone 15 128GB', 16990000, 1);
insert into payments
(order_id, payment_method_id, payment_status_id, transaction_code, paid_at)
values
(1, 1, 2, 'COD001', '2026-10-11 14:00:00'),
(2, 2, 1, null, null),
(3, 3, 2, 'MOMO003', '2026-10-12 14:30:00'),
(4, 4, 2, 'VNPAY004', '2026-10-05 09:00:00'),
(5, 1, 1, null, null);
insert into messages
(sender_id, receiver_id, content, is_read, created_at)
values
(2, 1, 'Xin chào, tôi muốn hỏi về chính sách bảo hành iPhone.', false, '2026-10-15 09:00:00'),
(1, 2, 'Chào bạn, sản phẩm được bảo hành theo chính sách của cửa hàng.', true, '2026-10-15 09:10:00'),
(3, 1, 'Đơn hàng của tôi đang ở trạng thái nào?', false, '2026-10-16 10:30:00'),
(1, 3, 'Đơn hàng của bạn đang được vận chuyển.', false, '2026-10-16 10:45:00');
insert into orders (user_id, status_id, receiver_name, receiver_phone, receiver_address, description)
values
(2, 1, 'Nguyễn Văn An', '0901111111', '123 Nguyễn Văn Linh, Đà Nẵng', 'Đơn hàng gồm 3 sản phẩm');
insert into order_items
(order_id, product_id, product_name, price, quantity)
values
(6, 1, 'iPhone 17 Pro Max 256GB', 35990000, 1),
(6, 5, 'Samsung Galaxy S25 Ultra 256GB', 30990000, 1),
(6, 10, 'Xiaomi 15 256GB', 17990000, 2);
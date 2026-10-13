create database if not exists phone_store character set utf8mb4 collate utf8mb4_unicode_ci;
use phone_store;
create table roles (
    id int auto_increment primary key,
    name varchar(50) not null unique,
    description varchar(255)
);
create table user_statuses (
    id int auto_increment primary key,
    name varchar(50) not null unique,
    description varchar(255)
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
    name varchar(100) not null unique,
    description varchar(255),
    created_at datetime default current_timestamp
);
create table product_statuses (
    id int auto_increment primary key,
    name varchar(50) not null unique,
    description varchar(255)
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
    name varchar(50) not null unique,
    description varchar(255)
);
create table orders (
    id int auto_increment primary key,
    user_id int not null,
    status_id int not null,
    receiver_name varchar(100) not null,
    receiver_phone varchar(20) not null,
    receiver_address varchar(255) not null,
    total_amount double not null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    foreign key (user_id) references users(id),
    foreign key (status_id) references order_statuses(id)
);
create table order_items (
    id int auto_increment primary key,
    order_id int not null,
    product_id int not null,
    product_name varchar(150) not null,
    price double not null,
    quantity int not null,
    subtotal double generated always as (price * quantity) stored,
    foreign key (order_id) references orders(id) on delete cascade,
	foreign key (product_id) references products(id)
);
create table payment_methods (
    id int auto_increment primary key,
    name varchar(50) not null unique,
    description varchar(255)
);
create table payment_statuses (
    id int auto_increment primary key,
    name varchar(50) not null unique,
    description varchar(255)
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
    foreign key (sender_id) references users(id),
    foreign key (receiver_id) references users(id)
);
insert into roles (name, description)
values
('admin', 'quản trị hệ thống'),
('user', 'người dùng');
insert into user_statuses (name, description)
values
('active', 'tài khoản đang hoạt động'),
('inactive', 'tài khoản không hoạt động'),
('locked', 'tài khoản bị khóa');
insert into categories (name, description)
values
('iphone', 'điện thoại apple'),
('samsung', 'điện thoại samsung'),
('xiaomi', 'điện thoại xiaomi'),
('oppo', 'điện thoại oppo');
insert into product_statuses (name, description)
values
('available', 'đang bán'),
('out_of_stock', 'hết hàng'),
('hidden', 'đang ẩn');
insert into order_statuses (name, description)
values
('pending', 'chờ duyệt'),
('confirmed', 'đã xác nhận'),
('shipping', 'đang giao hàng'),
('delivered', 'đã giao hàng'),
('cancelled', 'đã hủy');
insert into payment_methods (name, description)
values
('cod', 'thanh toán khi nhận hàng'),
('banking', 'chuyển khoản ngân hàng'),
('momo', 'thanh toán qua momo'),
('vnpay', 'thanh toán qua vnpay');
insert into payment_statuses (name, description)
values
('unpaid', 'chưa thanh toán'),
('paid', 'đã thanh toán'),
('failed', 'thanh toán thất bại');

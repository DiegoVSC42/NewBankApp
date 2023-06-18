create table if not exists Users(
	Id serial primary key,
	FirstName varchar(255) not null,
	LastName varchar(255) not null,
	Cpf varchar(13) unique not null,
	Email varchar(255) not null,
	Phone varchar(11) not null,
	PasswordHash bytea not null,
	PasswordSalt bytea not null,
	UserToken text not null,
	Balance numeric (20,2) not null
);

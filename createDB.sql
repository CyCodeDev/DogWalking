--create type AccountStatusValues as enum ('Open', 'Closed', 'Suspended', 'Inactive', 'Verified', 'Pending'),


create table OwnerAccounts (
	Id Int not null,
	Username varchar(25) not null,
	EmailAddress varchar(50) not null,
	Status varchar(25) not null check (Status in ('Open', 'Closed', 'Suspended', 'Inactive', 'Verified', 'Pending') ),
	CreateTimestamp Timestamp not null,
	UpdateTimestamp Timestamp,
	LastLoginTimestamp Timestamp,
	OwnerRating float8,
	AppRating Int,
	primary key (Id)

);


create table WalkerAccounts (
	Id Int not null,
	Username varchar(25) not null,
	EmailAddress varchar(50) not null,
	DogPreference varchar(10) not null,
	Status varchar(25) not null check (Status in ('Open', 'Closed', 'Suspended', 'Inactive', 'Verified', 'Pending') ),
	CreateTimestamp Timestamp not null,
	UpdateTimestamp Timestamp,
	LastLoginTimestamp Timestamp,
	WalkerRating float8,
	AppRating Int,
	primary key (Id)
);

create table DogsRegistered (
	Id Int not null,
	DogName varchar(25) not null,
	Breed varchar(50) not null,
	Mixed varchar(25) not null,
	Size varchar(25) not null check (Size in ('Small', 'Medium', 'Large', 'No Preference')),
	SizeRating Int not null check (SizeRating in (1, 2, 3)),
	Weight Int check (Weight < 300),
	Units varchar(10) not null check (Units in ('Lbs', 'Kg')),
	Rating float8,
	ObedienceRating Int,
	SocialRating Int,
	InstagramId varchar(50),
	FacebookId varchar(50),
	primary key (Id)
);

create table OwnerAccountsToDogs (
	Id Int not null,
	OwnerAccountId Int not null,
	OwnerAccountUsername varchar(25) not null,
	DogId Int not null,
	DogName varchar(25) not null,
	primary key (Id),
	foreign key (OwnerAccountId) references OwnerAccounts (Id),
	foreign key (DogId) references DogsRegistered(Id)
);

create table DogWalksLog (
	Id Int not null,
	OwnerAccountId Int not null,
	OwnerUsername varchar(25) not null,
	DogId Int not null,
	DogName varchar(25) not null,
	WalkerAccountId Int not null,
	WalkerUsername varchar(25) not null,
	DurationSeconds Int,
	FromNeighborhood varchar(25),
	FromLocationId Int,
	ToLocationId Int,
	WalkStartTimestamp Timestamp,
	WalkStopTimestamp Timestamp,
	Distance float8,
	DistanceUnits varchar(10),
	WalkerRating float8,
	DogRating float8,
	OwnerRating float8,
	WalkerComments varchar(250),
	OwnerComments varchar(250),
	primary key (Id),
	foreign key (OwnerAccountId) references OwnerAccounts (Id),
	foreign key (DogId) references DogsRegistered(Id),
	foreign key (WalkerAccountId) references WalkerAccounts(Id)
)

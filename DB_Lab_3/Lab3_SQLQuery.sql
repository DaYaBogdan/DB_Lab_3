Create Table users(
	userId INT NOT NULL,
	userName VARCHAR(16) NOT NULL,
	userPassword VARCHAR(16) NOT NULL, 
	email VARCHAR(16) NOT NULL,
	registrationDate date NOT NULL,

	CONSTRAINT USERSUNIQUE UNIQUE(username, email),

	CONSTRAINT USERSPRIMARY PRIMARY KEY(userId)
)

Create Table languages(
	languageId INT NOT NULL,
	languageName VARCHAR(16) NOT NULL,
	languageCode INT NOT NULL,

	CONSTRAINT LANGUAGESUNIQUE UNIQUE(languageName, languageCode),

	CONSTRAINT LANGUAGESPRIMARY PRIMARY KEY(languageId)
)

Create Table userLanguages(
	languageId INT NOT NULL,
	userId INT NOT NULL,
	learningStartDate date NOT NULL,
	proficiencyLevel VARCHAR(4),

	CONSTRAINT USERLANGUAGEPRIMARY PRIMARY KEY(languageId, userId),

	CONSTRAINT USERLANGUAGESFOREIGN 
	FOREIGN KEY(languageId) REFERENCES languages(languageId),
	FOREIGN KEY(userId) REFERENCES users(userId)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
)

Create Table lessons(
	lessonId INT NOT NULL,
	languageId INT NOT NULL,
	lessonName VARCHAR(16) NOT NULL,
	lessonDescription VARCHAR(32),
	difficultyLevel INT,

	CONSTRAINT LESSONSPRIMARY PRIMARY KEY(lessonId),

	CONSTRAINT LESSONSFOREIGN 
	FOREIGN KEY(languageId) REFERENCES languages(languageId)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
)

Create Table exercises(
	exerciseId INT NOT NULL,
	lessonId INT NOT NULL,
	exerciseType VARCHAR(16),
	instructions VARCHAR(16) NOT NULL,
	correctAnswer VARCHAR(16) NOT NULL,
	points INT

	CONSTRAINT EXERCISESPRIMARY PRIMARY KEY(exerciseId),
	
	CONSTRAINT EXERCISESFOREIGN 
	FOREIGN KEY(lessonId) REFERENCES lessons(lessonId)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
)

Create Table userExerciseResults(
	userId INT NOT NULL,
	exerciseId INT NOT NULL,
	resultDate date NOT NULL,
	userAnswer VARCHAR(16),
	isCorrect Binary NOT NULL,
	score INT NOT NULL,

	CONSTRAINT USEREXERCISERESULTSPRIMARY PRIMARY KEY(userId, exerciseId, resultDate),
	
	CONSTRAINT USEREXERCISERESULTSFOREIGN 
	FOREIGN KEY(userId) REFERENCES users(userId),
	FOREIGN KEY(exerciseId) REFERENCES exercises(exerciseId)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
);

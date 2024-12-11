
/*******************************************************************************
   MovieRatings Database - Version 1
   Script: MovieRatings_MySql.sql
   Description: Creates and populates the MovieRatings database.
   DB Server: MySql
   Author: Alexandra Arbia, Andrew Janedy
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `movie_ratings`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `movie_ratings`;


USE `movie_ratings`;


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE 'production_company'
(
    'production_company_id' INT NOT NULL,
    'company_name' VARCHAR(255) UNIQUE NOT NULL,
    'year_founded' INT, 
    'headquarters_country' VARCHAR(255), 
    'headquarters_city' VARCHAR(255),
    CONSTRAINT `PK_production_company` PRIMARY KEY  (`production_company_id`)
);

CREATE TABLE `movie`
(
    'movie_id' INT NOT NULL, 
    'title' VARCHAR(255) NOT NULL, 
    'release_year' INT, 
    'director_name' VARCHAR(255), 
    'production_company_id' INT, 
    CONSTRAINT `PK_movie` PRIMARY KEY  (`movie_id`)
);

CREATE TABLE `cast`
(
    'cast_id' INT NOT NULL AUTO_INCREMENT,
    'movie_id' INT,
    'actor_name' VARCHAR(255), 
    'character_name' VARCHAR(255),
    CONSTRAINT `PK_cast` PRIMARY KEY  (`cast_id`)
);

CREATE TABLE `ratings`
(
    `rating_id` INT NOT NULL AUTO_INCREMENT,
    `movie_id` INT,
    'source' VARCHAR(255),
    'rating' VARCHAR(255),
    'top_25_rank' DECIMAL(4, 1),
    CONSTRAINT `PK_ratings` PRIMARY KEY  (`rating_id`)
);

CREATE TABLE 'website'
(
    'movie_id' INT,
    'imdb_url' VARCHAR(255),
    'metacritic_url' VARCHAR(255),
    'rotten_tomatoes_url' VARCHAR(255),
    'wikipedia_url' VARCHAR(255),
    CONSTRAINT `PK_website` PRIMARY KEY  (`movie_id`)
);



/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE `movie` ADD CONSTRAINT `FK_production_company_id`
    FOREIGN KEY ('production_company_id') REFERENCES `production_company` (`production_company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_movie_production_company_id` ON `moive` (`production_company_id`);

ALTER TABLE `cast` ADD CONSTRAINT 'unique_cast' 
    UNIQUE ('movie_id', 'actor_name', 'character_name');

ALTER TABLE `cast` ADD CONSTRAINT `FK_movie_id`
    FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE INDEX `IFK_cast_movie_id` ON `cast` (`movie_id`);

ALTER TABLE 'ratings' ADD CONSTRAINT 'unique_rating'
    UNIQUE ('movie_id', 'source');

ALTER TABLE 'ratings' ADD CONSTRAINT 'FK_movie_id'
    FOREIGN KEY ('movie_id') REFERENCES 'ratings' (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE INDEX `IFK_rating_movie_id` ON `ratings` (`movie_id`);

ALTER TABLE 'website' ADD CONSTRAINT 'FK_movie_id'
    FOREIGN KEY ('movie_id') REFERENCES 'movie' (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE INDEX `IFK_website_movie_id` ON `website` (`movie_id`);


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (63545791, 'https://www.imdb.com/title/tt0102926/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_silence%2520of%2520the%2520lambs', 'https://www.metacritic.com/movie/the-silence-of-the-lambs/', 'https://www.rottentomatoes.com/m/silence_of_the_lambs', 'https://en.wikipedia.org/wiki/The_Silence_of_the_Lambs_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (78809918, 'https://www.imdb.com/title/tt0080684/?ref_=nv_sr_srsg_9_tt_7_nm_0_in_0_q_star%2520wars%2520ep', 'https://www.metacritic.com/movie/star-wars-episode-v---the-empire-strikes-back/', 'https://www.rottentomatoes.com/m/star_wars_episode_v_the_empire_strikes_back', 'https://en.wikipedia.org/wiki/The_Empire_Strikes_Back');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (79863599, 'https://www.imdb.com/title/tt0266543/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_finding%2520nemo', 'https://www.metacritic.com/movie/finding-nemo/', 'https://www.rottentomatoes.com/m/finding_nemo', 'https://en.wikipedia.org/wiki/Finding_Nemo');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (251907923, 'https://www.imdb.com/title/tt6751668/?ref_=nv_sr_srsg_3_tt_2_nm_6_in_0_q_paras', 'https://www.metacritic.com/movie/parasite/', 'https://www.rottentomatoes.com/m/parasite_2019', 'https://en.wikipedia.org/wiki/Parasite_(2019_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (263148316, 'https://www.imdb.com/title/tt0111495/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_three%2520colors%2520re', 'https://www.metacritic.com/movie/three-colors-red/', 'https://www.rottentomatoes.com/m/three_colors_red', 'https://en.wikipedia.org/wiki/Three_Colours:_Red');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (283477760, 'https://www.imdb.com/title/tt0110912/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_pulp%2520fic', 'https://www.metacritic.com/movie/pulp-fiction/', 'https://www.rottentomatoes.com/m/pulp_fiction', 'https://en.wikipedia.org/wiki/Pulp_Fiction');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (304861570, 'https://www.imdb.com/title/tt0245429/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_spirite', 'https://www.metacritic.com/movie/spirited-away/', 'https://www.rottentomatoes.com/m/spirited_away', 'https://en.wikipedia.org/wiki/Spirited_Away');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (326674215, 'https://www.imdb.com/title/tt0052311/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_touch%2520of%2520e', 'https://www.metacritic.com/movie/touch-of-evil/', 'https://www.rottentomatoes.com/m/touch_of_evil', 'https://en.wikipedia.org/wiki/Touch_of_Evil');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (336048821, 'https://www.imdb.com/title/tt0006864/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_intolerance', 'https://www.metacritic.com/movie/intolerance/', 'https://www.rottentomatoes.com/m/1010644-intolerance', 'https://en.wikipedia.org/wiki/Intolerance_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (348536626, 'https://www.imdb.com/title/tt0058946/?ref_=nv_sr_srsg_4_tt_8_nm_0_in_0_q_the%2520battle%2520of', 'https://www.metacritic.com/movie/the-battle-of-algiers/', 'https://www.rottentomatoes.com/m/the_battle_of_algiers', 'https://en.wikipedia.org/wiki/The_Battle_of_Algiers');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (392316929, 'https://www.imdb.com/title/tt0119488/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_la%2520con', 'https://www.metacritic.com/movie/la-confidential/', 'https://www.rottentomatoes.com/m/la_confidential', 'https://en.wikipedia.org/wiki/L.A._Confidential_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (401123580, 'https://www.imdb.com/title/tt0031885/?ref_=nv_sr_srsg_3_tt_3_nm_5_in_0_q_the%2520rules%2520of%2520the', 'https://www.metacritic.com/movie/the-rules-of-the-game/', 'https://www.rottentomatoes.com/m/the_rules_of_the_game', 'https://en.wikipedia.org/wiki/The_Rules_of_the_Game');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (407910799, 'https://www.imdb.com/title/tt0064040/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_army%2520of%2520sha', 'https://www.metacritic.com/movie/army-of-shadows/', 'https://www.rottentomatoes.com/m/army_of_shadows', 'https://en.wikipedia.org/wiki/Army_of_Shadows');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (417657983, 'https://www.imdb.com/title/tt0111161/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_shawshan', 'https://www.metacritic.com/movie/the-shawshank-redemption/', 'https://www.rottentomatoes.com/m/shawshank_redemption', 'https://en.wikipedia.org/wiki/The_Shawshank_Redemption');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (424396053, 'https://www.imdb.com/title/tt0052357/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_vertigo', 'https://www.metacritic.com/movie/vertigo-1958/', 'https://www.rottentomatoes.com/m/vertigo', 'https://en.wikipedia.org/wiki/Vertigo_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (424735752, 'https://www.imdb.com/title/tt0021749/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_city%2520lights', 'https://www.metacritic.com/movie/city-lights/', 'https://www.rottentomatoes.com/m/city_lights', 'https://en.wikipedia.org/wiki/City_Lights');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (460482582, 'https://www.imdb.com/title/tt1895587/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_spotlight', 'https://www.metacritic.com/movie/spotlight/', 'https://www.rottentomatoes.com/m/spotlight_2015', 'https://en.wikipedia.org/wiki/Spotlight_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (503062450, 'https://www.imdb.com/title/tt0114369/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_seven', 'https://www.metacritic.com/movie/seven/', 'https://www.rottentomatoes.com/m/seven', 'https://en.wikipedia.org/wiki/Seven_(1995_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (530844038, 'https://www.imdb.com/title/tt0167261/?ref_=nv_sr_srsg_8_tt_8_nm_0_in_0_q_the%2520lord%2520of%2520the', 'https://www.metacritic.com/movie/the-lord-of-the-rings-the-two-towers/', 'https://www.rottentomatoes.com/m/the_lord_of_the_rings_the_two_towers', 'https://en.wikipedia.org/wiki/The_Lord_of_the_Rings:_The_Two_Towers');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (559276553, 'https://www.imdb.com/title/tt4633694/?ref_=nv_sr_srsg_5_tt_8_nm_0_in_0_q_spiderman%2520into', 'https://www.metacritic.com/movie/spider-man-into-the-spider-verse/', 'https://www.rottentomatoes.com/m/spider_man_into_the_spider_verse', 'https://en.wikipedia.org/wiki/Spider-Man:_Into_the_Spider-Verse');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (598288868, 'https://www.imdb.com/title/tt0065214/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_the%2520wild%2520b', 'https://www.metacritic.com/movie/the-wild-bunch/', 'https://www.rottentomatoes.com/m/1059489-wild_bunch', 'https://en.wikipedia.org/wiki/The_Wild_Bunch');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (621794419, 'https://www.imdb.com/title/tt0120363/?ref_=nv_sr_srsg_9_tt_7_nm_0_in_0_q_toy%2520sto', 'https://www.metacritic.com/movie/toy-story-2/', 'https://www.rottentomatoes.com/m/toy_story_2', 'https://en.wikipedia.org/wiki/Toy_Story_2');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (755957868, 'https://www.imdb.com/title/tt0083922/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_fanny%2520an', 'https://www.metacritic.com/movie/fanny-and-alexander-re-release/', 'https://www.rottentomatoes.com/m/fanny_and_alexander', 'https://en.wikipedia.org/wiki/Fanny_and_Alexander');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (806225442, 'https://www.imdb.com/title/tt0050083/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_12%2520angry', 'https://www.metacritic.com/movie/12-angry-men/', 'https://www.rottentomatoes.com/m/1000013_12_angry_men', 'https://en.wikipedia.org/wiki/12_Angry_Men_(1957_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (851421447, 'https://www.imdb.com/title/tt0034583/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_casabl', 'https://www.metacritic.com/movie/casablanca/', 'https://www.rottentomatoes.com/m/1003707-casablanca', 'https://en.wikipedia.org/wiki/Casablanca_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (855889485, 'https://www.imdb.com/title/tt0099685/?ref_=nv_sr_srsg_0_tt_4_nm_4_in_0_q_goodf', 'https://www.metacritic.com/movie/goodfellas/', 'https://www.rottentomatoes.com/m/1032176-goodfellas', 'https://en.wikipedia.org/wiki/Goodfellas');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (870673075, 'https://www.imdb.com/title/tt0047396/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_rear', 'https://www.metacritic.com/movie/rear-window/', 'https://www.rottentomatoes.com/m/1017289-rear_window', 'https://en.wikipedia.org/wiki/Rear_Window');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (888705962, 'https://www.imdb.com/title/tt0033467/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_citi', 'https://www.metacritic.com/movie/citizen-kane-1941/', 'https://www.rottentomatoes.com/m/citizen_kane', 'https://en.wikipedia.org/wiki/Citizen_Kane');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (893597994, 'https://www.imdb.com/title/tt0045152/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_singin%2520in%2520the%2520rain', 'https://www.metacritic.com/movie/singin-in-the-rain/', 'https://www.rottentomatoes.com/m/singin_in_the_rain', 'https://en.wikipedia.org/wiki/Singin%27_in_the_Rain');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (894020390, 'https://www.imdb.com/title/tt0047478/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_seven%2520sa', 'https://www.metacritic.com/movie/seven-samurai-1954/', 'https://www.rottentomatoes.com/m/seven_samurai_1956', 'https://en.wikipedia.org/wiki/Seven_Samurai');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (896862764, 'https://www.imdb.com/title/tt0068646/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_the%2520go', 'https://www.metacritic.com/movie/the-godfather/', 'https://www.rottentomatoes.com/m/the_godfather', 'https://en.wikipedia.org/wiki/The_Godfather');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (987302716, 'https://www.imdb.com/title/tt0038787/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_notorio', 'https://www.metacritic.com/movie/notorious-1946/', 'https://www.rottentomatoes.com/m/1015287-notorious', 'https://en.wikipedia.org/wiki/Notorious_(1946_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1018157845, 'https://www.imdb.com/title/tt0073486/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_one%2520flew%2520', 'https://www.metacritic.com/movie/one-flew-over-the-cuckoos-nest/', 'https://www.rottentomatoes.com/m/one_flew_over_the_cuckoos_nest', 'https://en.wikipedia.org/wiki/One_Flew_Over_the_Cuckoo%27s_Nest_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1024068360, 'https://www.imdb.com/title/tt4975722/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_moonli', 'https://www.metacritic.com/movie/moonlight-2016/', 'https://www.rottentomatoes.com/m/moonlight_2016', 'https://en.wikipedia.org/wiki/Moonlight_(2016_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1127715346, 'https://www.imdb.com/title/tt0468569/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_the%2520dar', 'https://www.metacritic.com/movie/the-dark-knight/', 'https://www.rottentomatoes.com/m/the_dark_knight', 'https://en.wikipedia.org/wiki/The_Dark_Knight');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1154659227, 'https://www.imdb.com/title/tt0042192/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_all%2520about%2520eve', 'https://www.metacritic.com/movie/all-about-eve/', 'https://www.rottentomatoes.com/m/1000626-all_about_eve', 'https://en.wikipedia.org/wiki/All_About_Eve');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1232541097, 'https://www.imdb.com/title/tt1065073/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_boyhood', 'https://www.metacritic.com/movie/boyhood/', 'https://www.rottentomatoes.com/m/boyhood', 'https://en.wikipedia.org/wiki/Boyhood_(2014_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1249678210, 'https://www.imdb.com/title/tt0120815/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_saving', 'https://www.metacritic.com/movie/saving-private-ryan/', 'https://www.rottentomatoes.com/m/saving_private_ryan', 'https://en.wikipedia.org/wiki/Saving_Private_Ryan');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1257495259, 'https://www.imdb.com/title/tt0071562/?ref_=nv_sr_srsg_3_tt_8_nm_0_in_0_q_the%2520god', 'https://www.metacritic.com/movie/the-godfather-part-ii/', 'https://www.rottentomatoes.com/m/godfather_part_ii', 'https://en.wikipedia.org/wiki/The_Godfather_Part_II');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1265595906, 'https://www.imdb.com/title/tt0046438/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_tokyo%2520sto', 'https://www.metacritic.com/movie/tokyo-story/', 'https://www.rottentomatoes.com/m/tokyo_story', 'https://en.wikipedia.org/wiki/Tokyo_Story');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1278412978, 'https://www.imdb.com/title/tt0137523/?ref_=nv_sr_srsg_1_tt_7_nm_0_in_0_q_fight%2520club', 'https://www.metacritic.com/movie/fight-club/', 'https://www.rottentomatoes.com/m/fight_club', 'https://en.wikipedia.org/wiki/Fight_Club');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1301349790, 'https://www.imdb.com/title/tt0108052/?ref_=nv_sr_srsg_0_tt_5_nm_3_in_0_q_schind', 'https://www.metacritic.com/movie/schindlers-list/', 'https://www.rottentomatoes.com/m/schindlers_list', 'https://en.wikipedia.org/wiki/Schindler%27s_List');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1322007046, 'https://www.imdb.com/title/tt0816692/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_inters', 'https://www.metacritic.com/movie/interstellar/', 'https://www.rottentomatoes.com/m/interstellar_2014', 'https://en.wikipedia.org/wiki/Interstellar_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1346231625, 'https://www.imdb.com/title/tt0120689/?ref_=nv_sr_srsg_1_tt_7_nm_0_in_0_q_the%2520gree', 'https://www.metacritic.com/movie/the-green-mile/', 'https://www.rottentomatoes.com/m/green_mile', 'https://en.wikipedia.org/wiki/The_Green_Mile_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1348419192, 'https://www.imdb.com/title/tt0032910/?ref_=nv_sr_srsg_6_tt_8_nm_0_in_0_q_pinocch', 'https://www.metacritic.com/movie/pinocchio-1940/', 'https://www.rottentomatoes.com/m/pinocchio_1940', 'https://en.wikipedia.org/wiki/Pinocchio_(1940_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1371031223, 'https://www.imdb.com/title/tt0109830/?ref_=nv_sr_srsg_0_tt_1_nm_7_in_0_q_forre', 'https://www.metacritic.com/movie/forrest-gump/', 'https://www.rottentomatoes.com/m/forrest_gump', 'https://en.wikipedia.org/wiki/Forrest_Gump');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1384189524, 'https://www.imdb.com/title/tt0065571/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_the%2520conformist', 'https://www.metacritic.com/movie/the-conformist-re-release/', 'https://www.rottentomatoes.com/m/the_conformist', 'https://en.wikipedia.org/wiki/The_Conformist_(1970_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1391240742, 'https://www.imdb.com/title/tt1375666/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_inception', 'https://www.metacritic.com/movie/inception/', 'https://www.rottentomatoes.com/m/inception', 'https://en.wikipedia.org/wiki/Inception');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1406772068, 'https://www.imdb.com/title/tt9362722/?ref_=nv_sr_srsg_3_tt_8_nm_0_in_0_q_spiderman%2520acr', 'https://www.metacritic.com/movie/spider-man-across-the-spider-verse/', 'https://www.rottentomatoes.com/m/spider_man_across_the_spider_verse', 'https://en.wikipedia.org/wiki/Spider-Man:_Across_the_Spider-Verse');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1440730664, 'https://www.imdb.com/title/tt0133093/?ref_=nv_sr_srsg_1_tt_7_nm_0_in_0_q_the%2520mat', 'https://www.metacritic.com/movie/the-matrix/', 'https://www.rottentomatoes.com/m/matrix', 'https://en.wikipedia.org/wiki/The_Matrix');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1458767573, 'https://www.imdb.com/title/tt0092337/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_dekalo', 'https://www.metacritic.com/movie/dekalog-1988/', NULL, 'https://en.wikipedia.org/wiki/Dekalog');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1520277541, 'https://www.imdb.com/title/tt1745960/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_top%2520gun%2520ma', 'https://www.metacritic.com/movie/top-gun-maverick/', 'https://www.rottentomatoes.com/m/top_gun_maverick', 'https://en.wikipedia.org/wiki/Top_Gun:_Maverick');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1579164841, 'https://www.imdb.com/title/tt0047296/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_on%2520the%2520wat', 'https://www.metacritic.com/movie/on-the-waterfront/', 'https://www.rottentomatoes.com/m/on_the_waterfront', 'https://en.wikipedia.org/wiki/On_the_Waterfront');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1599220560, 'https://www.imdb.com/title/tt26743210/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_how%2520to%2520train', 'https://www.metacritic.com/movie/how-to-train-your-dragon/', 'https://www.rottentomatoes.com/m/how_to_train_your_dragon', 'https://en.wikipedia.org/wiki/How_to_Train_Your_Dragon_(2010_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1604333879, 'https://www.imdb.com/title/tt0114709/?ref_=nv_sr_srsg_1_tt_7_nm_0_in_0_q_toy%2520sto', 'https://www.metacritic.com/movie/toy-story/', 'https://www.rottentomatoes.com/m/toy_story', 'https://en.wikipedia.org/wiki/Toy_Story');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1615377061, 'https://www.imdb.com/title/tt0062136/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_playtime', 'https://www.metacritic.com/movie/playtime/', 'https://www.rottentomatoes.com/m/playtime', 'https://en.wikipedia.org/wiki/Playtime');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1645878938, 'https://www.imdb.com/title/tt0120737/?ref_=nv_sr_srsg_3_tt_8_nm_0_in_0_q_lord%2520of%2520th', 'https://www.metacritic.com/movie/the-lord-of-the-rings-the-fellowship-of-the-ring/', 'https://www.rottentomatoes.com/m/the_lord_of_the_rings_the_fellowship_of_the_ring', 'https://en.wikipedia.org/wiki/The_Lord_of_the_Rings:_The_Fellowship_of_the_Ring');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1756517886, 'https://www.imdb.com/title/tt1049413/?ref_=fn_al_tt_1', 'https://www.metacritic.com/movie/up/', 'https://www.rottentomatoes.com/m/up', 'https://en.wikipedia.org/wiki/Up_(2009_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1764633906, 'https://www.imdb.com/title/tt0071315/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_chinat', 'https://www.metacritic.com/movie/chinatown/', 'https://www.rottentomatoes.com/m/chinatown', 'https://en.wikipedia.org/wiki/Chinatown_(1974_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1793535987, 'https://www.imdb.com/title/tt0167260/?ref_=nv_sr_srsg_7_tt_7_nm_1_in_0_q_lord', 'https://www.metacritic.com/movie/the-lord-of-the-rings-the-return-of-the-king/', 'https://www.rottentomatoes.com/m/the_lord_of_the_rings_the_return_of_the_king', 'https://en.wikipedia.org/wiki/The_Lord_of_the_Rings:_The_Return_of_the_King');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1822561486, 'https://www.imdb.com/title/tt0056172/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_lawrence%2520of%2520', 'https://www.metacritic.com/movie/lawrence-of-arabia-re-release/', 'https://www.rottentomatoes.com/m/lawrence_of_arabia', 'https://en.wikipedia.org/wiki/Lawrence_of_Arabia_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1848618840, 'https://www.imdb.com/title/tt23849204/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_12th%2520fa', NULL, 'https://www.rottentomatoes.com/m/12th_fail', 'https://en.wikipedia.org/wiki/12th_Fail');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1904087280, 'https://www.imdb.com/title/tt0027977/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_modern%2520times', 'https://www.metacritic.com/movie/modern-times-re-release/', 'https://www.rottentomatoes.com/m/modern_times', 'https://en.wikipedia.org/wiki/Modern_Times_(film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (1919595503, 'https://www.imdb.com/title/tt0057091/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_the%2520leopard', 'https://www.metacritic.com/movie/the-leopard-re-release/', 'https://www.rottentomatoes.com/m/the_leopard_1963', 'https://en.wikipedia.org/wiki/The_Leopard_(1963_film)');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (2057653367, 'https://www.imdb.com/title/tt0060196/?ref_=nv_sr_srsg_0_tt_4_nm_4_in_0_q_the%2520good%2520the%2520b', 'https://www.metacritic.com/movie/the-good-the-bad-and-the-ugly/', 'https://www.rottentomatoes.com/m/the_good_the_bad_and_the_ugly', 'https://en.wikipedia.org/wiki/The_Good');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (2084554881, 'https://www.imdb.com/title/tt0041959/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_the%2520third%2520man', 'https://www.metacritic.com/movie/the-third-man/', 'https://www.rottentomatoes.com/m/the_third_man', 'https://en.wikipedia.org/wiki/The_Third_Man');
INSERT INTO `website` (`movie_id`, `imdb_url`, `metacritic_url`, `rotten_tomatoes_url`, `wikipedia_url`) VALUES (2097654371, 'https://www.imdb.com/title/tt0032904/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_the%2520philad', 'https://www.metacritic.com/movie/the-philadelphia-story/', 'https://www.rottentomatoes.com/m/philadelphia_story', 'https://en.wikipedia.org/wiki/The_Philadelphia_Story_(film)');


INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (417657983, 'IMDb', '9.3', 1.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (417657983, 'Metacritic', '82.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (417657983, 'Rotten Tomatoes', '89.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (896862764, 'IMDb', '9.2', 2.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (896862764, 'Metacritic', '100.0', 2.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (896862764, 'Rotten Tomatoes', '97.0', 2.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1127715346, 'IMDb', '9.0', 3.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1127715346, 'Metacritic', '84.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1127715346, 'Rotten Tomatoes', '94.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1257495259, 'IMDb', '9.0', 4.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1257495259, 'Metacritic', '90.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1257495259, 'Rotten Tomatoes', '96.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1301349790, 'IMDb', '9.0', 5.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1301349790, 'Metacritic', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1301349790, 'Rotten Tomatoes', '98.0', 6.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1793535987, 'IMDb', '9.0', 6.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1793535987, 'Metacritic', '94.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1793535987, 'Rotten Tomatoes', '94.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (806225442, 'IMDb', '9.0', 7.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (806225442, 'Metacritic', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (806225442, 'Rotten Tomatoes', '100.0', 25.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1645878938, 'IMDb', '8.9', 8.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1645878938, 'Metacritic', '92.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1645878938, 'Rotten Tomatoes', '92.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (283477760, 'IMDb', '8.9', 9.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (283477760, 'Metacritic', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (283477760, 'Rotten Tomatoes', '92.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1391240742, 'IMDb', '8.8', 10.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1391240742, 'Metacritic', '74.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1391240742, 'Rotten Tomatoes', '87.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1278412978, 'IMDb', '8.8', 11.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1278412978, 'Metacritic', '67.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1278412978, 'Rotten Tomatoes', '81.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1371031223, 'IMDb', '8.8', 12.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1371031223, 'Metacritic', '82.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1371031223, 'Rotten Tomatoes', '75.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (530844038, 'IMDb', '8.8', 13.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (530844038, 'Metacritic', '87.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (530844038, 'Rotten Tomatoes', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2057653367, 'IMDb', '8.8', 14.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2057653367, 'Metacritic', '90.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2057653367, 'Rotten Tomatoes', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1848618840, 'IMDb', '8.8', 15.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1848618840, 'Metacritic', NULL, NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1848618840, 'Rotten Tomatoes', '91.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1322007046, 'IMDb', '8.7', 16.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1322007046, 'Metacritic', '74.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1322007046, 'Rotten Tomatoes', '73.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (855889485, 'IMDb', '8.7', 17.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (855889485, 'Metacritic', '92.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (855889485, 'Rotten Tomatoes', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1440730664, 'IMDb', '8.7', 18.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1440730664, 'Metacritic', '73.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1440730664, 'Rotten Tomatoes', '83.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1018157845, 'IMDb', '8.7', 19.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1018157845, 'Metacritic', '84.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1018157845, 'Rotten Tomatoes', '93.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (78809918, 'IMDb', '8.7', 20.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (78809918, 'Metacritic', '82.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (78809918, 'Rotten Tomatoes', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (63545791, 'IMDb', '8.6', 21.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (63545791, 'Metacritic', '86.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (63545791, 'Rotten Tomatoes', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (503062450, 'IMDb', '8.6', 22.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (503062450, 'Metacritic', '65.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (503062450, 'Rotten Tomatoes', '83.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1249678210, 'IMDb', '8.6', 23.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1249678210, 'Metacritic', '91.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1249678210, 'Rotten Tomatoes', '94.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1346231625, 'IMDb', '8.6', 24.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1346231625, 'Metacritic', '61.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1346231625, 'Rotten Tomatoes', '79.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1406772068, 'IMDb', '8.6', 25.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1406772068, 'Metacritic', '86.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1406772068, 'Rotten Tomatoes', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (392316929, 'IMDb', '8.2', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (392316929, 'Metacritic', '91.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (392316929, 'Rotten Tomatoes', '99.0', 1.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (851421447, 'IMDb', '8.5', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (851421447, 'Metacritic', '100.0', 10.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (851421447, 'Rotten Tomatoes', '99.0', 3.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (894020390, 'IMDb', '8.6', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (894020390, 'Metacritic', '98.0', 24.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (894020390, 'Rotten Tomatoes', '100.0', 4.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (251907923, 'IMDb', '8.5', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (251907923, 'Metacritic', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (251907923, 'Rotten Tomatoes', '99.0', 5.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1520277541, 'IMDb', '8.2', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1520277541, 'Metacritic', '78.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1520277541, 'Rotten Tomatoes', '96.0', 7.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (621794419, 'IMDb', '7.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (621794419, 'Metacritic', '88.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (621794419, 'Rotten Tomatoes', '100.0', 8.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1764633906, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1764633906, 'Metacritic', '92.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1764633906, 'Rotten Tomatoes', '98.0', 9.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1579164841, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1579164841, 'Metacritic', '91.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1579164841, 'Rotten Tomatoes', '99.0', 10.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (348536626, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (348536626, 'Metacritic', '96.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (348536626, 'Rotten Tomatoes', '99.0', 11.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1604333879, 'IMDb', '8.3', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1604333879, 'Metacritic', '96.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1604333879, 'Rotten Tomatoes', '100.0', 12.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (870673075, 'IMDb', '8.5', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (870673075, 'Metacritic', '100.0', 11.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (870673075, 'Rotten Tomatoes', '98.0', 13.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1904087280, 'IMDb', '8.5', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1904087280, 'Metacritic', '96.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1904087280, 'Rotten Tomatoes', '98.0', 14.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1599220560, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1599220560, 'Metacritic', '75.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1599220560, 'Rotten Tomatoes', '99.0', 15.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1154659227, 'IMDb', '8.2', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1154659227, 'Metacritic', '98.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1154659227, 'Rotten Tomatoes', '99.0', 16.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (304861570, 'IMDb', '8.6', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (304861570, 'Metacritic', '96.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (304861570, 'Rotten Tomatoes', '96.0', 17.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1756517886, 'IMDb', '8.3', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1756517886, 'Metacritic', '88.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1756517886, 'Rotten Tomatoes', '98.0', 18.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2084554881, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2084554881, 'Metacritic', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2084554881, 'Rotten Tomatoes', '99.0', 19.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (460482582, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (460482582, 'Metacritic', '93.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (460482582, 'Rotten Tomatoes', '97.0', 20.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (559276553, 'IMDb', '8.4', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (559276553, 'Metacritic', '87.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (559276553, 'Rotten Tomatoes', '97.0', 21.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2097654371, 'IMDb', '7.8', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2097654371, 'Metacritic', '96.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (2097654371, 'Rotten Tomatoes', '100.0', 22.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (79863599, 'IMDb', '8.2', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (79863599, 'Metacritic', '90.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (79863599, 'Rotten Tomatoes', '99.0', 23.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (893597994, 'IMDb', '8.3', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (893597994, 'Metacritic', '99.0', 15.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (893597994, 'Rotten Tomatoes', '100.0', 24.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1458767573, 'IMDb', '8.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1458767573, 'Metacritic', '100.0', 1.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1458767573, 'Rotten Tomatoes', NULL, NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1919595503, 'IMDb', '7.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1919595503, 'Metacritic', '100.0', 3.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1919595503, 'Rotten Tomatoes', '98.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1822561486, 'IMDb', '8.3', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1822561486, 'Metacritic', '100.0', 4.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1822561486, 'Rotten Tomatoes', '93.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1265595906, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1265595906, 'Metacritic', '100.0', 5.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1265595906, 'Rotten Tomatoes', '100.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (263148316, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (263148316, 'Metacritic', '100.0', 6.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (263148316, 'Rotten Tomatoes', '100.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1384189524, 'IMDb', '7.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1384189524, 'Metacritic', '100.0', 7.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1384189524, 'Rotten Tomatoes', '98.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (888705962, 'IMDb', '8.3', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (888705962, 'Metacritic', '100.0', 8.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (888705962, 'Rotten Tomatoes', '99.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1232541097, 'IMDb', '7.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1232541097, 'Metacritic', '100.0', 9.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1232541097, 'Rotten Tomatoes', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (424396053, 'IMDb', '8.3', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (424396053, 'Metacritic', '100.0', 12.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (424396053, 'Rotten Tomatoes', '93.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (987302716, 'IMDb', '7.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (987302716, 'Metacritic', '100.0', 13.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (987302716, 'Rotten Tomatoes', '96.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (755957868, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (755957868, 'Metacritic', '100.0', 14.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (755957868, 'Rotten Tomatoes', '100.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1615377061, 'IMDb', '7.8', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1615377061, 'Metacritic', '99.0', 16.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1615377061, 'Rotten Tomatoes', '98.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (326674215, 'IMDb', '8.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (326674215, 'Metacritic', '99.0', 17.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (326674215, 'Rotten Tomatoes', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (407910799, 'IMDb', '8.1', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (407910799, 'Metacritic', '99.0', 18.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (407910799, 'Rotten Tomatoes', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (424735752, 'IMDb', '8.5', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (424735752, 'Metacritic', '99.0', 19.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (424735752, 'Rotten Tomatoes', '95.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1024068360, 'IMDb', '7.4', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1024068360, 'Metacritic', '99.0', 20.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1024068360, 'Rotten Tomatoes', '98.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (336048821, 'IMDb', '7.7', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (336048821, 'Metacritic', '99.0', 21.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (336048821, 'Rotten Tomatoes', '98.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (401123580, 'IMDb', '7.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (401123580, 'Metacritic', '99.0', 22.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (401123580, 'Rotten Tomatoes', '97.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1348419192, 'IMDb', '7.5', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1348419192, 'Metacritic', '99.0', 23.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (1348419192, 'Rotten Tomatoes', '100.0', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (598288868, 'IMDb', '7.9', NULL);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (598288868, 'Metacritic', '98.0', 25.0);
INSERT INTO `ratings` (`movie_id`, `source`, `rating`, `top_25_rank`) VALUES (598288868, 'Rotten Tomatoes', '91.0', NULL);


INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1097980, 'Lucasfilm Ltd.', 1971, 'United States', 'San Francisco, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (17518151, 'Participant Media', 2004, 'United States', 'Los Angeles, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (52667073, 'Arnold Kopelson Productions', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (88360166, 'Studio Ghibli', 1985, 'Japan', 'Tokyo');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (119802444, 'Warner Bros.-Seven Arts', 1967, 'United States', 'Burbank, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (147781542, 'DreamWorks Animation', 1994, 'United States', 'Glendale, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (155556520, 'A Band Apart', 1991, 'United States', 'Los Angeles, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (206244866, 'D. W. Griffith', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (220872704, 'Pruduzioni Europee Associati', 1962, 'Italy', NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (245015782, 'Mars Film Produzione', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (255914755, 'Les Films Corona', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (309211795, 'RKO Radio Pictures', 1929, 'United States', 'New York, NY');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (345812838, 'France 3 Cinema', 1972, 'France', NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (522770982, 'Shochiku', 1895, 'Japan', 'Tokyo');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (527182155, 'Barunson E&A', 1996, 'South Korea', 'Seoul');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (541771269, 'Horizon Pictures', 1947, 'United Kingdom', NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (571409494, 'Alfred J Hitchcock Productions', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (608444546, 'Columbia Pictures', 1918, 'United States', 'Culver City, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (608805325, 'Igor Film', NULL, 'Italy', NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (615574204, 'Castle Rock Entertainment', 1987, 'United States', 'Beverly Hills, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (662884426, 'Warner Bros.', 1923, 'United States', 'Burbank, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (744711240, 'WingNut Films', 1987, 'New Zealand', 'Wellington');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (820649618, 'Gaumont SA', 1895, 'France', 'Neuilly-sur-Seine');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (855909534, 'Orion-Nova Productions', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (890052322, 'IFC Productions', 2000, 'United States', 'New York, NY');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (899358178, 'Goffredo Lombardo', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (923038318, 'London Films', 1932, 'United Kingdom', 'Buckinghamshire');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (960784990, 'A24', 2012, 'United States', 'New York, NY');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (961953015, 'Fox 2000 Pictures', 1994, 'United States', 'Los Angeles, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1018652039, 'Strong Heart Productions', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1106754834, 'Long Road Productions', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1117667735, 'Toho', 1932, 'Japan', 'Tokyo');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1182113051, 'Fantasy Films', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1206236101, 'Paramount Pictures', 1912, 'United States', 'Hollywood, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1252156701, 'Amblin Entertainment', 1980, 'United States', 'Universal City, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1288370075, 'Walt Disney Productions', 1923, 'United States', 'Burbank, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1312266509, 'Universal Pictures', 1912, 'United States', 'Universal City, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1458218393, 'Regency Enterprises', 1982, 'United States', 'West Hollywood, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1504291193, 'Vinod Chopra Films', 1985, 'India', 'Mumbai');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1604338439, 'Metro-Goldwyn-Mayer', 1924, 'United States', 'Beverly Hills, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1611288057, 'Spectra Films', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1633552414, 'Zespol Filmowy "Tor"', 1972, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1827073771, 'Charles Chaplin Productions', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1855449249, '20th Century Fox', 1935, 'United States', 'Los Angeles, CA');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1857522484, 'Nouvelle Edition Francaise', NULL, NULL, 'France');
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1974516274, 'Patron Inc.', NULL, NULL, NULL);
INSERT INTO `production_company` (`production_company_id`, `company_name`, `year_founded`, `headquarters_country`, `headquarters_city`) VALUES (1997637385, 'Pixar Animation Studios', 1986, 'United States', 'Emeryville, CA');

INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (63545791, 'Silence of the Lambs, The', 1991, 'Jonathan Demme', 1018652039);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (78809918, 'Star Wars: Episode V - The Empire Strikes Back', 1980, 'Irvin Kershner', 1097980);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (79863599, 'Finding Nemo', 2003, 'Andrew Stanton', 1997637385);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (251907923, 'Parasite', 2019, 'Bong Joon Ho', 527182155);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (263148316, 'Three Colors: Red', 1994, 'Krzysztof Kieslowski', 345812838);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (283477760, 'Pulp Fiction', 1994, 'Quentin Tarantino', 155556520);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (304861570, 'Spirited Away', 2002, 'Hayao Miyazaki', 88360166);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (326674215, 'Touch of Evil', 1958, 'Orson Welles', 1312266509);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (336048821, 'Intolerance', 1916, 'D.W. Griffith', 206244866);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (348536626, 'Battle of Algiers, The', 1967, 'Gillo Pontecorvo', 608805325);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (392316929, 'L.A. Confidential', 1997, 'Curtis Hanson', 1458218393);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (401123580, 'Rules of the Game, The', 1939, 'Jean Renior', 1857522484);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (407910799, 'Army of Shadows', 1969, 'Jean-Pierre Melville', 255914755);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (417657983, 'Shawshank Redemption, The', 1994, 'Frank Darabont', 615574204);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (424396053, 'Vertigo', 1958, 'Alfred Hitchcock', 571409494);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (424735752, 'City Lights', 1931, 'Charlie Chaplin', 1827073771);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (460482582, 'Spotlight', 2015, 'Tom McCarthy', 17518151);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (503062450, 'Seven   ', 1995, 'David Fincher', 52667073);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (530844038, 'Lord of the Rings: The Two Towers, The', 2002, 'Peter Jackson', 744711240);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (559276553, 'Spider-Man: Into the Spider-Verse', 2018, 'Bob Persichetti, Peter Ramsey, Rodney Rothman', 608444546);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (598288868, 'Wild Bunch, The', 1969, 'Sam Peckinpah', 119802444);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (621794419, 'Toy Story 2', 1999, 'Ash Brannon', 1997637385);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (755957868, 'Fanny & Alexander', 1982, 'Ingmar Bergman', 820649618);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (806225442, '12 Angry Men', 1957, 'Sidney Lumet', 855909534);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (851421447, 'Casablanca', 1943, 'Michael Curtis', 662884426);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (855889485, 'Goodfellas', 1990, 'Martin Scorsese', 662884426);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (870673075, 'Rear Window', 1954, 'Alfred Hitchcock', 1974516274);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (888705962, 'Citizen Kane', 1941, 'Orson Welles', 309211795);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (893597994, 'Singin'' in the Rain', 1952, 'Stanley Donen, Gene Kelly', 1604338439);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (894020390, 'Seven Samurai', 1956, 'Akira Kurosawa', 1117667735);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (896862764, 'Godfather, The', 1972, 'Francis Ford Coppola', 1206236101);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (987302716, 'Notorious', 1946, 'Alfred Hitchcock', 309211795);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1018157845, 'One Flew Over the Cuckoo''s Nest', 1975, 'Milos Forman', 1182113051);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1024068360, 'Moonlight', 2016, 'Barry Jenkins', 960784990);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1127715346, 'Dark Knight, The', 2008, 'Christopher Nolan', 662884426);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1154659227, 'All About Eve', 1950, 'Joseph L. Mankiewics', 1855449249);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1232541097, 'Boyhood', 2014, 'Richard Linklater', 890052322);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1249678210, 'Saving Private Ryan', 1998, 'Steven Spielberg', 1252156701);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1257495259, 'Godfather Part II, The', 1974, 'Francis Ford Coppola', 1206236101);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1265595906, 'Tokyo Story', 1972, 'Yasujiro Ozu', 522770982);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1278412978, 'Fight Club', 1999, 'David Fincher', 961953015);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1301349790, 'Schindler''s List', 1993, 'Steven Spielberg', 1312266509);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1322007046, 'Interstellar', 2014, 'Christopher Nolan', 1206236101);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1346231625, 'Green Mile, The', 1999, 'Frank Darabont', 615574204);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1348419192, 'Pinocchio', 1940, 'Norman Ferguson, T. Hee, Wilfred Jackson, Jack Kinney', 1288370075);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1371031223, 'Forrest Gump', 1994, 'Robert Zemeckis', 1206236101);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1384189524, 'Conformist, The', 1970, 'Bernardo Bertolucci', 245015782);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1391240742, 'Inception', 2010, 'Christopher Nolan', 662884426);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1406772068, 'Spider-Man: Across the Spider-Verse', 2023, 'Joaquim Dos Santos, Kemp Powers, Justin K. Thompson', 608444546);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1440730664, 'Matrix, The', 1999, 'Lana & Lilly Wachowski', 662884426);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1458767573, 'Dekalog', 1988, 'Krzysztof Kieslowski', 1633552414);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1520277541, 'Top Gun: Maverick', 2022, 'Joseph Kosinski', 1206236101);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1579164841, 'On The Waterfront', 1954, 'Elia Kazan', 541771269);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1599220560, 'How to Train Your Dragon', 2010, 'Christopher Sanders, Dean DeBlois', 147781542);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1604333879, 'Toy Story   ', 1995, 'John Lasseter', 1997637385);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1615377061, 'Playtime', 1973, 'Jacques Tati', 1611288057);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1645878938, 'Lord of the Rings: Fellowship of the Ring, The', 2001, 'Peter Jackson', 744711240);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1756517886, 'Up', 2009, 'Pete Docter, Bob Peterson', 1997637385);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1764633906, 'Chinatown', 1974, 'Roman Polanski', 1106754834);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1793535987, 'Lord of the Rings: Return of the King, The', 2003, 'Peter Jackson', 744711240);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1822561486, 'Lawrence of Arabia', 1962, 'David Lean', 541771269);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1848618840, '12th Fail', 2023, 'Vindhu Vinod Chopra', 1504291193);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1904087280, 'Modern Times', 1936, 'Charlie Chaplin', 1827073771);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (1919595503, 'Leopard, The', 1963, 'Luchino Visconti', 899358178);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (2057653367, 'Good, the Bad and the Ugly, The', 1966, 'Sergio Leone', 220872704);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (2084554881, 'Third Man, The', 1949, 'Carol Reed', 923038318);
INSERT INTO `movie` (`movie_id`, `title`, `release_year`, `director_name`, `production_company_id`) VALUES (2097654371, 'Philadelphia Story, The', 1940, 'George Cukor', 1604338439);

INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (417657983, 'Tim Robbins', 'Andy Dufresne');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (417657983, 'Morgan Freeman', 'Ellis Boyd ''Red'' Redding');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (417657983, 'Bob Gunton', 'Warden Norton');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (417657983, 'Willam Sadler', 'Heywood');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (417657983, 'Clancy Brown', 'Captain Hadley');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (896862764, 'Marlon Brando', 'Don Vito Corleone');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (896862764, 'Al Pacino', 'Michael');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (896862764, 'James Caan', 'Sonny');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (896862764, 'Richard S. Castellano', 'Clemenza');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (896862764, 'Robert Duvall', 'Tom Hagen');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1127715346, 'Christian Bale', 'Bruce Wayne / Batman');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1127715346, 'Heath Ledger', 'Joker');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1127715346, 'Aaron Eckhart', 'Harvey Dent');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1127715346, 'Michael Caine', 'Alfred');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1127715346, 'Gary Oldman', 'Commissioner Gordon');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1257495259, 'Al Pacino', 'Michael');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1257495259, 'Robert Duvall', 'Tom Hagen');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1257495259, 'Diane Keaton', 'Kay');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1257495259, 'Robert De Niro', 'Vito Corleone');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1257495259, 'John Cazale', 'Fredo Corleone');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1301349790, 'Liam Neeson', 'Oskar Schindler');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1301349790, 'Ben Kingsley', 'Itzhak Stern');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1301349790, 'Ralph Fiennes', 'Amon Goeth');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1301349790, 'Caroline Goodall', 'Emilie Schindler');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1301349790, 'Jonathan Sagall', 'Poldek Pfefferberg');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1793535987, 'Elijah Wood', 'Frodo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1793535987, 'Ian McKellen', 'Gandalf');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1793535987, 'Viggo Mortensen', 'Aragorn');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1793535987, 'Liv Tyler', 'Arwen');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1793535987, 'Sean Astin', 'Sam');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (806225442, 'Henry Fonda', 'Juror 8 ''Davis''');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (806225442, 'Lee J. Cobb', 'Juror 3');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (806225442, 'Martin Balsam', 'Juror 1');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (806225442, 'Ed Begley', 'Juror 10');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (806225442, 'E. G. Marshall', 'Juror 4');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1645878938, 'Ian McKellan', 'Gandalf');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1645878938, 'Elijah Wood', 'Frodo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1645878938, 'Viggo Mortensen', 'Aragorn');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1645878938, 'Orlando Bloom', 'Legolas');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1645878938, 'Cate Blanchett', 'Galadriel');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (283477760, 'John Travolta', 'Vincent Vega');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (283477760, 'Samuel L. Jackson', 'Jules Winnfield');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (283477760, 'Uma Thurman', 'Mia Wallace');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (283477760, 'Ving Rhames', 'Marsellus Wallace');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (283477760, 'Harvey Keitel', 'The Wolf');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1391240742, 'Leonardo DiCaprio', 'Dom Cobb');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1391240742, 'Ken Watanabe', 'Saito');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1391240742, 'Joseph Gordon-Levitt', 'Arthur');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1391240742, 'Marion Cotillard', 'Mal');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1391240742, 'Elliot Page', 'Ariadne');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1278412978, 'Edward Norton', 'Narrator');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1278412978, 'Brad Pitt', 'Tyler Durden');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1278412978, 'Helena Bonham Carter', 'Marla Singer');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1278412978, 'Meat Loaf', 'Robert ''Bob'' Paulson');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1278412978, 'Jared Leto', 'Angel Face');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1371031223, 'Tom Hanks', 'Forrest Gump');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1371031223, 'Mykelti Williamson', 'Benjamin Buford ''Bubba'' Blue');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1371031223, 'Robin Wright', 'Jenny Curran');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1371031223, 'Sally Field', 'Mrs. Gump');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1371031223, 'Gary Sinise', 'Lieutenant Dan');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (530844038, 'Elijah Wood', 'Frodo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (530844038, 'Ian McKellen', 'Gandalf');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (530844038, 'Viggo Mortensen', 'Aragorn');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (530844038, 'Sean Astin', 'Samwise Gamgee');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (530844038, 'Andy Serkis', 'Gollum');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2057653367, 'Clint Eastwood', 'Blondie / ''The Good''');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2057653367, 'Lee Van Cleef', 'Sentenza / Angel Eyes / ''The Bad''');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2057653367, 'Eli Wallach', 'Tuco ''The Ugly''');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2057653367, 'Aldo Giuffre', 'Union Captain');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2057653367, 'Luigi Pistilli', 'Father Pablo Ramirez');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1848618840, 'Vikrant Massey', 'Manoj Sharma');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1848618840, 'Medha Shankr', 'Shraddha Joshi');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1848618840, 'Anant Joshi', 'Pritam Pandey');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1848618840, 'Anshuman Pushkar', 'Gaurinandan');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1848618840, 'Geeta Agrawal Sharma', 'Pushpa Sharma');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1322007046, 'Matthew McConaughey', 'Joseph Cooper');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1322007046, 'Michael Caine', 'Professor John Brand');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1322007046, 'Ellen Burstyn', 'Old Murph');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1322007046, 'Anne Hathaway', 'Dr. Amelia Brand');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1322007046, 'Casey Affleck', 'Adult Tom');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (855889485, 'Robert De Niro', 'James Conway');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (855889485, 'Ray Liotta', 'Henry Hill');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (855889485, 'Joe Pesci', 'Tommy DeVito');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (855889485, 'Lorraine Bracco', 'Karen Hill');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (855889485, 'Paul Sorvino', 'The Director');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1440730664, 'Keanu Reeves', 'Neo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1440730664, 'Laurence Fishburne', 'Morpheus');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1440730664, 'Carrie-Anne Moss', 'Trinity');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1440730664, 'Hugo Weaving', 'Agent Smith');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1440730664, 'Gloria Foster', 'Oracle');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1018157845, 'Jack Nicholson', 'Randle Patrick ''R.P'' McMurphy');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1018157845, 'Danny DeVito', 'Martini');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1018157845, 'Christopher Lloyd', 'Taber');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1018157845, 'Louise Fletcher', 'Nurse Mildred Ratched');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1018157845, 'Will Sampson', '''Chief'' Bromden');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (78809918, 'Mark Hamill', 'Luke Skywalker');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (78809918, 'Harrison Ford', 'Han Solo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (78809918, 'Carrie Fisher', 'Princess Leia Organa');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (78809918, 'Billy Dee Williams', 'Lando Calrissian');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (78809918, 'Anthony Daniels', 'C-3PO');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (63545791, 'Jodie Foster', 'Clarice Starling');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (63545791, 'Anthony Hopkins', 'Dr. Hannibal Lecter');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (63545791, 'Scott Glenn', 'Jack Crawford');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (63545791, 'Ted Levine', 'Jame ''Buffalo Bill'' Gumb');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (63545791, 'Anthony Heald', 'Dr. Frederick Chilton');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (503062450, 'Brad Pitt', 'Detective David Mills');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (503062450, 'Morgan Freeman', 'Detective William Somerset');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (503062450, 'Kevin Spacey', 'John Doe');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (503062450, 'Gwyneth Paltrow', 'Tracy Mills');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (503062450, 'Richard Roundtree', 'Martin Talbot');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1249678210, 'Tom Hanks', 'Captain Miller');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1249678210, 'Tom Sizemore', 'Sergeant Horvath');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1249678210, 'Edward Burns', 'Private Reiben');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1249678210, 'Barry Pepper', 'Private Jackson');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1249678210, 'Adam Goldberg', 'Private Mellish');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1346231625, 'Tom Hanks', 'Paul Edgecomb');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1346231625, 'Michael Clark Duncan', 'John Coffey');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1346231625, 'David Morse', 'Brutus ''Brutal'' Powell');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1346231625, 'Bonnie Hunt', 'Jan Edgecomb');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1346231625, 'James Cromwell', 'Hal Moores');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1406772068, 'Shameik Moore', 'Miles Morales');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1406772068, 'Hailee Steinfeld', 'Gwen Stacey');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1406772068, 'Brian Tyree Henry', 'Jeff Morales');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1406772068, 'Luna Lauren Velez', 'Rio Morales');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1406772068, 'Jake Johnson', 'Peter Parker');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (392316929, 'Kevin Spacey', 'Jack Vincennes');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (392316929, 'Russel Crowe', 'Officer Wendell ''Bud'' White');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (392316929, 'Guy Pearce', 'Detective Lieutenant Edmund Jennings Exley');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (392316929, 'Kim Bassinger', 'Lynn Bracken');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (392316929, 'Danny DeVito', 'Sid Hudgens');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (851421447, 'Humphrey Bogart', 'Rick Blaine');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (851421447, 'Ingrid Bergman', 'Ilsa Lund');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (851421447, 'Paul Henreid', 'Victor Laszlo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (851421447, 'Calude Rains', 'Captain Louis Renault');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (851421447, 'Conrad Veidt', 'Major Heinrich Strasser');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (894020390, 'Toshiro Mifune', 'Kikuchiyo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (894020390, 'Takashi Shimura', 'Kambei Shimada');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (894020390, 'Yoshio Inaba', 'Gorobei Katayama');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (894020390, 'Seiji Miyaguchi', 'Kyuzo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (894020390, 'Minoru Chiaki', 'Heinachi Hayashida');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (251907923, 'Song Kang-Ho', 'Ki Taek');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (251907923, 'Leen Sun-Kyun', 'Dong Ik');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (251907923, 'Cho Yeo-Jeong', 'Yeon Kyo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (251907923, 'Choi Woo-Sik', 'Ki Woo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (251907923, 'Park So-Dam', 'Ki Jung');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1520277541, 'Tom Cruise', 'Captain Pete ''Maverick'' Mitchell');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1520277541, 'Val Kilmer', 'Admiral Tom ''Iceman'' Kazansky');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1520277541, 'Miles Teller', 'Lieutenant Bradley ''Rooster'' Bradshaw');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1520277541, 'Jennifer Connelly', 'Penny Benjamin');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1520277541, 'Bashir Salahuddin', 'CWO4 Bernie ''Hondo'' Coleman');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (621794419, 'Tom Hanks', 'Woody');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (621794419, 'Tim Allen', 'Buzz Lightyear');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (621794419, 'Joan Cusack', 'Jessie');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (621794419, 'Kelsey Grammer', 'Prospector');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (621794419, 'Don Rickles', 'Mr. Potato Head');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1764633906, 'Jack Nicholson', 'J.J. Gittes');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1764633906, 'Faye Dunaway', 'Evelyn Mulwray');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1764633906, 'John Huston', 'Noah Cross');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1764633906, 'Perry Lopez', 'Escobar');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1764633906, 'John Hillerman', 'Yelburton');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1579164841, 'Marlon Brando', 'Terry Malloy');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1579164841, 'Lee J. Cobb', 'Johnny Friendly');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1579164841, 'Karl Malden', 'Father Barry');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1579164841, 'Rod Steiger', 'Charley ''The Gent'' Malloy');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1579164841, 'Eva Marie Saint', 'Edie Doyle');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (348536626, 'Jean Martin', 'Colonel Philippe Mathieu');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (348536626, 'Saadi Yacef', 'El-Hadi Jafar');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (348536626, 'Brahim Haggiag', 'Ali La Pointe');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (348536626, 'Tommaso Neri', 'Captain Dubois');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (348536626, 'Samia Kerbash', 'Fathia');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1604333879, 'Tom Hanks', 'Woody');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1604333879, 'Tim Allen', 'Buzz Lightyear');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1604333879, 'Don Rickles', 'Mr. Potato Head');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1604333879, 'Jim Varney', 'Slinky Dog');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1604333879, 'Wallace Shawn', 'Rex');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (870673075, 'James Stewart', 'L.B. Jeffries');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (870673075, 'Grace Kelly', 'Lisa Fremont');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (870673075, 'Wendell Corey', 'Tom Doyle');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (870673075, 'Thelma Ritter', 'Stella');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (870673075, 'Raymond Burr', 'Lars Thorwald');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1904087280, 'Charlie Chaplin', 'Factory Worker ''The Tramp''');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1904087280, 'Paulette Goddard', 'Ellen Peterson ''The Gamin''');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1904087280, 'Henry Bergman', 'Cafe Owner');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1904087280, 'Stanley Sandford', 'Big Bill');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1904087280, 'Chester Conklin', 'Mechanic');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1599220560, 'Jay Baruchel', 'Hiccup');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1599220560, 'America Ferrera', 'Astrid');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1599220560, 'Gerard Butler', 'Stoick');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1599220560, 'Craig Ferguson', 'Gobber');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1599220560, 'Christopher Mintz-Plasse', 'Fishlegs');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1154659227, 'Bette Davis', 'Margo Channing');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1154659227, 'Anne Baxter', 'Eve Harrington');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1154659227, 'George Sanders', 'Addison DeWitt');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1154659227, 'Celeste Holm', 'Karen Richards');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1154659227, 'Gary Merrill', 'Bill Sampson');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (304861570, 'Daveigh Chase', 'Chihiro Ogino');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (304861570, 'Suzanne Pleshette', 'Yububa / Zeniba');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (304861570, 'Jason Marsden', 'Haku');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (304861570, 'Susan Egan', 'Lin');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (304861570, 'David Ogden Stiers', 'Kamaji');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1756517886, 'Edward Asner', 'Carl Fredericksen');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1756517886, 'Jordan Nagai', 'Russel');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1756517886, 'John Ratzenberger', 'Construction Foreman');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1756517886, 'Christopher Plummer', 'Charles Muntz');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1756517886, 'Bob Peterson', 'Dug');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2084554881, 'Orson Welles', 'The Third Man');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2084554881, 'Joseph Cotten', 'Holly Martins');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2084554881, 'Trevor Howard', 'Major Calloway');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2084554881, 'Alida Valli', 'Anna Schmidt');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2084554881, 'Paul Hoerbiger', 'Porter');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (460482582, 'Mark Ruffalo', 'Mike Rezendes');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (460482582, 'Michael Keaton', 'Walter ''Robby'' Robinson');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (460482582, 'Rachel McAdams', 'Sacha Pfeiffer');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (460482582, 'Liev Schreiber', 'Marty Baron');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (460482582, 'John Slattery', 'Ben Bradlee Jr.');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (559276553, 'Shameik Moore', 'Miles Morales');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (559276553, 'Jake Johnson', 'Peter Parker');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (559276553, 'Hailee Steinfeld', 'Gwen Stacey');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (559276553, 'Mahershala Ali', 'Uncle Aaron');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (559276553, 'John Mulaney', 'Spider-Ham');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2097654371, 'Katherine Hepburn', 'Tracy Lord');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2097654371, 'Cary Grant ', 'C.K. Dexter Haven');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2097654371, 'James Stewart', 'Macaulay ''Mike'' Connor');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2097654371, 'Ruth Hussey', 'Elizabeth ''Liz'' Imbrie');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (2097654371, 'John Howard', 'George Kittredge');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (79863599, 'Albert Brooks', 'Marlin');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (79863599, 'Ellen DeGeneres', 'Dory');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (79863599, 'Alexander Gould', 'Nemo');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (79863599, 'Willem Dafoe', 'Gill');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (79863599, 'Brad Garrett', 'Bloat');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (893597994, 'Gene Kelly', 'Don Lockwood');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (893597994, 'Debbie Reynolds', 'Kathy Selden');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (893597994, 'Donald O''Conner', 'Cosmo Brown');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (893597994, 'Jean Hagen', 'Lina Lamont');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (893597994, 'Millard Mitchell', 'R.F. Simpson');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1458767573, 'Artur Barcis', 'Many characters');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1458767573, 'Olgierd Lukaszewics', 'Andrzej Geller');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1458767573, 'Olaf Lubaszenko', 'Tomek');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1458767573, 'Aleksander Bardini', 'Consultant');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1458767573, 'Krystyna Janda', 'Dorota Geller');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1919595503, 'Burt Lancaster', 'Prince Don Fabrizio Salina');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1919595503, 'Claudi Cardinale', 'Angelica Sedara');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1919595503, 'Alain Delon', 'Tancredi Falconeri');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1919595503, 'Paolo Stoppa', 'Don Calogera Sedara');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1919595503, 'Rina Morelli', 'Princess Maria Stella Salina');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1822561486, 'Peter O''Toole', 'Lawrence');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1822561486, 'Alec Guinness', 'Prince Faisal');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1822561486, 'Anthony Quinn', 'Auda Abu Tayi');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1822561486, 'Jack Hawkins', 'General Edmund Allenby');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1822561486, 'Omar Sharif', 'Sherif Ali');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1265595906, 'Chishu Ryu', 'Shukichi Hirayama');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1265595906, 'Chieko Higashiyama', 'Tomi Hirayama');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1265595906, 'Setsuko Hara', 'Noriko Hirayama');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1265595906, 'Haruko Sugimura', 'Shige Kaneko');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1265595906, 'So Yamamura', 'Koichi Hiryama');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (263148316, 'Irene Jacob', 'Valentine');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (263148316, 'Jean-Louis Trintignant', 'Le Juge');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (263148316, 'Frederique Feder', 'Karin');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (263148316, 'Jean-Pierre Lorit', 'Auguste');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (263148316, 'Samuel Le Bihan', 'Photographer');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1384189524, 'Jean-Louis Trintignant', 'Marcello Clerici');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1384189524, 'Stefania Sandrelli', 'Giulia');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1384189524, 'Gastone Moschin', 'Manganiello');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1384189524, 'Enzo Tarascio', 'Professor Quadri');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1384189524, 'Fosco Giachetti', 'Il Colonnello');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (888705962, 'Joseph Cotten', 'Jedediah Leland');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (888705962, 'Dorothy Comingore', 'Susan Alexander Kane');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (888705962, 'Agnes Moorehead', 'Mary Kane');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (888705962, 'Ruth Warrick', 'Emily Monroe Norton Kane');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (888705962, 'Ray Collins', 'James W. Gettys');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1232541097, 'Ellar Coltrane', 'Mason');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1232541097, 'Patricia Arquette', 'Olivia');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1232541097, 'Elijah Smith', 'Tommy');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1232541097, 'Lorelei Linklater', 'Samantha');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1232541097, 'Steven Chester Prince', 'Ted');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424396053, 'James Stewart', 'John ''Scottie'' Ferguson');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424396053, 'Kim Novak', 'Madeleine Elster / Judy Barton');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424396053, 'Barbara Bel Geddes', 'Marjorie ''Midge'' Wood');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424396053, 'Tom Helmore', 'Gavin Elster');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424396053, 'Henry Jones', 'Coroner');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (987302716, 'Cary Grant', 'Devlin');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (987302716, 'Ingrid Bergman', 'Alicia Huberman');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (987302716, 'Claude Rains', 'Alexander Sebastian');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (987302716, 'Louise Calhern', 'Paul Prescott');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (987302716, 'Leopoldine Konstantin', 'Madame Sebastian');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (755957868, 'Kristina Adolphson', 'Siri ');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (755957868, 'Borje Ahlstedt', 'Carl Ekdahl');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (755957868, 'Pernilla Allwin', 'Fanny Ekdahl');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (755957868, 'Kristian Almgren', 'Putte Ekdahl');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (755957868, 'Carl Billquist', 'Polisintendent Jespersson');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1615377061, 'Jacques Tati', 'Monsieur Hulot');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1615377061, 'Barbara Dennek', 'Barbara');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1615377061, 'Rita Maiden', 'La compagne de M. Schultz');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1615377061, 'France Rumilly', 'La Vendeuse De Lunettes');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1615377061, 'France Delahalle', 'Un Cliente Dans Le Grand Magasin');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (326674215, 'Charlton Heston', 'Mike Vargas');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (326674215, 'Janet Leigh', 'Susan Vargas');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (326674215, 'Orson Welles', 'Captain Hank Quinlan');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (326674215, 'Joseph Calleia', 'Sergeant Pete Menzies');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (326674215, 'Akim Tamiroff', '''Uncle'' Joe Grandi');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (407910799, 'Lino Ventura', 'Philippe Gerbier');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (407910799, 'Paul Meurisse', 'Luc Jardie');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (407910799, 'Jean-Pierre Cassel', 'Jean Francois Jardie');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (407910799, 'Simone Signoret', 'Mathilde');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (407910799, 'Claude Mann', 'Claude Ullmann Dit ''Le Masque''');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424735752, 'Charlie Chaplin', 'A Tramp');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424735752, 'Virginia Cherrill', 'Blind Girl');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424735752, 'Florrence Lee', 'Blind Girl''s Grandmother');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424735752, 'Harry Myers', 'Eccentric Millionaire');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (424735752, 'Al Ernest Garcia', 'Millionaire''s Butler');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1024068360, 'Mahershala Ali', 'Juan');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1024068360, 'Shariff Earp', 'Terrence');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1024068360, 'Duan Sanderson', 'Azu');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1024068360, 'Alex R. Hibbert', 'Little');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1024068360, 'Janelle Monae', 'Teresa');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (336048821, 'Lillian Gish', 'Eternal Mother');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (336048821, 'Mae Marsh', 'The Dear One');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (336048821, 'Robert Harron', 'The Boy');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (336048821, 'F.A. Turner', 'The Dear One''s Father');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (336048821, 'Sam De Grasse', 'Arthur Jenkins');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (401123580, 'Nora Gregor', 'Christine De La Cheyniest');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (401123580, 'Paulette Dubost', 'Lisette');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (401123580, 'Mila Parely', 'Genevieve De Marras');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (401123580, 'Odette Talazac', 'Madame De La Plante');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (401123580, 'Claire Gerard', 'Madame De La Bruyere');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1348419192, 'Dickie Jones', 'Pinocchio');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1348419192, 'Mel Blanc', 'Gideon');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1348419192, 'Cliff Edwards', 'Jimini Cricket');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1348419192, 'Walter Catlett', 'J. Worthington Foulfellow');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (1348419192, 'Frankie Darro', 'Lampwick');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (598288868, 'William Holden', 'Pike');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (598288868, 'Ernest Borgnine', 'Dutch');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (598288868, 'Robert Ryan', 'Thornton');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (598288868, 'Edmond O''Brien', 'Sykes');
INSERT INTO `cast` (`movie_id`, `actor_name`, `character_name`) VALUES (598288868, 'Warren Oates', 'Lyle Gorch');
 SELECT DISTINCT
 communities.name as 'Group_Name',
 COUNT(users.id) OVER () / (SELECT COUNT(communities.id ) from communities) as 'AVG_USERS_ON_GROUP',
 FIRST_VALUE(profiles.user_id ) OVER (PARTITION BY communities_users.community_id  ORDER BY profiles.birthday) as 'MAX_AGE_USER_ID',
 FIRST_VALUE(profiles.user_id ) OVER (PARTITION BY communities_users.community_id  ORDER BY profiles.birthday desc) as 'MIN_AGE_USER_ID',
 COUNT(communities_users.user_id) OVER (PARTITION BY communities_users.community_id) as 'total_users_on_group',
 (SELECT COUNT(users.id) from users)  as 'total_users_on_system',
 COUNT(communities_users.user_id) OVER (PARTITION BY communities_users.community_id) / (SELECT COUNT(users.id) from users) * 100 as 'Proc'
 	FROM (communities_users
 			INNER JOIN communities ON communities_users.community_id = communities.id
 			INNER JOIN profiles    ON communities_users.user_id = profiles.user_id
 			LEFT JOIN users       ON communities_users.user_id = users.id ) order by Proc DESC ;
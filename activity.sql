CREATE OR REPLACE FUNCTION GetHierarchy(pn_activityid INT DEFAULT NULL) RETURNS TABLE (
    ActivityId INT,
    ActivityName VARCHAR(255),
    ActivityType VARCHAR(255)
) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE ActivityHierarchy AS (
        SELECT
            A.ActivityId,
            A.Name AS ActivityName,
            AT.Name AS ActivityType
        FROM
            Activity A
        JOIN ActivityType AT ON A.ActivityTypeId = AT.ActivityTypeId
        WHERE
            A.ActivityId = COALESCE(pn_activityid, A.ActivityId)

        UNION ALL

        SELECT
            A.ActivityId,
            A.Name AS ActivityName,
            AT.Name AS ActivityType
        FROM
            Activity A
        JOIN ActivityHierarchy AH ON A.ParentId = AH.ActivityId
        JOIN ActivityType AT ON A.ActivityTypeId = AT.ActivityTypeId
    )
    SELECT
        ActivityId,
        ActivityName,
        ActivityType
    FROM
        ActivityHierarchy;
END;
$$ LANGUAGE plpgsql;

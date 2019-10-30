<?php

	$query_type = Array(
		'by_weekday',
		'by_hour',
		'by_computer',
		'by_user',
		'current',
		'by_floor'
	);

	if ( $_GET['callback'] AND (in_array($_GET['query_type'], $query_type)) ) {
		header("Content-Type: application/json");
		header('Access-Control-Allow-Origin: *');
	}

	else{
		die();
	}
	
	
	
	
	//echo $end;
	function doQuery() {

		//make our database connection
		
			$connection = mysqli_connect("localhost","root","","lablogs");
		
		

		//by_weekday
		if( $_GET['query_type'] == 'by_weekday' ) {
			$sql='
			SELECT
				count(*) as count,
				WEEKDAY(timestamp) as weekday
			FROM
				raw r
			WHERE
				event = 3 and
				computername in
					(select computername from computernames)
			GROUP BY
				weekday
			';
			$output_array = array();

			foreach ($connection->query($sql) as $row) {
				$temp_array = array(
					"count" 	=> (int) $row['count'],
					"weekday"	=> (int) $row['weekday']
				);

				$output_array[] = $temp_array;
			} //END foreach
		} //end if

		//by_hour
		if( $_GET['query_type'] == 'by_hour' ) {
			$sql='
			SELECT 
				count(*) as count, 
				HOUR(timestamp) as hour 
			FROM
				raw r 
			WHERE 
				event = 3 and
				computername in 
						(select computername from computernames)
			GROUP BY 
				hour
			';
			$output_array = array();

			foreach ($connection->query($sql) as $row) {
				$temp_array = array(
					"count" 	=> (int) $row['count'],
					"hour"		=> (int) $row['hour']
				);

				$output_array[] = $temp_array;
			} //END foreach
		} //end if

		//by_user
		if( $_GET['query_type'] == 'by_user' ) {
			$sql="
			SELECT 
				count(*) as count, 
				md5(SHA2(username,224)) as user,
				DATE_FORMAT( max(timestamp),'%Y-%m-%d %h:%i %p') as lastlogin
			FROM 
				raw
			WHERE 
				event = 3 and
				computername in 
						(select computername from computernames)
			GROUP BY
				username 
			ORDER BY
				count desc;
			";
			$output_array = array();

			foreach ($connection->query($sql) as $row) {
				$temp_array = array(
					"count" 	=> (int) $row['count'],
					"user"		=> $row['user'],
					"lastlogin"	=> (int) $row['lastlogin']
				);

				$output_array[] = $temp_array;
			} //END foreach
		} //end if
		
		//by_computer
		if( $_GET['query_type'] == 'by_computer' ) {
			$sql="
			SELECT
				count(*) as count,
				computername,
				DATE_FORMAT( max(timestamp),'%Y-%m-%d %h:%i:%s %p') as lastlogin
			FROM
				raw
			WHERE
				event = 3 AND
				computername IN
					(select computername from computernames)
			GROUP BY
				computername;
			";
			$output_array = array();

			foreach ($connection->query($sql) as $row) {
				$temp_array = array(
					"count" 		=> (int) $row['count'],
					"computername"	=> $row['computername'],
					"lastlogin"		=> $row['lastlogin']
				);

				$output_array[] = $temp_array;
			} //END foreach
		} //end if
		//by_floor
		if( $_GET['query_type'] == 'by_floor' ) {
			$sql="
			SELECT
				count(*) as count,
				raw.computername,
                computernames.computer_location
            FROM
            	raw,computernames
            WHERE
            	raw.computername = computernames.computername AND
                event = 2
			
			GROUP BY
				computername
			";
			$output_array = array();

			foreach ($connection->query($sql) as $row) {
				$temp_array = array(
					"count" 		=> (int) $row['count'],
					"computername"	=> $row['computername'],
					"computer_location" => $row['computer_location']
					);

				$output_array[] = $temp_array;
			} //END foreach
		} //end if
		
		//current
		if( $_GET['query_type'] == 'current' ) {
			$sql="
			SELECT 
				r.computername as computer,
				r.event as event,
				DATE_FORMAT(r.timestamp, '%Y-%m-%d %h:%i %p') as timestamp
			FROM
				raw r
			INNER JOIN (
				SELECT
					MAX(id) as id
				FROM
					raw
				GROUP BY
					computername
			) 
			AS maxEventPerComputer
			ON
				r.id = maxEventPerComputer.id
			INNER JOIN
				computernames c
			ON
				(c.computername = r.computername)	
			";
			$output_array = array();

			foreach ($connection->query($sql) as $row) {
				$temp_array = array(
					"computer" 	=> $row['computer'],
					"event"		=> (int) $row['event'],
					"timestamp"	=> $row['timestamp']
				);
				$output_array[] = $temp_array;
			} //END foreach
		} //end if
		
		//close our connection
		$connection = null;

		echo json_encode($output_array);
		
	} //end function doQuery

	doQuery();

?>

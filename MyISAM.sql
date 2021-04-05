MyISAM
======
For MyISAM tables, you can specify AUTO_INCREMENT on a secondary column in a multiple-column index. In this case,
the generated value for the 
AUTO_INCREMENT column is calculated as MAX(auto_increment_column) + 1 WHERE prefix=given-prefix. 
This is useful when you want to put data into ordered groups.

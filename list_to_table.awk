#!/usr/bin/awk -f

# From https://stackoverflow.com/questions/15015860/how-to-transpose-a-list-to-a-table-in-bash
# split lines and use output field separator


BEGIN { FS = " = "; i = 0; h = 0; ofs = ";" }

# empty line - increment item count and skip it
/^\s*$/ { i++ ; next } 

# normal line - add the item to the object and the header to the header list
# and keep track of first seen order of headers
{
   current[i, $1] = $2
   if (!($1 in headers)) {headers_ordered[h++] = $1}
   headers[$1]
}

END {
   h--

   # print headers
   for (k = 0; k <= h; k++)
   {
      printf "%s",headers_ordered[k]
      if (k != h) {printf "%s",ofs}
   } 
   print "" 

   # print the items for each object
   for (j = 0; j <= i; j++)
   {
      for (k = 0; k <= h; k++)
      {
         printf "%s",current[j, headers_ordered[k]]
         if (k != h) {printf "%s",ofs}
      }
      print ""
   }
}
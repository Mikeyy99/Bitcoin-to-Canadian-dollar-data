# Specify the URL of the web page
url="https://coinmarketcap.com/currencies/bitcoin/btc/cad/"

# Use curl to get webpage
curl -s "$url" -o bitpage.html

# Extract the current bitcoin price using grep and sed, the grep command searches for each pattern in the files. $[^<]*</td> is exactly what we are 
# looking for within td. sed cleans up the text we are looking for.
bit_value=$(grep -o '$[^<]*</td>' bitpage.html | sed 's/$//;s/<\/td>//')

# outputs the past 7 days of bitcoin amounts, first one would be todays current amount
echo "Bitcoin price over past 10 days (first is toadys date) (CAD): $bit_value"

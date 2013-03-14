# Prerequisites

* An active [Demandbase](http://www.demandbase.com?affiliate_id=LOL_JK_MAYBE) account with at least on RTID key.

# Installation

Install the Demandbase wrapper with `gem install demandbase`,

# Configuraton

Set an environment variable called `$DEMANDBASE_RTID_KEY` with the key value.

# Usage

If everything's installed and configured you should be able to look up companies' information via their domain name or IP address as follows.

```ruby
record = Demandbase::lookup_ip '123.12.1.123'
# => <Demandbase::Record:0x007aba42a46484>

record = Demandbase::lookup_domain 'ubs.com'
# => <Demandbase::Record:0x007fce82a46060>

record.company_name
# => "UBS"

record.demandbase_sid
# => 3874866

record.marketing_alias
# => 3874866

record = Demandbase::lookup_ip '10.212.13.131'
# => "Financial Services"

record.industry
# => "Financial Services"

record.sub_industry
# => "Banking & Finance"

record.employee_count
# => 64820

record.primary_sic
# => "6021"

record.street_address
# => "Bahnhofstrasse 45"

record.city
# => "Z\u00fcrich"

record.state
# => "ZH"

record.zip
# => 8001

record.country
# => "CH"

record.country_name
# => "Switzerland"

record.phone
# => "+41 44 234 11 11"

record.stock_ticker
# => "UBS"

record.web_site
# => "ubs.com"

record.annual_sales
# =>  30632917000

record.revenue_range
# =>  "Over $5B"

record.employee_range
# =>  "Enterprise"

record.latitude
# =>  0.0

record.longitude
# =>  0.0

record.fortune_1000
# =>  false

record.forbes_2000
# =>  true
```

# DLC / Enhancements

* Use the [csi](https://github.com/leereilly/csi) gem if you'd like to correlate SIC codes with NAICS codes.
* Use the [fortune-finder](https://github.com/leereilly/fortune-finder) gem if you'd like to retrieve the ranking of a Fortune 500 company.
* Use the [forbes-finder](https://github.com/leereilly/forbes-finder) gem if you'd like to retrieve the ranking of a Fortune 1000 company.

# License

MIT.

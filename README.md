The Demandbase gem is a Ruby wrapper for the [Demandbase](http://www.demandbase.com?affiliate_id=LOL_JK_MAYBE) real-time targeting and personalization platform's API.

### Installation

Install the Demandbase wrapper with:

`gem install demandbase`

### Configuraton

Set an environment variable called `DEMANDBASE_RTID_KEY` with the your RTID key value. You can sign up for a trial developer key [here](http://www.demandbase.com/who-is-demandbase/contact-demandbase/?affiliate_id=LOL_JK_MAYBE).

### Usage

#### Domain Lookup

If everything's installed and configured you should be able to look up companies' information via their domain name as follows:

```ruby
record = Demandbase::lookup_domain 'microsoft.com'
# => <Demandbase::Record:0x007fce82a46060>

record.company_name
# => "Microsoft Corporation"

record.is_academic?
# => false

record.is_government?
# => false

record.demandbase_sid
# => 457441

record.marketing_alias
# => "Microsoft"

record.industry
# => "Software & Technology"

record.sub_industry
# => "Software Applications"

record.employee_count
# => 94050

record.primary_sic
# => "7372"

record.street_address
# => "1 Microsoft Way"

record.city
# => "Redmond"

record.state
# => "WA"

record.zip
# => "98052"

record.country
# => "US"

record.country_name
# => "United States"

record.phone
# => "425-882-8080"

record.stock_ticker
# => "MSFT"

record.web_site
# => "microsoft.com"

record.annual_sales
# =>  73723000000

record.revenue_range
# =>  "Over $5B"

record.employee_range
# =>  "Enterprise"

record.b2b
# =>  true

record.b2c
# =>  true

record.traffic
# => "Very High"

record.latitude
# =>  47.6401

record.longitude
# =>  -122.13

record.fortune_1000
# =>  true

record.forbes_2000
# =>  true
```

#### IP Lookup

The IP lookup returns some additional information e.g.

```ruby
record = Demandbase::lookup_ip '12.12.12.12'
# => <Demandbase::Record:0x007fce82a46060>
```

#### Lazy Lookup

If you have an IP, domain name, email address, or craptacular URL and just want to use that use `lookup`

```ruby
ip_looking_thing = '12.12.12.12'
domain_looking_thing 'http://google.com'
url_looking_thing 'www.google.com/lol?seriously=true'
email_looking_thing 'willy@microsoft.com'

(Demandbase::lookup ip_looking_thing).class
# => Demandbase::IPRecord

(Demandbase::lookup domain_looking_thing).class
# => Demandbase::DomainRecord

(Demandbase::lookup url_looking_thing).class
# => Demandbase::DomainRecord

(Demandbase::lookup email_looking_thing).class
# => Demandbase::DomainRecord
```

### DLC / Enhancements

* Use the [csi](https://github.com/leereilly/csi) gem if you'd like to correlate SIC codes with NAICS codes.
* Use the [fortune-finder](https://github.com/leereilly/fortune-finder) gem if you'd like to retrieve the ranking of a Fortune 500 company.
* Use the [forbes-finder](https://github.com/leereilly/forbes-finder) gem if you'd like to retrieve the ranking of a Fortune 1000 company.

# License

MIT.

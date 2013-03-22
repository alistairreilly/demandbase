The Demandbase gem is a Ruby wrapper for the [Demandbase](http://www.demandbase.com?affiliate_id=LOL_JK_MAYBE) real-time targeting and personalization platform's [API](http://wiki.demandbaselabs.com/mwiki/index.php?title=Demandbase_API_Documentation).

### Prerequisites

You'll need an active Demandbase account with at least one Real Time Identification (RTID) key. You can sign up for a trial developer key [here](http://www.demandbase.com/who-is-demandbase/contact-demandbase/?affiliate_id=LOL_JK_MAYBE).

### Installation

Install the Demandbase wrapper with:

`gem install demandbase`

or add the following to your `Gemfile`:

`gem 'demandbase', '~> 0.1.1'`

### Configuraton

Set an environment variable called `$DEMANDBASE_RTID_KEY` with the your RTID key value.

#### Bash Example

```
export DEMANDBASE_RTID_KEY=1234deadbeef4321
```

#### Heroku Example

```
heroku config:add DEMANDBASE_RTID_KEY=1234deadbeef4321
```

### Usage

#### Domain Lookup

If everything's installed and configured you should be able to look up companies' information via their domain name as follows:

```ruby
record = Demandbase::lookup_domain 'microsoft.com'
# => <Demandbase::Record:0x007fce82a46060>

record.company_name
# => "Microsoft Corporation"

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
record = Demandbase::lookup_ip 'microsoft.com'
# => <Demandbase::Record:0x007fce82a46060>
```

#### Lazy Lookup

If you have an IP, domain name, email address, or craptacular URL and just want to use that use `lazy_lookup`

```ruby
ip_looking_thing = '12.12.12.12'
domain_looking_thing 'http://google.com'
url_looking_thing 'www.google.com/lol?seriously=true'
email_looking_thing 'willy@microsoft.com'

(Demandbase::lazy_lookup ip_looking_thing).class
# => Demanbase::IPRecord

(Demandbase::lazy_lookup domain_looking_thing).class
# => Demanbase::DomainRecord

(Demandbase::lazy_lookup url_looking_thing).class
# => Demanbase::DomainRecord

(Demandbase::lazy_lookup email_looking_thing).class
# => Demanbase::DomainRecord
```

### Field Info

<table>
  <tr>
    <th>Field name (click for description)</th>
    <th>DomainRecord Presence?</th>
    <th>IPRecord Presence?</th>
  </tr>

  <tr>
    <td>registry_company_name</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>registry_city</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>registry_state</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>registry_country</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>registry_latitude</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>registry_longitude</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>ip</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>information_level</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>worldhq_sid</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>domestichq_sid</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>hq_sid</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>isp</td>
    <td>:finnadie:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>company_name</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>demandbase_sid</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>marketing_alias</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>industry</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>sub_industry</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>employee_count</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>primary_sic</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>street_address</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>city</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>state</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>zip</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>country</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>country_name</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>phone</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>web_site</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>annual_sales</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>revenue_range</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>employee_range</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>b2b</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>b2c</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>traffic</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>latitude</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>longitude</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>fortune_1000</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

  <tr>
    <td>forbes_2000</td>
    <td>:metal:</td>
    <td>:metal:</td>
  </tr>

</table>

#### Employee Range

<table>
  <tr>
    <th>Value</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Unknown</td>
    <td>:house:</td>
  </tr>
  <tr>
    <td>Small</td>
    <td>:school:1-99 employees</td>
  </tr>
  <tr>
    <td>Mid-Market</td>
    <td>:department_store: 100-999 employees</td>
  </tr>
  <tr>
    <td>Enterprise</td>
    <td>:office: 1000+ employees</td>
  </tr>
</table>

#### Revenue Range

<table>
  <tr>
    <th>Value</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>$1 - $1M</td>
    <td>:credit_card:</td>
  </tr>
  <tr>
    <td>$1M - $5M</td>
    <td>:dollar:</td>
  </tr>
  <tr>
    <td>$5M - $10M</td>
    <td>:dollar: :dollar:</td>
  </tr>
  <tr>
    <td>$10M - $25M</td>
    <td>:dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar:</td>
  </tr>
  <tr>
    <td>$25M - $50M</td>
    <td>:dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar: :dollar:</td>
  </tr>
  <tr>
    <td>$50M - $100M</td>
    <td>:moneybag:</td>
  </tr>
  <tr>
    <td>$100M - $250M</td>
    <td>:moneybag::moneybag:</td>
  </tr>
  <tr>
    <td>$250M - $500M</td>
    <td>:moneybag::moneybag::moneybag:</td>
  </tr>
  <tr>
    <td>$500M - $1B</td>
    <td>:moneybag::moneybag::moneybag::moneybag:</td>
  </tr>
  <tr>
    <td>$1B - $2.5B</td>
    <td>:moneybag::moneybag::moneybag::moneybag::moneybag:</td>
  </tr>
  <tr>
    <td>$2.5B - $5B</td>
    <td>:moneybag::moneybag::moneybag::moneybag::moneybag::moneybag:</td>
  </tr>
  <tr>
    <td>Over $5B</td>
    <td>:money_with_wings:</td>
  </tr>
</table>

#### Audience

<table>
   <tr>
      <th>Company Size</th>
      <th>Vertical</th>
      <th>Origination</th>
   </tr>
   <tr>
      <td>Enterprise<br>Mid-Market<br>SMB</td>
      <td>Government<br>Education</td>
      <td>Wireless<br>Residential<br>SOHO<br>Unknown</td>
   </tr>
</table>

#### Audience Segment

<table>
   <tr>
      <th>Company Size</th>
      <th>Government</th>
      <th>Education</th>
      <th>Wireless</th>
      <th>Residential/SOHO/Unknown</th>
   </tr>
   <tr>
      <td>Industry<br>Search Engine</td>
      <td>Federal<br>International<br>State<br>City<br>Local<br>Military<br>Public Safety</td>
      <td>University<br>K12<br>Vocational<br>Educational Services<br>Educational ISP</td>
      <td>Wireless Device<br>Wireless Hotspot</td>
      <td>Bots</td>
   </tr>
</table>

### DLC / Enhancements

* Use the [csi](https://github.com/leereilly/csi) gem if you'd like to correlate SIC codes with NAICS codes.
* Use the [fortune-finder](https://github.com/leereilly/fortune-finder) gem if you'd like to retrieve the ranking of a Fortune 500 company.
* Use the [forbes-finder](https://github.com/leereilly/forbes-finder) gem if you'd like to retrieve the ranking of a Fortune 1000 company.

# License

MIT.

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
record = Demandbase::lookup 'microsoft.com'
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

### Field Info

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

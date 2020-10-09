
# Gmail account OSINT

## [⬅ Back to Index](../README.md)

---

## Get `@gmail.com` Google ID

ID should look like `101299910324306641283`

### Hangouts Method

1. https://hangouts.google.com/
2. Click `New conversation`
3. Open network tab in developer tools (F12)
4. Look through the queries and locate json that has the email address present
5. Copy the `"personId"` value

### Use online tools to get ID

* <https://tools.epieos.com/google-account.php>

## View public content from that user

Suffix the ID you have to each link and visit:

* Maps reviews and photos - <https://www.google.com/maps/contrib/>
* Public photos - <https://get.google.com/albumarchive/>
* Public drive - <https://drive.google.com/drive/search?q=owner:>
* Youtube channel - <https://www.youtube.com/feeds/videos.xml?user=>

## Bonus

Automated method (using selenium chromedriver) to do the above, however less granularity (cant see their reviews text):

* <https://github.com/mxrch/GHunt>

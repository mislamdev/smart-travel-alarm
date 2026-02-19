// Font Awesome Icons Reference Guide
// Package: font_awesome_flutter ^10.7.0

/*
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
*/

/*
╔══════════════════════════════════════════════════════════════════════════╗
║                    FONT AWESOME ICONS - QUICK REFERENCE                  ║
╚══════════════════════════════════════════════════════════════════════════╝

This package provides 2000+ icons from Font Awesome including:
- Solid icons (default)
- Regular icons
- Brand icons (Google, Facebook, Twitter, etc.)
- Light icons (Pro)
- Duotone icons (Pro)

Usage Examples:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

BASIC USAGE:
  Icon(FontAwesomeIcons.heart)
  FaIcon(FontAwesomeIcons.solidHeart)

WITH CUSTOM SIZE & COLOR:
  FaIcon(
    FontAwesomeIcons.github,
    color: Colors.white,
    size: 24,
  )

═══════════════════════════════════════════════════════════════════════════

BRAND ICONS (Social Media, Tech Companies)
═══════════════════════════════════════════════════════════════════════════

SOCIAL MEDIA:
  FontAwesomeIcons.facebook          // Facebook
  FontAwesomeIcons.facebookF         // Facebook F
  FontAwesomeIcons.instagram         // Instagram
  FontAwesomeIcons.twitter           // Twitter / X
  FontAwesomeIcons.xTwitter          // X (new Twitter logo)
  FontAwesomeIcons.linkedin          // LinkedIn
  FontAwesomeIcons.linkedinIn        // LinkedIn In
  FontAwesomeIcons.youtube           // YouTube
  FontAwesomeIcons.tiktok            // TikTok
  FontAwesomeIcons.snapchat          // Snapchat
  FontAwesomeIcons.pinterest         // Pinterest
  FontAwesomeIcons.reddit            // Reddit
  FontAwesomeIcons.whatsapp          // WhatsApp
  FontAwesomeIcons.telegram          // Telegram
  FontAwesomeIcons.discord           // Discord
  FontAwesomeIcons.slack             // Slack
  FontAwesomeIcons.skype             // Skype
  FontAwesomeIcons.weixin            // WeChat
  FontAwesomeIcons.line              // LINE
  FontAwesomeIcons.viber             // Viber

TECH COMPANIES:
  FontAwesomeIcons.google            // Google
  FontAwesomeIcons.apple             // Apple
  FontAwesomeIcons.microsoft         // Microsoft
  FontAwesomeIcons.amazon            // Amazon
  FontAwesomeIcons.meta              // Meta
  FontAwesomeIcons.netflix           // Netflix
  FontAwesomeIcons.spotify           // Spotify
  FontAwesomeIcons.uber              // Uber
  FontAwesomeIcons.airbnb            // Airbnb
  FontAwesomeIcons.paypal            // PayPal
  FontAwesomeIcons.stripe            // Stripe
  FontAwesomeIcons.salesforce        // Salesforce

DEVELOPMENT / CODE:
  FontAwesomeIcons.github            // GitHub
  FontAwesomeIcons.gitlab            // GitLab
  FontAwesomeIcons.bitbucket         // Bitbucket
  FontAwesomeIcons.stackOverflow     // Stack Overflow
  FontAwesomeIcons.codepen           // CodePen
  FontAwesomeIcons.docker            // Docker
  FontAwesomeIcons.kubernetes        // Kubernetes
  FontAwesomeIcons.aws               // AWS
  FontAwesomeIcons.digitalocean      // DigitalOcean
  FontAwesomeIcons.npm               // npm
  FontAwesomeIcons.node              // Node.js
  FontAwesomeIcons.react             // React
  FontAwesomeIcons.angular           // Angular
  FontAwesomeIcons.vuejs             // Vue.js
  FontAwesomeIcons.python            // Python
  FontAwesomeIcons.java              // Java
  FontAwesomeIcons.js                // JavaScript
  FontAwesomeIcons.php               // PHP
  FontAwesomeIcons.laravel           // Laravel
  FontAwesomeIcons.wordpress         // WordPress
  FontAwesomeIcons.drupal            // Drupal
  FontAwesomeIcons.joomla            // Joomla

FREELANCE / WORK:
  FontAwesomeIcons.upwork            // Upwork
  FontAwesomeIcons.fiverr            // Fiverr
  FontAwesomeIcons.freelancer        // Freelancer
  FontAwesomeIcons.behance           // Behance
  FontAwesomeIcons.dribbble          // Dribbble
  FontAwesomeIcons.figma             // Figma
  FontAwesomeIcons.sketch            // Sketch

E-COMMERCE / PAYMENT:
  FontAwesomeIcons.shopify           // Shopify
  FontAwesomeIcons.woocommerce       // WooCommerce
  FontAwesomeIcons.stripe            // Stripe
  FontAwesomeIcons.paypal            // PayPal
  FontAwesomeIcons.applePay          // Apple Pay
  FontAwesomeIcons.googlePay         // Google Pay
  FontAwesomeIcons.ccVisa            // Visa
  FontAwesomeIcons.ccMastercard      // Mastercard
  FontAwesomeIcons.ccAmex            // American Express
  FontAwesomeIcons.ccPaypal          // PayPal Card
  FontAwesomeIcons.ccStripe          // Stripe Card
  FontAwesomeIcons.bitcoin           // Bitcoin
  FontAwesomeIcons.ethereum          // Ethereum

CONTENT PLATFORMS:
  FontAwesomeIcons.medium            // Medium
  FontAwesomeIcons.dev               // Dev.to
  FontAwesomeIcons.hashnode          // Hashnode
  FontAwesomeIcons.substack          // Substack
  FontAwesomeIcons.blogger           // Blogger
  FontAwesomeIcons.tumblr            // Tumblr

VIDEO / STREAMING:
  FontAwesomeIcons.youtube           // YouTube
  FontAwesomeIcons.twitch            // Twitch
  FontAwesomeIcons.vimeo             // Vimeo
  FontAwesomeIcons.dailymotion       // Dailymotion

GAMING:
  FontAwesomeIcons.steam             // Steam
  FontAwesomeIcons.playstation       // PlayStation
  FontAwesomeIcons.xbox              // Xbox
  FontAwesomeIcons.nintendoSwitch    // Nintendo Switch
  FontAwesomeIcons.unity             // Unity
  FontAwesomeIcons.unreal            // Unreal Engine

COMMUNICATION:
  FontAwesomeIcons.envelope          // Email
  FontAwesomeIcons.phone             // Phone
  FontAwesomeIcons.mobileAlt         // Mobile Phone
  FontAwesomeIcons.comments          // Comments
  FontAwesomeIcons.message           // Message

═══════════════════════════════════════════════════════════════════════════

SOLID ICONS (General Purpose)
═══════════════════════════════════════════════════════════════════════════

USER / PEOPLE:
  FontAwesomeIcons.user              // User
  FontAwesomeIcons.users             // Users
  FontAwesomeIcons.userCircle        // User Circle
  FontAwesomeIcons.userPlus          // Add User
  FontAwesomeIcons.userMinus         // Remove User
  FontAwesomeIcons.userTie           // User Tie (Business)
  FontAwesomeIcons.userGraduate      // Graduate
  FontAwesomeIcons.userShield        // Admin/Security

NAVIGATION:
  FontAwesomeIcons.home              // Home
  FontAwesomeIcons.bars              // Menu
  FontAwesomeIcons.ellipsisV         // Vertical Menu
  FontAwesomeIcons.arrowLeft         // Arrow Left
  FontAwesomeIcons.arrowRight        // Arrow Right
  FontAwesomeIcons.arrowUp           // Arrow Up
  FontAwesomeIcons.arrowDown         // Arrow Down
  FontAwesomeIcons.chevronLeft       // Chevron Left
  FontAwesomeIcons.chevronRight      // Chevron Right
  FontAwesomeIcons.angleDoubleLeft   // Double Arrow Left
  FontAwesomeIcons.angleDoubleRight  // Double Arrow Right

ACTIONS:
  FontAwesomeIcons.search            // Search
  FontAwesomeIcons.plus              // Plus / Add
  FontAwesomeIcons.minus             // Minus / Subtract
  FontAwesomeIcons.times             // Close / X
  FontAwesomeIcons.check             // Check / Tick
  FontAwesomeIcons.trash             // Delete
  FontAwesomeIcons.edit              // Edit
  FontAwesomeIcons.save              // Save
  FontAwesomeIcons.download          // Download
  FontAwesomeIcons.upload            // Upload
  FontAwesomeIcons.share             // Share
  FontAwesomeIcons.copy              // Copy
  FontAwesomeIcons.print             // Print

FILES / DOCUMENTS:
  FontAwesomeIcons.file              // File
  FontAwesomeIcons.fileAlt           // File with text
  FontAwesomeIcons.filePdf           // PDF
  FontAwesomeIcons.fileWord          // Word
  FontAwesomeIcons.fileExcel         // Excel
  FontAwesomeIcons.filePowerpoint    // PowerPoint
  FontAwesomeIcons.fileImage         // Image
  FontAwesomeIcons.fileVideo         // Video
  FontAwesomeIcons.fileAudio         // Audio
  FontAwesomeIcons.fileArchive       // Archive/Zip
  FontAwesomeIcons.fileCode          // Code File
  FontAwesomeIcons.folder            // Folder
  FontAwesomeIcons.folderOpen        // Open Folder

MEDIA:
  FontAwesomeIcons.image             // Image
  FontAwesomeIcons.camera            // Camera
  FontAwesomeIcons.video             // Video
  FontAwesomeIcons.film              // Film
  FontAwesomeIcons.music             // Music
  FontAwesomeIcons.playCircle        // Play
  FontAwesomeIcons.pauseCircle       // Pause
  FontAwesomeIcons.stopCircle        // Stop
  FontAwesomeIcons.volumeUp          // Volume Up
  FontAwesomeIcons.volumeMute        // Mute
  FontAwesomeIcons.microphone        // Microphone
  FontAwesomeIcons.microphoneSlash   // Muted Mic

COMMUNICATION:
  FontAwesomeIcons.envelope          // Email
  FontAwesomeIcons.envelopeOpen      // Open Email
  FontAwesomeIcons.comment           // Comment
  FontAwesomeIcons.comments          // Comments
  FontAwesomeIcons.commentDots       // Comment with dots
  FontAwesomeIcons.phone             // Phone
  FontAwesomeIcons.phoneAlt          // Phone Alt
  FontAwesomeIcons.sms               // SMS
  FontAwesomeIcons.inbox             // Inbox
  FontAwesomeIcons.paperPlane        // Send

LOCATION / MAP:
  FontAwesomeIcons.mapMarkerAlt      // Location Pin
  FontAwesomeIcons.map               // Map
  FontAwesomeIcons.mapMarked         // Marked Map
  FontAwesomeIcons.compass           // Compass
  FontAwesomeIcons.directions        // Directions
  FontAwesomeIcons.route             // Route
  FontAwesomeIcons.locationArrow     // Location Arrow
  FontAwesomeIcons.globeAmericas     // Globe

TIME / CALENDAR:
  FontAwesomeIcons.clock             // Clock
  FontAwesomeIcons.calendar          // Calendar
  FontAwesomeIcons.calendarAlt       // Calendar Alt
  FontAwesomeIcons.calendarDay       // Calendar Day
  FontAwesomeIcons.calendarWeek      // Calendar Week
  FontAwesomeIcons.calendarCheck     // Calendar Check
  FontAwesomeIcons.calendarPlus      // Add to Calendar
  FontAwesomeIcons.hourglass         // Hourglass
  FontAwesomeIcons.stopwatch         // Stopwatch
  FontAwesomeIcons.alarm             // Alarm

SHOPPING / COMMERCE:
  FontAwesomeIcons.shoppingCart      // Shopping Cart
  FontAwesomeIcons.shoppingBag       // Shopping Bag
  FontAwesomeIcons.shoppingBasket    // Shopping Basket
  FontAwesomeIcons.creditCard        // Credit Card
  FontAwesomeIcons.dollarSign        // Dollar
  FontAwesomeIcons.euroSign          // Euro
  FontAwesomeIcons.poundSign         // Pound
  FontAwesomeIcons.yenSign           // Yen
  FontAwesomeIcons.rupeeSign         // Rupee
  FontAwesomeIcons.moneyBill         // Money Bill
  FontAwesomeIcons.wallet            // Wallet
  FontAwesomeIcons.receipt           // Receipt
  FontAwesomeIcons.tag               // Tag
  FontAwesomeIcons.tags              // Tags

SETTINGS / TOOLS:
  FontAwesomeIcons.cog               // Settings
  FontAwesomeIcons.cogs              // Settings Multiple
  FontAwesomeIcons.wrench            // Wrench
  FontAwesomeIcons.screwdriver       // Screwdriver
  FontAwesomeIcons.hammer            // Hammer
  FontAwesomeIcons.toolbox           // Toolbox
  FontAwesomeIcons.sliders           // Sliders
  FontAwesomeIcons.filter            // Filter
  FontAwesomeIcons.adjust            // Adjust

INDICATORS:
  FontAwesomeIcons.star              // Star
  FontAwesomeIcons.heart             // Heart
  FontAwesomeIcons.thumbsUp          // Thumbs Up
  FontAwesomeIcons.thumbsDown        // Thumbs Down
  FontAwesomeIcons.bookmark          // Bookmark
  FontAwesomeIcons.flag              // Flag
  FontAwesomeIcons.bell              // Bell/Notification
  FontAwesomeIcons.exclamation       // Exclamation
  FontAwesomeIcons.exclamationCircle // Exclamation Circle
  FontAwesomeIcons.question          // Question
  FontAwesomeIcons.questionCircle    // Question Circle
  FontAwesomeIcons.info              // Info
  FontAwesomeIcons.infoCircle        // Info Circle
  FontAwesomeIcons.checkCircle       // Check Circle
  FontAwesomeIcons.timesCircle       // Times Circle

TRANSPORTATION:
  FontAwesomeIcons.car               // Car
  FontAwesomeIcons.bus               // Bus
  FontAwesomeIcons.train             // Train
  FontAwesomeIcons.plane             // Plane
  FontAwesomeIcons.ship              // Ship
  FontAwesomeIcons.bicycle           // Bicycle
  FontAwesomeIcons.motorcycle        // Motorcycle
  FontAwesomeIcons.taxi              // Taxi
  FontAwesomeIcons.subway            // Subway
  FontAwesomeIcons.rocket            // Rocket

WEATHER:
  FontAwesomeIcons.sun               // Sun
  FontAwesomeIcons.moon              // Moon
  FontAwesomeIcons.cloud             // Cloud
  FontAwesomeIcons.cloudRain         // Rain
  FontAwesomeIcons.cloudSun          // Partly Cloudy
  FontAwesomeIcons.snowflake         // Snow
  FontAwesomeIcons.bolt              // Lightning
  FontAwesomeIcons.wind              // Wind
  FontAwesomeIcons.umbrella          // Umbrella
  FontAwesomeIcons.rainbow           // Rainbow

HEALTH / MEDICAL:
  FontAwesomeIcons.heartbeat         // Heartbeat
  FontAwesomeIcons.hospitalAlt       // Hospital
  FontAwesomeIcons.plusSquare        // Medical Plus
  FontAwesomeIcons.ambulance         // Ambulance
  FontAwesomeIcons.stethoscope       // Stethoscope
  FontAwesomeIcons.pills             // Pills
  FontAwesomeIcons.syringe           // Syringe
  FontAwesomeIcons.dna               // DNA
  FontAwesomeIcons.virus             // Virus
  FontAwesomeIcons.biohazard         // Biohazard

FOOD / DRINK:
  FontAwesomeIcons.utensils          // Utensils
  FontAwesomeIcons.coffee            // Coffee
  FontAwesomeIcons.pizza             // Pizza
  FontAwesomeIcons.hamburger         // Hamburger
  FontAwesomeIcons.beer              // Beer
  FontAwesomeIcons.wineGlass         // Wine
  FontAwesomeIcons.cocktail          // Cocktail
  FontAwesomeIcons.iceCream          // Ice Cream
  FontAwesomeIcons.appleAlt          // Apple
  FontAwesomeIcons.carrot            // Carrot

SECURITY:
  FontAwesomeIcons.lock              // Lock
  FontAwesomeIcons.unlock            // Unlock
  FontAwesomeIcons.key               // Key
  FontAwesomeIcons.shield            // Shield
  FontAwesomeIcons.shieldAlt         // Shield Alt
  FontAwesomeIcons.fingerprint       // Fingerprint
  FontAwesomeIcons.userSecret        // User Secret
  FontAwesomeIcons.eye               // Eye (Visible)
  FontAwesomeIcons.eyeSlash          // Eye Slash (Hidden)

DEVICES:
  FontAwesomeIcons.desktop           // Desktop
  FontAwesomeIcons.laptop            // Laptop
  FontAwesomeIcons.tablet            // Tablet
  FontAwesomeIcons.mobileAlt         // Mobile Phone
  FontAwesomeIcons.tv                // TV
  FontAwesomeIcons.keyboard          // Keyboard
  FontAwesomeIcons.mouse             // Mouse
  FontAwesomeIcons.gamepad           // Gamepad
  FontAwesomeIcons.headphones        // Headphones
  FontAwesomeIcons.print             // Printer

MISC:
  FontAwesomeIcons.gift              // Gift
  FontAwesomeIcons.trophy            // Trophy
  FontAwesomeIcons.medal             // Medal
  FontAwesomeIcons.award             // Award
  FontAwesomeIcons.certificate       // Certificate
  FontAwesomeIcons.crown             // Crown
  FontAwesomeIcons.gem               // Gem
  FontAwesomeIcons.fire              // Fire
  FontAwesomeIcons.bolt              // Lightning Bolt
  FontAwesomeIcons.magic             // Magic Wand
  FontAwesomeIcons.palette           // Color Palette
  FontAwesomeIcons.brush             // Brush
  FontAwesomeIcons.smile             // Smile
  FontAwesomeIcons.laugh             // Laugh
  FontAwesomeIcons.frown             // Frown
  FontAwesomeIcons.meh               // Meh

═══════════════════════════════════════════════════════════════════════════

HOW TO USE IN YOUR APP
═══════════════════════════════════════════════════════════════════════════

1. Import the package:
   import 'package:font_awesome_flutter/font_awesome_flutter.dart';

2. Use FaIcon widget:
   FaIcon(
     FontAwesomeIcons.github,
     color: Colors.white,
     size: 24,
   )

3. Or use with regular Icon widget:
   Icon(FontAwesomeIcons.heart)

4. For brand icons with proper styling:
   Container(
     padding: EdgeInsets.all(12),
     decoration: BoxDecoration(
       color: Colors.blue,
       borderRadius: BorderRadius.circular(12),
     ),
     child: FaIcon(
       FontAwesomeIcons.facebook,
       color: Colors.white,
       size: 20,
     ),
   )

═══════════════════════════════════════════════════════════════════════════

DOCUMENTATION & RESOURCES
═══════════════════════════════════════════════════════════════════════════

Official Package: https://pub.dev/packages/font_awesome_flutter
Font Awesome Website: https://fontawesome.com/icons
Icon Search: https://fontawesome.com/search

Total Icons Available: 2000+
- Free: 1,600+ icons
- Pro: 7,000+ icons (requires license)

This package includes:
✓ All free Font Awesome 6.x icons
✓ Solid style
✓ Regular style
✓ Brands style
✓ Full Dart type safety
✓ Tree shaking support
✓ Null safety

*/

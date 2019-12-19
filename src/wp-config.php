<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );
/** MySQL database username */
define( 'DB_USER', 'admin' );
/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );
/** MySQL hostname */
define( 'DB_HOST', 'localhost' );
/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );
/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '<HHJs+~,Uf{/71|7M 4O}|{;w(:2d<f]cJGgO5NRJ uE|v=pqPOs|}zV&6 rx<1e' );
define( 'SECURE_AUTH_KEY',  '.c_`{.)LK1z>Z.7w%-Pp75^_90dr$;a05Zm4<}Y/UHz>T:lc2*v)M3f :i[WAS.W' );
define( 'LOGGED_IN_KEY',    '9uk,v]kb0pn#v1GGs4<!=i,oyc/v8[H4DVRlwK7 }bU@O8$El_i_H{4&~b/)mt39' );
define( 'NONCE_KEY',        'w)|O9`VXlnjO=pN~oyr#e3I2`vlH-UzI+GoB!osf,o0>Ikkx4E+Pb}T=`O)J/ypU' );
define( 'AUTH_SALT',        'nC<KkaXn3ND4qQuwrW4V3I{ZH@)*F(<{d_>|Xx_9!=>Pk%KoT]85S5y#>TdD-)3V' );
define( 'SECURE_AUTH_SALT', 'aGXd!3;8VzhN<X~96~o{PrLy?hgxV&Ut,lHB{(qC#+ mD?&|8fap*i$zXtj#.#wU' );
define( 'LOGGED_IN_SALT',   '(Syzj}Uei2npv&uP@7-&~~,wpegd3{ptABEm3c_qZ^l|T{TZGzX-tLSwEu~(<PEj' );
define( 'NONCE_SALT',       '99 f4eLsXGG,z5 K9|AITqfh-J$B<qreyC^9dU{|0#H;I}CTF>p6:0/EP-zg6AA!' );
/**#@-*/
/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';
/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );
/* That's all, stop editing! Happy publishing. */
/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}
/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
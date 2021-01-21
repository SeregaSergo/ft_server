<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://ru.wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'wordpress' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'admin' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'admin' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'localhost' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'a^ZrXkG?_0bj<@GF;s|K{BbM!<D,vfM2<(`OCYeXDWy$J/#y;.WsoY}lE<M}# m|');
define('SECURE_AUTH_KEY',  'm}>Cmee6|}u{40scBIvnDH@H]1oy]X4P}Sjo?D7/?b)9-o5YC7Mk3F9x9){RRATF');
define('LOGGED_IN_KEY',    '^8KpD&_$qo|7zZE|a;@Ic6x:Us-AZ-4+p~KHU,kF>2nC>$hT9Em}|siyH-p*3pHb');
define('NONCE_KEY',        'Oi cxLG@|F#H` -h,-fb88YgO0BS8paPPu+VM|91sg3NrN;T+Xs8`r=LMJHXwgm7');
define('AUTH_SALT',        'k(apbae)afC+%O1f<~8CDF&uq=C~<tD}~@ilM$!RF101FB4zyPmx&=DIt1$0G{Mq');
define('SECURE_AUTH_SALT', 'Zh)ANY.L!u-(hA-lqYiP=n+GkqX}7IR9py~Zn#<QxEcU*5a#WE8]H;<izZf$}^ S');
define('LOGGED_IN_SALT',   'l(](]rirDhlnMJVKsD(DQcEvQ+H*DP9{ Y/|`vcR+6K5XJzW/Jj|+sS?Hwj<}mU&');
define('NONCE_SALT',       '(BvYs-II8$kvBhz+_BX3-LKvidzJoDkX[ZIX1WZb$~LT@~fehWVgS0X0,p<]%gbi');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в документации.
 *
 * @link https://ru.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once ABSPATH . 'wp-settings.php';

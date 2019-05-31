<?php

$pageSlugs     = 'roadmap|sponsors|support|consulting|about|team|testimonials|hosting';
$downloadSlugs = 'linux|windows|tools|docker|stubs';

$config = [
    'app'           => [
        'version'         => '3.4.3',
        'timezone'        => getenv('APP_TIMEZONE'),
        'debug'           => getenv('APP_DEBUG'),
        'env'             => getenv('APP_ENV'),
        'url'             => getenv('APP_URL'),
        'name'            => getenv('APP_NAME'),
        'project'         => getenv('APP_PROJECT'),
        'description'     => getenv('APP_DESCRIPTION'),
        'keywords'        => getenv('APP_KEYWORDS'),
        'repo'            => getenv('APP_REPO'),
        'docs'            => getenv('APP_DOCS'),
        'baseUri'         => getenv('APP_BASE_URI'),
        'staticUrl'       => getenv('APP_STATIC_URL'),
        'lang'            => getenv('APP_LANG'),
        'supportEmail'    => getenv('APP_SUPPORT_EMAIL'),
    ],
    'cache'         => [
        'driver'          => getenv('CACHE_DRIVER'),
        'viewDriver'      => getenv('VIEW_CACHE_DRIVER'),
        'prefix'          => getenv('CACHE_PREFIX'),
        'lifetime'        => getenv('CACHE_LIFETIME'),
    ],
    'memcached'     => [
        'host'            => getenv('MEMCACHED_HOST'),
        'port'            => getenv('MEMCACHED_PORT'),
        'weight'          => getenv('MEMCACHED_WEIGHT'),
    ],
    'logger'        => [
        'defaultFilename' => getenv('LOGGER_DEFAULT_FILENAME'),
        'format'          => getenv('LOGGER_FORMAT'),
        'level'           => getenv('LOGGER_LEVEL'),
    ],
    'google'        => [
        'analytics'       => getenv('GOOGLE_ANALYTICS'),
    ],

    $route['routes'] = [
        [
            'class' => Website\Controllers\UserController::class,
            'methods' => [
                'get' => [
                    '/login' => 'getLoginAction',
                    '/signup' => 'getSignUpAction',
                    '/logout' => 'logoutAction',
                ],
                'post' => [
                    '/register' => 'postRegisterAction',
                    '/login' => 'postLoginAction',
                ],
            ],
        ],
        [
            'class' => Website\Controllers\IndexController::class,
            'methods' => [
                'get' => [
                    '/' => 'indexAction',
                ],
                'post' => [

                ],
            ],
        ],
        [
            'class' => Website\Controllers\CategoryController::class,
            'methods' => [
                'get' => [
                    '/blog/category/list' => 'listCategoryAction',
                    '/blog/category/create' => 'createCategoryAction',
                    '/blog/category/edit/{id}' => 'editCategoryAction',
                ],
                'post' => [
                    '/blog/category/store' => 'storeCategoryAction',
                    '/blog/category/update/{id}' => 'updateCategoryAction',

                ],
                'delete' => [
                    '/blog/category/destroy/{id}' => 'destroyCategoryAction',
                ]
            ],
        ],
        [
            'class' => Website\Controllers\BlogController::class,
            'methods' => [
                'get' => [
                    '/blog/create' => 'createBlogAction',
                    '/blog/list' => 'listBlogAction',
                    '/blog/edit/{id}' => 'editBlogAction',
                    '/api/blog/list' =>'listBlogApiAction',
                    '/api/blog/paginate' =>'listBlogPaginateApiAction'
                ],
                'post' => [
                    '/blog/create' => 'storeBlogAction',
                    '/blog/update/{id}' => 'updateBlogAction',
                ],
                'delete' => [
                    '/blog/destroy/{id}' => 'destroyBlogAction',
                ]
            ],
        ]

    ],

    'middleware'    => [
        [
            'event' => 'before',
            'class' => Website\Middleware\EnvironmentMiddleware::class,
        ],
        [
            'event' => 'before',
            'class' => Website\Middleware\NotFoundMiddleware::class,
        ],
        [
            'event' => 'before',
            'class' => Website\Middleware\RedirectMiddleware::class,
        ],
        [
            'event' => 'before',
            'class' => Website\Middleware\AssetsMiddleware::class,
        ],
        [
            'event' => 'after',
            'class' => Website\Middleware\ViewMiddleware::class,
        ],
    ],



    'sitemap'       => [
        'roadmap',
        'sponsors',
        'support',
        'consulting',
        'about',
        'team',
        'testimonials',
        'hosting',
        'download/linux',
        'download/windows',
        'download/tools',
        'download/docker',
        'download/stubs',
    ]
];
return array_merge($config,$route);

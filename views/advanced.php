<?php

require_once 'lib/class/dia.class.php';

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

$app->match('/advanced', function (Request $request) use ($app, $DEFAULT_PARAMS, $config) {

    global $lang, $texts;

    $collectionData = $DEFAULT_PARAMS['defaultCollectionData'];

    $params = array_merge(
        $app['request']->request->all(),
        $app['request']->query->all()
    );

    $lang = $DEFAULT_PARAMS['lang'];
    if(isset($params['lang']) and $params['lang'] != "") {
        $lang = $params['lang'];
    }

    // translate
    $texts = parse_ini_file(TRANSLATE_PATH . $lang . "/texts.ini", true);

    // output vars
    $output_array = array();
    $output_array['lang'] = $lang;
    $output_array['texts'] = $texts;
    $output_array['collectionData'] = $collectionData;
    
    return $app['twig']->render('advanced.html', $output_array);
    
});

?>
<div class="resultsFor">
    <a href="{$config->home_url}?lang={$lang}">{$texts.BVS_HOME}</a> >
    <a href="{$smarty.server.PHP_SELF}?lang={$lang}">{$texts.SEARCH_HOME}</a>
    {php}
    global $q, $filter, $filter_chain, $filterLabel, $texts;

    // caso tenha filtro inicial e foi informado label mostra na barra de navegacao
    if ($filter != '' && $filterLabel != ''){
        print "> <a href=\"#\" onclick=\"javascript:backHistoryFilter('-2')\">" . $filterLabel . "</a> ";
        if ($q != '') print " > ";
    }
    if ($q != '' && $filterLabel == ''){
        $q = preg_replace("/\+id:.*?$/",$texts['YOUR_SELECTION'],$q);
        $q = str_replace("\\\"","&quot;",$q);

        print "> <a href=\"#\" onclick=\"javascript:backHistoryFilter('-1')\">" . $q . "</a>";
    }

    for($f = 0; $f < count($filter_chain); $f++ ){
        $filterHistory = $filter_chain[$f];
        if ($filterHistory != ""){
            $filterHistorySplit = explode(":", $filterHistory);
            $filterHistoryLabel = stripslashes($filterHistorySplit[1]);
            $filterHistoryLabel = preg_replace("/\"/","", $filterHistoryLabel);

            if ($f == ( count($filter_chain)-1) ){
                print " > " . $filterHistoryLabel;
            }else{
                print " > <a href=\"#\" onclick=\"javascript:backHistoryFilter('" . $f . "')\">" . $filterHistoryLabel . "</a>";
            }
        }
    }
    {/php}
</div>

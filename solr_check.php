<?php
$solr_instance = "<my Solr instance>";
$sorl_port = '8983'
$olr_path = 'http://localhost:' . $sorl_port . '/solr/' . $solr_instance .'/admin/ping/?wt=json'
$curl = curl_init();
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
$output = curl_exec($curl);
$data = json_decode($output, true);
if (empty($data['status'])) {
  echo "Down";
}
else {
echo "Ping Status : ".$data["status"]."\n";
}

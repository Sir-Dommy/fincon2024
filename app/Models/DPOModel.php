<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Http;

class DPOModel extends Model
{
    //lets create request data first
    public static function createPaymentToken($amount){
        $xml_data = '<?xml version="1.0" encoding="utf-8"?>
            <API3G>
            <CompanyToken>'.env('DPO_COMPANY_TOKEN', null).'</CompanyToken>
            <Request>createToken</Request>
            <Transaction>
                <PaymentAmount>1</PaymentAmount>
                <PaymentCurrency>KES</PaymentCurrency>
                <CompanyRef>'.env('DPO_COMPANY_REF', null).'</CompanyRef>
                <RedirectURL>http://www.domain.com/payurl.php</RedirectURL>
                <BackURL>http://www.domain.com/backurl.php</BackURL>
                <CompanyRefUnique>0</CompanyRefUnique>
                <PTL>5</PTL>
            </Transaction>
            <Services>
                <Service>
                <ServiceType>'.env('DPO_SERVICE_TYPE', null).'</ServiceType>
                <ServiceDescription>Flight from Nairobi to Diani</ServiceDescription>
                <ServiceDate>2013/12/20 19:00</ServiceDate>
                </Service>
            </Services>
            </API3G>
        ';
        // <PaymentAmount>'. $amount .'</PaymentAmount>
        $response = DPOModel::makeThePostRequest($xml_data);
        DPOModel::sirLogging(json_encode($response, true));

        // // $payment_token = $response['response']['TransToken'] ?? null;
        // $payment_token = $response['response']['TransToken'] ?? null;

        // if($payment_token == null){
        //     return DPOModel::sirLogging("WAH HAKUNA PAYMENT TOKEN!!!!!!!");
        // }

        // $response2 = DPOModel::verifyPaymentToken($payment_token);

        return $response;

    }

    public static function verifyPaymentToken($payment_token){
        $xml_data = '<?xml version="1.0" encoding="utf-8"?>
            <API3G>
            <CompanyToken>'.env('DPO_COMPANY_TOKEN', null).'</CompanyToken>
            <Request>verifyToken</Request>
            <TransactionToken>'. $payment_token .'</TransactionToken>
            </API3G>
        ';

        return DPOModel::makeThePostRequest($xml_data);
        
    }

    private static function makeThePostRequest($xml_data){
        DPOModel::sirLogging("TRYING TO MAKE A POST");
        $apiUrl = "https://secure.3gdirectpay.com/API/v6/"; 

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($ch, CURLOPT_POST, true);           
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml_data); 

        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: text/xml',
            'Accept: application/xml',
            'Content-Length: ' . strlen($xml_data), 
        ]);

        $response = curl_exec($ch);

        if (curl_errno($ch)) {
            $errorMessage = curl_error($ch);
            curl_close($ch);
            return json_encode(['error' => 'cURL Error: ' . $errorMessage]);
        }

        curl_close($ch);

        try {
            $xmlObject = simplexml_load_string($response, "SimpleXMLElement", LIBXML_NOCDATA);
            $responseArray = json_decode(json_encode($xmlObject), true);

            return $responseArray;
        } catch (\Exception $e) {
            return json_encode(['error' => 'Invalid XML Response', 'message' => $e->getMessage()]);
        }
    }

    // Test logging can be removed after testing --> SIR-DOMMY
    public static function sirLogging($message){
        $path = storage_path('logs/sir.log');
        file_put_contents($path, "[" . now() . "] ". $message . ".\n", FILE_APPEND);

    }
}

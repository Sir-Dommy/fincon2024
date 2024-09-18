<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Http;

class DPOModel extends Model
{
    //lets create request data first
    public static function createPaymentToken($transcode){
        $xml_data = '<?xml version="1.0" encoding="utf-8"?>
            <API3G>
            <CompanyToken>'.env('DPO_COMPANY_TOKEN', null).'</CompanyToken>
            <Request>createToken</Request>
            <Transaction>
                <PaymentAmount>1.00</PaymentAmount>
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
        $response = DPOModel::makeThePostRequest($xml_data);
        DPOModel::sirLogging($response);

        // $payment_token = $response['response']['TransToken'] ?? null;
        $payment_token = $response['response']['TransToken'] ?? null;

        if($payment_token == null){
            return DPOModel::sirLogging("WAH HAKUNA PAYMENT TOKEN!!!!!!!");
        }

        $response2 = DPOModel::verifyPaymentToken($payment_token);

        return $response2;

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
        // Define the API endpoint URL
        $apiUrl = "https://secure.3gdirectpay.com/API/v6/"; // Replace with your API URL

        // Initialize a cURL session
        $ch = curl_init();

        // Set the URL and other options
        curl_setopt($ch, CURLOPT_URL, $apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // Return the response as a string
        curl_setopt($ch, CURLOPT_POST, true);           // This is a POST request
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml_data); // The XML data is the request body

        // Set the headers, including the content type
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: text/xml',
            'Accept: application/xml', // Optionally accept an XML response
            'Content-Length: ' . strlen($xml_data), // Set content length
        ]);

        // Execute the request
        $response = curl_exec($ch);

        // Check if there were any errors
        if (curl_errno($ch)) {
            // Output the cURL error
            $errorMessage = curl_error($ch);
            curl_close($ch);
            return response()->json(['error' => 'cURL Error: ' . $errorMessage], 500);
        }

        // Close the cURL session
        curl_close($ch);

        // Convert the XML response to a PHP array
        try {
            // Load the XML string into a SimpleXMLElement
            $xmlObject = simplexml_load_string($response, "SimpleXMLElement", LIBXML_NOCDATA);
            // Convert the XML object to JSON, then to an associative array
            $responseArray = json_decode(json_encode($xmlObject), true);

            // Return the response as a JSON object
            return response()->json(['response' => $responseArray], 200);
        } catch (\Exception $e) {
            // Handle the case where the XML is invalid or cannot be parsed
            return response()->json(['error' => 'Invalid XML Response', 'message' => $e->getMessage()], 500);
        }
    }

    private static function sirLogging($message){
        $path = storage_path('logs/sir.log');
        file_put_contents($path, "[" . now() . "] ". $message . ".\n", FILE_APPEND);

    }
}

<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

use Square\SquareClient;
use Square\Exceptions\ApiException;
use Square\Environment;
use Square\Models\Money;
use Square\Models\CreatePaymentRequest;

class Payment extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Apimodel');
		$this->load->model('Commonmodel');
		// $this->isLoggedIn();
		require 'vendor/autoload.php';
	}

	public function testInput($data)
	{
		$data = trim($data);
		$data = stripcslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}

	public function createPayment($course_id = null){

        $user_id = $this->session->userdata('user_id');

		$data = json_decode(file_get_contents('php://input'), true);


		$client = new SquareClient([
			'accessToken' => 'EAAAED6ZVeDUinmdr_63zyHSowZMF9yGr2Q3ygxFbYZMwoLinZGjxvRUdFJQ0_bl',
			'environment' => Environment::SANDBOX,
		]);

		try {

			$payments_api = $client->getPaymentsApi();

			$price = ($data['course_price']*100);
			$money = new Money();
			$money->setAmount($price);
			// Set currency to the currency for the location
			$money->setCurrency('USD');
			$orderId = rand(9000,1000);
			
			// Every payment you process with the SDK must have a unique idempotency key.
			// If you're unsure whether a particular payment succeeded, you can reattempt
			// it with the same idempotency key without worrying about double charging
			// the buyer.
			$create_payment_request = new CreatePaymentRequest($data['sourceId'], $orderId, $money);
			
			$response = $payments_api->createPayment($create_payment_request);

			
			if ($response->isSuccess()) {
				$resp_arr = $response->getBody();
				$resp_dec = json_decode($resp_arr, true);

				$status = $resp_dec["payment"]['status'];
				$transid = $resp_dec["payment"]["id"];
				
				$enrollmentData = array(
					'currency' 				    => 'USD',
					'currency_symbol' 		    => '$',
					'course_id' 				=> $data['course_id'],
					'user_id' 				    => $user_id,
					'enrollment_price' 		    => $data['course_price'],
					'transaction_id' 			=> $transid,
					'price_cents' 				=> $price,
					'payment_status'            => $status,
					'order_id'            		=> $orderId,
					// 'enrollment_date' 			=> date('Y-m-d H:i:s')
				);
		
				//insert code
				$lastId = $this->Commonmodel->add_details('course_enrollment', $enrollmentData);
		
				if($lastId) {
					$this->session->set_flashdata('success', 'Thanks! Your enrollment is successfull.');
				} else {
					$this->session->set_flashdata('error', 'Sorry! enrollment is not done.');
				}  

				echo json_encode($response->getResult());
			} else {
				echo json_encode($response->getErrors());
				$this->session->set_flashdata('error', 'Sorry! enrollment is not done.');
			}

		} catch (ApiException $e) {
			// echo "ApiException occurred: <b/>";
			// echo $e->getMessage() . "<p/>";
			$this->session->set_flashdata('error', 'Sorry! enrollment is not done. ApiException occurred!');
		}
     
	}

    public function paymentStatus(){

        $user_id = $this->session->userdata('user_id');

		$data = array(
			'title' => 'Course Enrollment Successfull',
			'page' => 'course',
		);   

		$this->load->view('header', $data);
		$this->load->view('payment-success');
		$this->load->view('footer');
	}

}

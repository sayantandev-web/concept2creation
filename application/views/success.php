<?php
    $user_id = $this->session->userdata('user_id');
    $isLoggedIn = $this->session->userdata('isLoggedIn');
?>
<!-- Main content Start -->
<div class="main-content">
    <!-- Breadcrumbs Start -->
    <div class="rs-breadcrumbs breadcrumbs-overlay">
        <div class="breadcrumbs-img">
            <img src="<?= base_url('assets/images/breadcrumbs/2.jpg') ?>" alt="Breadcrumbs Image">
        </div>
        <div class="breadcrumbs-text white-color">
            <h1 class="page-title">Success</h1>
            <ul>
                <li>
                    <a class="active" href="<?= base_url() ?>">Home</a>
                </li>
                <li>Success</li>
            </ul>
        </div>
    </div>
    <section class="intro-section gray-bg pt-94 pb-100 md-pt-64 md-pb-70">
        <div class="container">
            <div class="row clearfix">
                <!-- Content Column -->
                <div class="col-lg-12 md-mb-50">
                    <div class="content white-bg pt-30 mb-3">
                        <div class="course-overview">
                            <div class="rs-services style2 px-4">
                            <?php
                            require 'vendor/autoload.php';
                            require_once APPPATH."third_party/stripe/init.php";
                            \Stripe\Stripe::setApiKey('sk_test_835fqzvcLuirPvH0KqHeQz9K');
                            $session = \Stripe\Checkout\Session::retrieve($p_id);
                            $stripe = new \Stripe\StripeClient('sk_test_835fqzvcLuirPvH0KqHeQz9K');
                            $pay_data = $stripe->paymentIntents->retrieve($session['payment_intent'],[]);
                            $price = $session['amount_total']/100;
                            if($session['status'] == 'complete') {
                                $course_id = $this->session->userdata('course_id');
                                $user_id = $this->session->userdata('user_id');
                                $enrollment_price = $price;
                                $price_cents = $session['amount_total'];
                                $currency = $session['currency'];
                                $currency_symbol = '$';
                                $payment_status = $session['status'];
                                if($session['status'] == 'complete') {
                                    $payment_status = 'COMPLETED';
                                } else {
                                    $payment_status = 'FAILED';
                                }
                                $transaction_id = $pay_data['charges']['data'][0]['balance_transaction'];
                                $this->db->query("INSERT INTO course_enrollment (`course_id`, `user_id`, `enrollment_price`, `price_cents`, `currency`, `currency_symbol`, `payment_status`, `transaction_id`) VALUES ('$course_id', '$user_id', '$enrollment_price', '$price_cents', '$currency', '$currency_symbol', 'COMPLETED', '$transaction_id');
                                ");
                                if($this->db->insert_id()) { ?>
                                    <div class="heading" style="text-align: center;">
                                        <h4 class="card-title">Payment Successful #<?php echo $transaction_id ; ?></h4>
                                        <p class="card-text">We received your payment on your purchase #<?php echo $transaction_id ; ?>, check your email for more information.</p>
                                        <a href="<?php echo $pay_data['charges']['data'][0]['receipt_url'];?>" target="_blank" style="padding: 0 0 30px 0; display: inline-block;">Generate Invoice</a>
                                    </div>
                            <?php }	}?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
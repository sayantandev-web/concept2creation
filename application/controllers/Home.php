<?php
defined('BASEPATH') or exit('No direct script access allowed');
error_reporting(0);
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class Home extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form', 'url'));
		$this->load->model('Apimodel');
		$this->load->model('Commonmodel');
        $this->load->model('User_model');
        $this->load->library('session');
		require 'vendor/autoload.php';
	}

	public function index() {
		$data = array('title' => 'Home','page' => 'home');
        $getBannerSql = "SELECT * FROM `banner` WHERE `status` = '1' ORDER BY `id` DESC";
        $data['banners'] = $this->db->query($getBannerSql)->result();
        $getHomeCourseListSql = "SELECT * from `homecourse` WHERE `status` = '1' ORDER BY `id` DESC limit 3";
        $data['home_list'] = $this->db->query($getHomeCourseListSql);
        $getcourselistsql = "SELECT * from `courses` WHERE `status` = '1' ORDER BY `id` DESC limit 6";
        $data['list'] = $this->Commonmodel->fetch_all_join($getcourselistsql);
        $getReviewSql = "SELECT `courses`.`id`, `courses`.`heading_1`, `users`.`id`,`users`.`fname`, `users`.`lname`, `users`.`email`, `users`.`image`, `course_reviews`.`review_id`, `course_reviews`.`review_message` FROM `course_reviews` JOIN `courses` ON `courses`.`id` = `course_reviews`.`course_id` JOIN `users` ON `users`.`id` = `course_reviews`.`user_id` GROUP BY `users`.`id` ORDER BY `course_reviews`.`review_date` DESC";
        $data['student_review'] = $this->db->query($getReviewSql)->result();
        $getPartnerListSql = "SELECT * from `gallery` WHERE `status` = '1' ORDER BY `id` DESC";
        $data['partners'] = $this->Commonmodel->fetch_all_join($getPartnerListSql);
        
		$this->load->view('header', $data);
		$this->load->view('home');
		$this->load->view('footer');
	}

	public function about() {
		$data = array('title' => 'About Us','page' => 'about');
        $getAboutDataSql = "SELECT * FROM `cms` WHERE `id` = 1";
        $about_data = $this->db->query($getAboutDataSql);
        $data['aboutData'] = $about_data->result_array();
        $getReviewSql = "SELECT `courses`.`id`, `courses`.`heading_1`, `users`.`id`,`users`.`fname`, `users`.`lname`, `users`.`email`, `users`.`image`, `course_reviews`.`review_id`, `course_reviews`.`review_message` FROM `course_reviews` JOIN `courses` ON `courses`.`id` = `course_reviews`.`course_id` JOIN `users` ON `users`.`id` = `course_reviews`.`user_id` GROUP BY `users`.`id` ORDER BY `course_reviews`.`review_date` DESC";
        $data['student_review'] = $this->db->query($getReviewSql)->result();
		$this->load->view('header', $data);
		$this->load->view('about');
		$this->load->view('footer');
	}


    public function term_conditions() {
		$data = array('title' => 'Terms Of service','page' => 'terms');
        $getAboutDataSql = "SELECT * FROM `cms` WHERE `id` = 12";
        $about_data = $this->db->query($getAboutDataSql);
        $data['termsData'] = $about_data->result_array();

        // print_r($data['termsData']);die;
		$this->load->view('header', $data);
		$this->load->view('terms');
		$this->load->view('footer');
	}

    public function consulting() {
		$data = array('title' => 'Consulting','page' => 'consulting');
        $getConsultDataSql = "SELECT * FROM `cms` WHERE `id` = 21";
        $consult_data = $this->db->query($getConsultDataSql);
        $data['consultData'] = $consult_data->result_array();
		$this->load->view('header', $data);
		$this->load->view('consulting');
		$this->load->view('footer');
	}

	public function courseList() {
		$data = array('title' => 'Course List', 'page' => 'course');
        $getCourseListSql = "SELECT * from `courses` WHERE `status` = '1' ORDER BY `id` DESC";
        $data['list'] = $this->Commonmodel->fetch_all_join($getCourseListSql);
        $data['course_cat'] = $this->db->get('cr_category')->result_array();
		$this->load->view('header', $data);
		$this->load->view('course-list');
		$this->load->view('footer');
	}

    public function searchByInputValue() {
        $input_data = $this->input->post('input_data');
        $getfilteredCourseListSql = "SELECT * from `courses` WHERE `heading_1` like '%".$input_data."%'";
        $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        $html = '';
        if(!empty($filteredCourseList)){
            foreach ($filteredCourseList as $row) {
                if (@$row->image && file_exists('./assets/images/courses/' . @$row->image)) {
                    $image = base_url('assets/images/courses/' . @$row->image);
                } else {
                    $image = base_url('./images/noimage.jpg');
                }
                // Get Average Rating.
                $getAverageRatingSql = "SELECT ROUND(AVG(rating),1) as averageRating FROM `course_reviews` where `course_id` = '" . @$row->id . "'";
                $ratingRow = $this->db->query($getAverageRatingSql)->row();
                $averageRating = @$ratingRow->averageRating;
                $rating = @$ratingRow->averageRating;
                // Total user enroll
                $totalEnrolledSql = "SELECT * FROM `course_enrollment` WHERE `course_id` = '" . @$row->id . "' AND `payment_status` = 'COMPLETED'";
                $totalEnrolledUsr = $this->db->query($totalEnrolledSql)->num_rows();
                $html .= '<div class="col-lg-6 col-md-6 col-sm-6 mb-40"><div class="courses-item"><div class="img-part">';
                $html .= '<img src="'.@$image.'" alt="Course Image..."></div><div class="content-part"><h3 class="title truncate2 m-0">';
                $html .= '<a href="'.base_url('course-detail/'.@$row->id).'">'.strip_tags($row->heading_1).'</a></h3>';
                $html .= '<ul class="meta-part m-0"><li class="user"><img src="'.base_url('user_assets/images/C2C_Home/Tag_Blue.png').'"></li><li><span class="price">$'.number_format($row->price, 2).'</span></li></ul>';
                $html .= '<div class="bottom-part"><div class="info-meta"><ul><li class="ratings"><span class="stars">';
                for ( $i = 1; $i <= 5; $i++ ) {
                    if ( round( $rating - .25 ) >= $i ) {
                        $html .= '<i class="fa fa-star"></i>';
                    } elseif ( round( $rating + .25 ) >= $i ) {
                        $html .= '<i class="fa fa-star-half-o"></i>';
                    } else {
                        $html .= '<i class="fa fa-star-o"></i>';
                    }
                }
                $html .='</span>('.@$averageRating.')</li></ul></div><div class="btn-part"><a href="'.base_url('course-detail/'.@$row->id).'"><span>View Details</span></a></div></div></div></div></div>';
            }
        } else {
            $html = '<div class="col-lg-12 col-md-12 col-sm-12 mb-40" style="text-align : center;"><div class="courses-item">No Data found!</div></div>';
        }
        echo $html;
	}

    public function searchUsingSortBy() {
        if ($this->input->post('sortBy_data') == 'new_first') {
            $getfilteredCourseListSql = "SELECT * FROM `courses` where status = 1 ORDER BY `id` DESC";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        } elseif ($this->input->post('sortBy_data') == 'old_first') {
            $getfilteredCourseListSql = "SELECT * FROM `courses` where status = 1 ORDER BY `id` ASC";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        } elseif ($this->input->post('sortBy_data') == 'most_relevant') {
            $getfilteredCourseListSql = "SELECT COUNT(courses.id) AS total, courses.*, course_enrollment.enrollment_date FROM course_enrollment RIGHT JOIN courses ON course_enrollment.course_id = courses.id WHERE courses.status = 1 GROUP BY courses.id ORDER BY `course_enrollment`.`enrollment_date` ASC";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        } elseif ($this->input->post('sortBy_data') == 'most_popular') {
            $getfilteredCourseListSql = "SELECT COUNT(courses.id) AS total, courses.* FROM course_enrollment JOIN courses ON course_enrollment.course_id = courses.id JOIN course_enrollment_status ON course_enrollment_status.course_id = courses.id WHERE courses.status = 1 GROUP BY courses.id ORDER BY total DESC";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        } elseif ($this->input->post('sortBy_data') == 'top_rated_first') {
            $getfilteredCourseListSql = "SELECT COUNT(courses.id) AS total, SUM(course_reviews.rating), courses.* FROM course_reviews JOIN courses ON course_reviews.course_id = courses.id WHERE courses.status = 1 GROUP BY courses.id ORDER BY `SUM(course_reviews.rating)` DESC";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        } elseif ($this->input->post('sortBy_data') == 'price_high_to_low') {
            $getfilteredCourseListSql = "SELECT * FROM `courses` where status = 1 ORDER BY `price` DeSC";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        } elseif ($this->input->post('sortBy_data') == 'price_low_to_high') {
            $getfilteredCourseListSql = "SELECT * FROM `courses` where status = 1 ORDER BY `price` ASC";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        } else {
            $getfilteredCourseListSql = "SELECT * FROM `courses` where status = 1";
            $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        }
        $html = '';
        if(!empty($filteredCourseList)){
            foreach ($filteredCourseList as $row) {
                if (@$row->image && file_exists('./assets/images/courses/' . @$row->image)) {
                    $image = base_url('assets/images/courses/' . @$row->image);
                } else {
                    $image = base_url('./images/noimage.jpg');
                }
                // Get Average Rating.
                $getAverageRatingSql = "SELECT ROUND(AVG(rating),1) as averageRating FROM `course_reviews` where `course_id` = '" . @$row->id . "'";
                $ratingRow = $this->db->query($getAverageRatingSql)->row();
                $averageRating = @$ratingRow->averageRating;
                $rating = @$ratingRow->averageRating;
                // Total user enroll
                $totalEnrolledSql = "SELECT * FROM `course_enrollment` WHERE `course_id` = '" . @$row->id . "' AND `payment_status` = 'COMPLETED'";
                $totalEnrolledUsr = $this->db->query($totalEnrolledSql)->num_rows();
                $html .= '<div class="col-lg-6 col-md-6 col-sm-6 mb-40"><div class="courses-item"><div class="img-part">';
                $html .= '<img src="'.@$image.'" alt="Course Image..."></div><div class="content-part"><h3 class="title truncate2 m-0">';
                $html .= '<a href="'.base_url('course-detail/'.@$row->id).'">'.strip_tags($row->heading_1).'</a></h3>';
                $html .= '<ul class="meta-part m-0"><li class="user"><img src="'.base_url('user_assets/images/C2C_Home/Tag_Blue.png').'"></li><li><span class="price">$'.number_format($row->price, 2).'</span></li></ul>';
                $html .= '<div class="bottom-part"><div class="info-meta"><ul><li class="ratings"><span class="stars">';
                for ( $i = 1; $i <= 5; $i++ ) {
                    if ( round( $rating - .25 ) >= $i ) {
                        $html .= '<i class="fa fa-star"></i>';
                    } elseif ( round( $rating + .25 ) >= $i ) {
                        $html .= '<i class="fa fa-star-half-o"></i>';
                    } else {
                        $html .= '<i class="fa fa-star-o"></i>';
                    }
                }
                $html .='</span>('.@$averageRating.')</li></ul></div><div class="btn-part"><a href="'.base_url('course-detail/'.@$row->id).'"><span>View Details</span></a></div></div></div></div></div>';
            }
        } else {
            $html = '<div class="col-lg-12 col-md-12 col-sm-12 mb-40" style="text-align : center;"><div class="courses-item">No Data found!</div></div>';
        }
        echo $html;
    }

    public function searchUsingFilterBy() {
        $cat_id = $this->input->post('filterBy_data');
        $getfilteredCourseListSql = "SELECT * FROM `courses` where `cat_id`= $cat_id AND status = 1 ORDER BY `price` ASC";
        $filteredCourseList = $this->Commonmodel->fetch_all_join($getfilteredCourseListSql);
        $html = '';
        if(!empty($filteredCourseList)){
            foreach ($filteredCourseList as $row) {
                if (@$row->image && file_exists('./assets/images/courses/' . @$row->image)) {
                    $image = base_url('assets/images/courses/' . @$row->image);
                } else {
                    $image = base_url('./images/noimage.jpg');
                }
                // Get Average Rating.
                $getAverageRatingSql = "SELECT ROUND(AVG(rating),1) as averageRating FROM `course_reviews` where `course_id` = '" . @$row->id . "'";
                $ratingRow = $this->db->query($getAverageRatingSql)->row();
                $averageRating = @$ratingRow->averageRating;
                $rating = @$ratingRow->averageRating;
                // Total user enroll
                $totalEnrolledSql = "SELECT * FROM `course_enrollment` WHERE `course_id` = '" . @$row->id . "' AND `payment_status` = 'COMPLETED'";
                $totalEnrolledUsr = $this->db->query($totalEnrolledSql)->num_rows();
                $html .= '<div class="col-lg-6 col-md-6 col-sm-6 mb-40"><div class="courses-item"><div class="img-part">';
                $html .= '<img src="'.@$image.'" alt="Course Image..."></div><div class="content-part"><h3 class="title truncate2 m-0">';
                $html .= '<a href="'.base_url('course-detail/'.@$row->id).'">'.strip_tags($row->heading_1).'</a></h3>';
                $html .= '<ul class="meta-part m-0"><li class="user"><img src="'.base_url('user_assets/images/C2C_Home/Tag_Blue.png').'"></li><li><span class="price">$'.number_format($row->price, 2).'</span></li></ul>';
                $html .= '<div class="bottom-part"><div class="info-meta"><ul><li class="ratings"><span class="stars">';
                for ( $i = 1; $i <= 5; $i++ ) {
                    if ( round( $rating - .25 ) >= $i ) {
                        $html .= '<i class="fa fa-star"></i>';
                    } elseif ( round( $rating + .25 ) >= $i ) {
                        $html .= '<i class="fa fa-star-half-o"></i>';
                    } else {
                        $html .= '<i class="fa fa-star-o"></i>';
                    }
                }
                $html .='</span>('.@$averageRating.')</li></ul></div><div class="btn-part"><a href="'.base_url('course-detail/'.@$row->id).'"><span>View Details</span></a></div></div></div></div></div>';
            }
        } else {
            $html = '<div class="col-lg-12 col-md-12 col-sm-12 mb-40" style="text-align : center;"><div class="courses-item">No Data found!</div></div>';
        }
        echo $html;
    }

	public function courseDetail($id) {
		$data = array('title' => 'Course Details', 'page' => 'course');
        $where = array('id'=> $id);
		$data['detail'] = $this->Commonmodel->fetch_row('courses', $where);
		$data['course_id'] = $id;
		$this->load->view('header', $data);
		$this->load->view('course-detail');
		$this->load->view('footer');
	}

    public function courseEnrollment($course_id = null){
        $user_id = $this->session->userdata('user_id');
        $isLoggedIn = $this->session->userdata('isLoggedIn');
		$data = array(
			'title' => 'Course Enrollment',
			'page' => 'course',
		);
        $where = array(
			'id'=> $course_id
		);
        $getUserSql = "SELECT * FROM `users` WHERE `id` = '".$user_id."'";
        $count = $this->db->query($getUserSql)->num_rows();
        $data['usr'] = $this->db->query($getUserSql)->row();
		$data['course'] = $this->Commonmodel->fetch_row('courses', $where);
        $data['course_id'] = @$course_id;
		$this->load->view('header', $data);
		$this->load->view('payment');
		$this->load->view('footer');
	}

    public function checkout() {
        $data['user_id'] = $this->input->post('user_id');
        //$data['course_id'] = $this->input->post('course_id');
        $data['price_key'] = $this->input->post('enrollment');
        $this->session->set_userdata('course_id', $this->input->post('course_id'));
        $this->load->view('header', $data);
		$this->load->view('checkout');
		$this->load->view('footer');
    }

    public function success($id) {
        $data['p_id'] = $id;
        $this->load->view('header');
		$this->load->view('success', $data);
		$this->load->view('footer');
    }

    public function reviewSave() {
		$user_id = $this->session->userdata('user_id');
		$course_id = $this->input->post('course_id');
		$rating = $this->input->post('rating');
        $message = $this->input->post('message');
		$isExitMaterialSql = "SELECT * FROM `course_reviews` WHERE `user_id` = '" . $user_id . "' AND `course_id` = '" . $course_id . "'";
		$isExist = $this->db->query($isExitMaterialSql)->num_rows();
        if($isExist==0) {
            $reviewData = array('course_id' => @$course_id, 'user_id' => @$user_id, 'rating' => @$rating, 'review_message' => @$message, 'review_status' => 1);
            $this->Commonmodel->add_details('course_reviews', $reviewData);
            $getAllReviewSql = "SELECT rev.*, usr.fname, usr.lname from `course_reviews` as rev LEFT JOIN `users` as usr ON usr.id = rev.user_id WHERE `course_id` = '".$course_id."' ORDER BY `review_date` DESC";
            echo $this->db->query($getAllReviewSql)->num_rows();
        } else {
            echo"0";
        }
	}

    public function getAllReviews() {
		$user_id = $this->session->userdata('user_id');
		$course_id = $this->input->post('course_id');
		$getAllReviewSql = "SELECT rev.*, usr.fname, usr.lname from `course_reviews` as rev LEFT JOIN `users` as usr ON usr.id = rev.user_id WHERE `course_id` = '".$course_id."' ORDER BY `review_date` DESC";
        $data['reviewList'] = $this->db->query($getAllReviewSql)->result();
        $this->load->view('ajax-reviews', $data);
	}

	public function contact() {
		$data = array(
			'title' => 'Contact Us',
			'page' => 'contact',
		);
		$this->load->view('header', $data);
		$this->load->view('contact');
		$this->load->view('footer');
	}

    public function email_unsubscribe(){
        $id = $this->uri->segment(2);
        $data = array(
			'title' => 'Email Unsubscribe Page',
			'page' => 'Email Unsubscribe',
            'id'    =>$id
            
		);
       

		$this->load->view('header', $data);
		$this->load->view('email_unsubscibe');
		$this->load->view('footer');
    }

    public function contactFormSubmit() {
		$fname = $this->input->post("name");
        $email = $this->input->post("email");
        $phone = $this->input->post("phone");
        $sub = $this->input->post("subject");
        $msg = $this->input->post("message");
        $address = $this->input->post("address");
        $b_name = $this->input->post("b_name");
        $contactFormData = array ('fname' => $fname, 'email' => $email, 'phone' => $phone, 'subject' => $sub, 'message' => $msg,'address' =>$address,'business_name' =>$b_name);
        $result = $this->Commonmodel->add_details('contacts', $contactFormData);
        $insert_id = $this->db->insert_id();
        if(!empty($insert_id)) {
            $subject = $sub;
            $imagePath = base_url() . 'user_assets/images/C2C_Home/Header_Logo.png';
            $message = "<table style='width=100%;border=0;align=center;cellpadding=0;cellspacing=0'><tbody><tr><td><table class='col-600' style='margin-left:20px;margin-right:20px;border-left:1px solid #dbd9d9;border-right:1px solid #dbd9d9;border-top:2px solid #232323;width=600px;border=0;align=center;cellpadding=0;cellspacing=0'><tbody><tr><td align='left' style='padding:5px 10px;font-family:Raleway,sans-serif;font-size:16px;font-weight:700;color:#2a3a4b'><img src='".$imagePath."' style='max-height: 40px;'></td></tr><tr><td align='left' style='padding:5px 10px;font-family:Raleway,sans-serif;font-size:16px;font-weight:700;color:#2a3a4b'>Dear Team,</td></tr></tbody></table></td></tr><tr><td align='center'><table class='col-600' width='600' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-left:20px;margin-right:20px;border-left:1px solid #dbd9d9;border-right:1px solid #dbd9d9;border-bottom:2px solid #232323'><tbody><tr><td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'></td></tr><tr><td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Name : ".$fname."</p></td></tr>
            
            <tr>
            <td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Email: ".$email."</p></td>
            </tr>
            <tr>
            <td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Phone: ".$phone."</p></td>
            </tr>
            <tr>
            <td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Address: ".$address."</p></td>
            </tr>
            <tr>
            <td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Business name: ".$b_name."</p></td>
            </tr>
            <tr>
            <td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Message: ".nl2br($msg)."</p></td>
            </tr>
            </tbody></table></td></tr></tbody></table>";
            $mail = new PHPMailer(true);
            try {
                //Server settings
                $mail->CharSet = 'UTF-8';
                $mail->SetFrom($email);
                // $mail->AddAddress('goutampaul@goigi.in', 'ContactToCreation');
                $mail->AddAddress($email, 'ContactToCreation');
                $mail->IsHTML(true);
                $mail->Subject = $subject;
                $mail->Body = $message;
                //Send email via SMTP
                $mail->IsSMTP();
                $mail->SMTPAuth   = true;
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Host       = "smtp.gmail.com";
                $mail->Port       = 587; //587 465
                $mail->Username   = "no-reply@goigi.com";
                $mail->Password   = "wj8jeml3eu0z";
                $mail->send();
                // echo 'Message has been sent';
            } catch (Exception $e) {
                $this->session->set_flashdata('error_message', "Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
            }
            echo $msg = "Thank You for Contacting Us";
        } else {
            echo $msg = "Opps, Try again!";
        }
	}


    public function EmailUnsubcribeSubmit() {
        $email = $this->input->post("email");
        $date=date('Y-m-d h:i:s');

        $isExitSql = "SELECT * FROM `email_unsubscribe_list` WHERE `email_id` = '" . $email . "'";
		$isExist = $this->db->query($isExitSql)->num_rows();
        if($isExist==0) {

        $contactFormData = array ('email_id' => $email, 'status' => '0','created_at' =>$date);
        $result = $this->Commonmodel->add_details('email_unsubscribe_list', $contactFormData);
        $insert_id = $this->db->insert_id();
        if(!empty($insert_id)) {
            
            echo $msg = "Email unsubscribe successfully done";
        } else {
            echo $msg = "Opps, Try again!";
        }
    }
    else{
        echo $msg ="0";
    }
	}
    

    public function consultFormSubmit() {
		$fname = $this->input->post("name");
        $email = $this->input->post("email");
        $phone = $this->input->post("phone");
        $msg = $this->input->post("message");
        $consultFormData = array ('fname' => $fname, 'email' => $email, 'phone' => $phone, 'msg' => $msg);
        $result = $this->Commonmodel->add_details('consulting_form', $consultFormData);
        $insert_id = $this->db->insert_id();
        if(!empty($insert_id)) {
            $subject = "Consult With Us";
            $imagePath = base_url() . 'user_assets/images/C2C_Home/Header_Logo.png';
            $message = "<table style='width=100%;border=0;align=center;cellpadding=0;cellspacing=0'><tbody><tr><td><table class='col-600' style='margin-left:20px;margin-right:20px;border-left:1px solid #dbd9d9;border-right:1px solid #dbd9d9;border-top:2px solid #232323;width=600px;border=0;align=center;cellpadding=0;cellspacing=0'><tbody><tr><td align='left' style='padding:5px 10px;font-family:Raleway,sans-serif;font-size:16px;font-weight:700;color:#2a3a4b'><img src='".$imagePath."' style='max-height: 40px;'></td></tr><tr><td align='left' style='padding:5px 10px;font-family:Raleway,sans-serif;font-size:16px;font-weight:700;color:#2a3a4b'>Dear Team,</td></tr></tbody></table></td></tr><tr><td align='center'><table class='col-600' width='600' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-left:20px;margin-right:20px;border-left:1px solid #dbd9d9;border-right:1px solid #dbd9d9;border-bottom:2px solid #232323'><tbody><tr><td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'></td></tr><tr><td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Name : ".$fname."</p></td></tr><tr><td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Email: ".$email."</p></td></tr><tr><td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Phone: ".$phone."</p></td></tr><tr><td align='left' style='padding:5px 10px;font-family:Lato,sans-serif;font-size:16px;color:#444;line-height:24px;font-weight:400'><p style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px'>Message: ".nl2br($msg)."</p></td></tr></tbody></table></td></tr></tbody></table>";
            $mail = new PHPMailer(true);
            try {
                //Server settings
                $mail->CharSet = 'UTF-8';
                $mail->SetFrom($email);
                $mail->AddAddress('sayantan@goigi.in', 'ContactToCreation');
                $mail->IsHTML(true);
                $mail->Subject = $subject;
                $mail->Body = $message;
                //Send email via SMTP
                $mail->IsSMTP();
                $mail->SMTPAuth   = true;
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Host       = "smtp.gmail.com";
                $mail->Port       = 587; //587 465
                $mail->Username   = "no-reply@goigi.com";
                $mail->Password   = "wj8jeml3eu0z";
                $mail->send();
                // echo 'Message has been sent';
            } catch (Exception $e) {
                $this->session->set_flashdata('error_message', "Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
            }
            echo $msg = "Thank You for Contacting Us";
        } else {
            echo $msg = "Opps, Try again!";
        }
	}

	public function register() {
		$data = array(
			'title' => 'Student Registration',
			'page' => 'register',
		);
		$this->load->view('header', $data);
		$this->load->view('register');
		$this->load->view('footer');
	}

	public function login($course_id = null) {
        if ($this->session->has_userdata('isLoggedIn') && $this->session->has_userdata('user_id')):
			redirect(base_url('student-dashboard'),'refresh');
		endif;
        $data = array(
            'title' => 'Sign In',
            'page' => 'Login',
            'course_id' => @$course_id,
        );
		$this->load->view('header', $data);
		$this->load->view('login');
		$this->load->view('footer');
    }

	public function forgotPassword() {
        $data = array(
            'title' => 'Forgot Password',
            'page' => 'forgotpassword',
        );
		$this->load->view('header', $data);
		$this->load->view('forgot-password');
		$this->load->view('footer');
    }

	public function studentRegistration() {
        $email = $this->input->post('email');
        $first_name = $this->testInput($this->input->post('first_name'));
		$last_name = $this->testInput($this->input->post('last_name'));
        $phone_full = $this->input->post('phone_full');
        $phone_code = $this->input->post('phone_code');
        $phone_country = $this->input->post('phone_country');
        $phone_st_country = $this->input->post('phone_st_country');
        $check_email = $this->db->get_where('users', array('email' => $email))->num_rows();
        $check_phone = $this->db->get_where('users', array('phone_full' => $phone_full, 'status' => 1))->num_rows();
        if ($check_email > 0) {
            $this->session->set_flashdata('error', 'The email id you are trying to use is already registered. Please login, or create a new account using a unique email address!');
            redirect(base_url('register'), 'refresh');
        }
        
        /*if ($check_phone > 0) {
            $this->session->set_flashdata('error', 'The Phone you are trying to use is already registered. Please login, or create a new account using a unique phone number!');
            redirect(base_url('register'), 'refresh');
        }*/
        $otp = $this->generate_otp(6);
        if ($check_email == 0) {
            $data = array(
				'currency' => 'USD',
				'currency_symbol' => '$',
                'fname' => $first_name,
				'lname' => $last_name,
                'email' => $email,
                'password' => md5($this->input->post('password')),
                'phone' => $this->input->post('phone'),
                'phone_full' => $phone_full,
                'phone_code' => $phone_code,
                'phone_country' => $phone_country,
                'phone_st_country' => $phone_st_country,
                'otp' => $otp,
				'email_verified' => '0',
				'status' => '0',
                'created_at' => date('Y-m-d H:i:s')
            );
            //insert code
            $lastId = $this->db->insert('users', $data);
            $userid = $this->db->insert_id();
			if($userid) {
				$subject = 'Verify Your Email Address From ConceptToCreation';
				$activationURL = base_url() . "email-verification/" . urlencode(base64_encode($otp));
				$imagePath = base_url() . 'assets/images/logo.png';
				$message = "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>
				<tbody>
				<tr>
				<td align='center'>
				<table class='col-600' width='600' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-left:20px; margin-right:20px; border-left: 1px solid #dbd9d9; border-right: 1px solid #dbd9d9; border-top:2px solid #232323'>
				<tbody>
				<tr>
				<td height='35'></td>
				</tr>
				<tr>
				<td align='left' style='padding:5px 10px;font-family: Raleway, sans-serif; font-size:16px; font-weight: bold; color:#2a3a4b;'><img src='" . $imagePath . "'/></td>
				</tr>
				<tr>
				<td height='35'></td>
				</tr>
				<tr>
				<td align='left' style='padding:5px 10px;font-family: Raleway, sans-serif; font-size:16px; font-weight: bold; color:#2a3a4b;'>Hello ".$first_name.",</td>
				</tr>
				<tr>
				<td height='10'></td>
				</tr>
				<tr>
				<td align='left' style='padding:5px 10px;font-family: Lato, sans-serif; font-size:16px; color:#444; line-height:24px; font-weight: 400;'>
				Thank you for registration on <strong style='font-weight:bold;'>ConceptToCreation</strong>.
				</td>
				</tr>
				</tbody>
				</table>
				</td>
				</tr>
				<tr>
				<td align='center'>
				<table class='col-600' width='600' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-left:20px; margin-right:20px; border-left: 1px solid #dbd9d9; border-right: 1px solid #dbd9d9; border-bottom:2px solid #232323'>
				<tbody>
				<tr>
				<td height='10'></td>
				</tr>
				<tr>
				<td align='left' style='padding:5px 10px;font-family: Lato, sans-serif; font-size:16px; color:#444; line-height:24px; font-weight: 400;'>
				Please click on the below activation link to verify your email address. 
				</td>
				</tr>
				<tr>
				<td height='10'></td>
				</tr>
				<tr>
				<td align='left' style='text-align:center;padding:5px 10px;font-family: Lato, sans-serif; font-size:16px; color:#444; line-height:24px; font-weight: bold;'>
				<a href=" . $activationURL . " target='_blank' style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px;'>click here</a>
				</td>
				</tr>
				<tr>
				<td height='10'></td>
				</tr>
				<tr>
				<td align='left' style='padding:5px 10px;font-family: Lato, sans-serif; font-size:16px; color:#444; line-height:24px; font-weight: bold;'>
				Email: " . $email . "<br/>
				</td>
				</tr>
				<tr>
				<td height='30'></td>
				</tr>
				<tr>
				<td align='left' style='padding:0 10px;font-family: Lato, sans-serif; font-size:16px; color:#232323; line-height:24px; font-weight: 700;'>
				Thank you!
				</td>
				</tr>
				<tr>
				<td align='left' style='padding:0 10px;font-family: Lato, sans-serif; font-size:14px; color:#232323; line-height:24px; font-weight: 700;'>
				Sincerely
				</td>
				</tr>
				<tr>
				<td align='left' style='padding:0 10px;font-family: Lato, sans-serif; font-size:14px; color:#232323; line-height:24px; font-weight: 700;'>
				Team ConceptToCreation 
				</td>
				</tr>
				</tbody>
				</table>
				</td>
				</tr>
				</tbody>
				</table>";
				$mail = new PHPMailer(true);
				try {
					//Server settings
					$mail->CharSet = 'UTF-8';
					$mail->SetFrom('no-reply@goigi.com', 'Localfood-joints');
					$mail->AddAddress($email);
					$mail->IsHTML(true);
					$mail->Subject = $subject;
					$mail->Body = $message;
					//Send email via SMTP
					$mail->IsSMTP();
					$mail->SMTPAuth   = true;
					$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
					$mail->Host       = "smtp.gmail.com";
					$mail->Port       = 587; //587 465
					$mail->Username   = "no-reply@goigi.com";
					$mail->Password   = "wj8jeml3eu0z";
					$mail->send();
					// echo 'Message has been sent';
				} catch (Exception $e) {
					$this->session->set_flashdata('error_message', "Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
					// echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
				}
                /*$this->session->set_userdata('userid', $userid);
				$this->session->set_userdata('cname', $this->input->post('name'));
				$this->session->set_userdata('cemail', $this->input->post('email'));*/
				$msg = "An email has been sent to your email address containing an activation link. Please click on the link to activate your account. If you do not click the link your account will remain inactive and you will not receive further emails. If you do not receive the email within a few minutes, please check your spam folder.";
				$this->session->set_flashdata('success', $msg);
			} else {
				$this->session->set_flashdata('error', 'Opps, Try again!');
			}
            redirect(base_url('register'), 'refresh');
        }
    }

	public function emailVerification($otp=null) {
		if(empty($otp)) {
			$this->session->set_flashdata('error', 'You have not permission to access this page!');
			redirect(base_url('register'), 'refresh');
		}
        // $otp = $this->uri->segment(3);
        $givenotp = base64_decode(urldecode($otp));
        $sql = "SELECT * FROM `users` WHERE otp = '".$givenotp."' AND status = '0' AND `email_verified` = '0'";
        $check = $this->db->query($sql)->num_rows();
        $data = array(
            'title' => 'Account Activation',
        );
        if ($check > 0) {
            $usr = $this->db->query($sql)->row();
            $field_data = array(
                'email_verified' => '1',
                'otp' => '',
                'status' => '1'
            );
            $where = array(
                'id'=>$usr->id
            );
            $result = $this->Commonmodel->update_row('users', $field_data, $where);
            if ($result) {
                $this->session->set_flashdata('success', 'Your Email Address is successfully verified! Your account has been activated successfully. You can now login.');
                // $this->load->view('email-activation', $data);
				redirect(base_url('login'), 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Sorry! There is error verifying your Email Address!');
                redirect(base_url('login'), 'refresh');
            }
        } else {
            $this->session->set_flashdata('error', 'Sorry! Activation link is expired!');
            redirect(base_url('login'), 'refresh');
        }
    }

	public function studentLoginCheck() {
        $email = $this->input->post('email');
        $password = md5($this->input->post('password'));
        $course_id = $this->input->post('course_id');
        $userValid = $this->User_model->usrLoginCheck($email, $password);
        if ($userValid) {
            $user = $this->User_model->getUsrDetails($email);
			$this->session->set_userdata('isLoggedIn', TRUE);
            $this->session->set_userdata('user_id', @$user->id);
            $this->session->set_userdata('first_name', @$user->fname);
            if(@$course_id) {
                $this->session->set_flashdata('success', 'Logged in successfully.');
                redirect(base_url('course-enrollment/'.@$course_id), 'refresh');
            } else {
                $this->session->set_flashdata('success', 'Great! You have logged in successfully.');
                redirect(base_url('student-dashboard'), 'refresh');
            }

        } else {
            $this->session->set_flashdata('error', 'Invalid email/password, Please try again!');
            $data = array(
				'title' => 'Sign In',
				'page' => 'login',
                'course_id' => @$course_id,
			);
			$this->load->view('header', $data);
			$this->load->view('login');
			$this->load->view('footer');
        }
    }

	public function studentPasswordReset() {
        $email = $this->input->post('email');
        $check_email = $this->db->get_where('users', array('email' => $email, 'status' => 1))->num_rows();
        if ($check_email==0) {
            $this->session->set_flashdata('error', 'Email not exist!');
            redirect(base_url('home/forgotPassword'), 'refresh');
        }
        $otp = $this->generate_otp(6);
        if ($check_email>0) {
            $usr = $this->User_model->getUsrDetails($email);
            $name = $usr->fname;
            $user_id = $usr->id;
            $data = array(
                'otp' => $otp
            );
            $where = array(
                'id' => $user_id
            );
            $this->Commonmodel->update_row('users', $data, $where);
            $subject = 'Password reset from ConceptToCreation';
            $url = base_url() . "otp-verification/" . urlencode(base64_encode($otp));
            $imagePath = base_url() . 'assets/images/logo.png';
            $message = "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>
            <tbody>
            <tr>
            <td align='center'>
            <table class='col-600' width='600' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-left:20px; margin-right:20px; border-left: 1px solid #dbd9d9; border-right: 1px solid #dbd9d9; border-top:2px solid #232323'>
            <tbody>
            <tr>
            <td height='35'></td>
            </tr>
            <tr>
            <td align='left' style='padding:5px 10px;font-family: Raleway, sans-serif; font-size:16px; font-weight: bold; color:#2a3a4b;'><img src='" . $imagePath . "'/></td>
            </tr>
            <tr>
            <td height='35'></td>
            </tr>
            <tr>
            <td align='left' style='padding:5px 10px;font-family: Raleway, sans-serif; font-size:16px; font-weight: bold; color:#2a3a4b;'>Hello ".$name.",</td>
            </tr>
            <tr>
            <td height='10'></td>
            </tr>
            </tbody>
            </table>
            </td>
            </tr>
            <tr>
            <td align='center'>
            <table class='col-600' width='600' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-left:20px; margin-right:20px; border-left: 1px solid #dbd9d9; border-right: 1px solid #dbd9d9; border-bottom:2px solid #232323'>
            <tbody>
            <tr>
            <td height='10'></td>
            </tr>
            <tr>
            <td align='left' style='padding:5px 10px;font-family: Lato, sans-serif; font-size:16px; color:#444; line-height:24px; font-weight: 400;'>
            Please click on below link to reset your password.
            </td>
            </tr>
            <tr>
            <td height='10'></td>
            </tr>
            <tr>
            <td align='left' style='text-align:center;padding:5px 10px;font-family: Lato, sans-serif; font-size:16px; color:#444; line-height:24px; font-weight: bold;'>
            <a href=" . $url . " target='_blank' style='background:#232323;color:#fff;padding:10px;text-decoration:none;line-height:24px;'>click here</a>
            </td>
            </tr>
            <tr>
            <td height='10'></td>
            </tr>
            <tr>
            <td height='30'></td>
            </tr>
            <tr>
            <td align='left' style='padding:0 10px;font-family: Lato, sans-serif; font-size:16px; color:#232323; line-height:24px; font-weight: 700;'>
            Thank you!
            </td>
            </tr>
            <tr>
            <td align='left' style='padding:0 10px;font-family: Lato, sans-serif; font-size:14px; color:#232323; line-height:24px; font-weight: 700;'>
            Sincerely
            </td>
            </tr>
            <tr>
            <td align='left' style='padding:0 10px;font-family: Lato, sans-serif; font-size:14px; color:#232323; line-height:24px; font-weight: 700;'>
            Team ConceptToCreation 
            </td>
            </tr>
            </tbody>
            </table>
            </td>
            </tr>
            </tbody>
            </table>";
            $mail = new PHPMailer(true);
            try {
                //Server settings
                $mail->CharSet = 'UTF-8';
                $mail->SetFrom('no-reply@goigi.com', 'ConceptToCreation');
                $mail->AddAddress($email);
                $mail->IsHTML(true);
                $mail->Subject = $subject;
                $mail->Body = $message;
                //Send email via SMTP
                $mail->IsSMTP();
                $mail->SMTPAuth   = true;
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Host       = "smtp.gmail.com";
                $mail->Port       = 587; //587 465
                $mail->Username   = "no-reply@goigi.com";
                $mail->Password   = "wj8jeml3eu0z";
                $mail->send();
            } catch (Exception $e) {
                $this->session->set_flashdata('error_message', "Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
            }
            $msg = "An email has been sent to your email address containing an password reset link. Please click on the link to reset your password.";
            $this->session->set_flashdata('success', $msg);
            redirect(base_url('home/forgotPassword'), 'refresh');
        }
    }

    public function verifyOtp($otp=null) {
        if(empty($otp)) {
			$this->session->set_flashdata('error', 'You have not permission to access this page!');
			redirect(base_url('reset-password'), 'refresh');
		}
        // $otp = $this->uri->segment(3);
        $givenotp = base64_decode(urldecode($otp));
        $sql = "SELECT * FROM `users` WHERE `otp` = '".$givenotp."'";
        $check = $this->db->query($sql)->num_rows();
        $data = array(
            'title' => 'Password reset ',
            'otp' => $givenotp,
        );
        if ($check > 0) {
            $usr = $this->db->query($sql)->row();
            $data['user_id'] = $usr->id;
            $this->load->view('header', $data);
            $this->load->view('reset-password');
            $this->load->view('footer');
        } else {
            $this->session->set_flashdata('error', 'Sorry! Password reset link is expired!');
            $this->load->view('header', $data);
            $this->load->view('reset-password');
            $this->load->view('footer');
        }
    }

    public function resetPwdCust() {
        $user_id = $this->input->post('user_id');
        $otp = $this->input->post('otp');
        $password = $this->input->post('password');
        $sql = "SELECT * FROM `users` WHERE `otp` = '".$otp."' AND `id` = '".$user_id."'";
        $check = $this->db->query($sql)->num_rows();
        $data = array(
            'title' => 'Password reset',
            'otp' => $otp,
        );
        if ($check > 0) {
            $usr = $this->db->query($sql)->row();
            $field_data = array(
                'password' => md5($password),
                'otp' => ''
            );
            $where = array(
                'id'=>$user_id
            );
            $result = $this->Commonmodel->update_row('users', $field_data, $where);
            if ($result) {
                $this->session->set_flashdata('success', 'Your Password is successfully Updated. You can now login.');
                $this->load->view('header', $data);
                $this->load->view('reset-password');
                $this->load->view('footer');
            } else {
                $this->session->set_flashdata('error', 'Sorry! There is error verifying!');
                $this->load->view('header', $data);
                $this->load->view('reset-password');
                $this->load->view('footer');
            }
        } else {
            $this->session->set_flashdata('error', 'Sorry! Password reset link is expired!');
            $this->load->view('header', $data);
            $this->load->view('reset-password');
            $this->load->view('footer');
        }
    }

	public function generate_otp($length) {
        $characters = '0123456789';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

	public function testInput($data) {
		$data = trim($data);
		$data = stripcslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}

	public function passwordReset($email) {
        $data = array(
            'title' => 'Password Reset Page',
        );
        $deCodeEmail = base64_decode($email);
        $sql = "SELECT * FROM `users` WHERE email = '$deCodeEmail'";
        $check = $this->db->query($sql)->num_rows();
        if ($check > 0) {
            $udetail = $this->db->get_where('users', array('email' => $deCodeEmail))->row();
            $userId = @$udetail->userId;
            $data['userId'] = @$udetail->userId;
            // $this->session->set_flashdata('suscess', 'Reset your password!');
        } else {
            $this->session->set_flashdata('error', 'Sorry! There is error verifying your details!');
        }
        $this->load->view('header', $data);
        $this->load->view('password-reset');
        $this->load->view('footer');
    }

    public function savereSetPassword() {
        $this->form_validation->set_rules('userId', 'user Id', 'trim|required');
        if ($this->form_validation->run() == false) {
            echo validation_errors();
        } else {
            $userId = $this->input->post('userId');
            $password = $this->input->post('gpassword');
            $sql = "SELECT * FROM `users` WHERE (userId = '$userId') AND status = '1'";
            $check = $this->db->query($sql)->num_rows();
            if ($check > 0) {
                $udetail = $this->db->get_where('users', array('userId' => $userId))->row();
                if (@$udetail->token == "") {
                    echo "4";
                } else {
                    if ($password != '') {
                        $where = "userId = '$userId'";
                        $updatedata = array(
                            'password' => md5($password),
                            'token' => '',
                        );
                        $this->Apimodel->update_cond("users", $where, $updatedata);
                        echo 1;
                    } else {
                        echo 3;
                    }
                }
            } else {
                echo 2;
            }
        }
    }
}

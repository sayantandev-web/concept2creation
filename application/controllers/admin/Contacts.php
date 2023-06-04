<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
defined('BASEPATH') OR exit('No direct script access allowed');

class Contacts extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->admin_login();
		require 'vendor/autoload.php';

               
	}

	public function index($page=1)
	{

		if(isset($_GET['page'])){
			$page = $_GET['page'];
		}
		$show_per_page = 20;
        $offset = ($page - 1) * $show_per_page;
        $this->data['title'] = 'Contact User Lists';
        $this->data['tab'] = 'contacts';
        $this->data['main'] = admin_view('contact/index');
        $contact = $this->Master_model->getAll($offset, $show_per_page,'contacts');
       
        $this->data['contacts'] = $contact['results'];
        $config['base_url'] = admin_url('contact/index');
        $config['num_links'] = 2;
        $config['uri_segment'] = 4;
        $config['total_rows'] = $contact['total'];
        $config['per_page'] = $show_per_page;
        $config['full_tag_open'] = '<ul class="pagination pagination-sm">';
        $config['full_tag_close'] = '</ul>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['prev_link'] = 'Prev';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['use_page_numbers'] = true;
        $config['use_page_numbers'] = true;
        $config['page_query_string'] = true;
        $config['query_string_segment'] = 'page';
        $config['reuse_query_string'] = true;

        $this->pagination->initialize($config);
        $this->data['paginate'] = $this->pagination->create_links();
		$this->load->view(admin_view('default'),$this->data);

	}
        function delete($id){
                if ($id > 0) {
            $this->Master_model->delete($id,'contacts');
            $this->session->set_flashdata('success', 'row deleted successfully.');
        }
        redirect(admin_url('contacts'));
        }
     public function certificate_apply($page=1)
        {

        if(isset($_GET['page'])){
            $page = $_GET['page'];
        }
        $show_per_page = 20;
        $offset = ($page - 1) * $show_per_page;
        $this->data['title'] = 'Students Applied For certificate';
        $this->data['tab'] = 'cert_apply';
        $this->data['main'] = admin_view('contact/cert_applied');
        $contact = $this->Master_model->getAll($offset, $show_per_page,'cert_payments');
       
        $this->data['contacts'] = $contact['results'];
        $config['base_url'] = admin_url('contact/certificate_apply');
        $config['num_links'] = 2;
        $config['uri_segment'] = 4;
        $config['total_rows'] = $contact['total'];
        $config['per_page'] = $show_per_page;
        $config['full_tag_open'] = '<ul class="pagination pagination-sm">';
        $config['full_tag_close'] = '</ul>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['prev_link'] = 'Prev';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['use_page_numbers'] = true;
        $config['use_page_numbers'] = true;
        $config['page_query_string'] = true;
        $config['query_string_segment'] = 'page';
        $config['reuse_query_string'] = true;

        $this->pagination->initialize($config);
        $this->data['paginate'] = $this->pagination->create_links();
        $this->load->view(admin_view('default'),$this->data);

    }
     function contacts_reply($id=false){


         $this->data['detl']= $detl=$this->db->get_where('contacts',array('id'=>$id))->row();
         if($cmnts=$this->input->post('cmnts')){
         $arr=array('rply_text'=>$cmnts,
            'rply_status'=>1,
            'rply_date'=>date("Y-m-d h:i:s"));

        $htmlContent = "
        <table align='center' style='width:650px; text-align:center; background:#8e88881f;'>
        <tbody>
        <tr style='height:50px;background-color:#ffeabf;'>
        <td valign='middle' style='color:white;'><h2 class='start'>Concept To Creation</h2></td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <table align='center' style='height:380px; color:#000; width:600px;'>
        <tbody>
        <tr>
        <td style='width:8px;'>&nbsp;</td>
        <td align='center' style='font-size:28px;border-top:1px dashed #ccc;' colspan='3'>Hello, ".$detl->fname."</td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <p>".$cmnts."</p>
        
        <br>
        Best Regards,<br>
        Concept To Creation <br><br>
        This is an automated response, please DO NOT reply.
        </td>
        </tr>
        </tbody>
        </table>
        </td>
        </tr>
        </tbody>
        </table>
        ";

    //     $this->load->library('email');
    //     $this->email->set_mailtype("html");
    //     $this->email->from('CCRC Team');
    //     $this->email->to($detl->email);

    //     $this->email->subject('Reply Message From CCRC');

    //     $this->email->message($htmlContent);

    //     if($this->email->send()){
    //    $this->session->set_flashdata('success', 'Replied Successfully');
    //    $this->db->update('contacts',$arr,array('id'=>$id));
    //    redirect(admin_url('contacts'));

    //         }

    $mail = new PHPMailer(true);
    try {
        //Server settings
        $mail->CharSet = 'UTF-8';
        $mail->SetFrom($detl->email);
        $mail->AddAddress($detl->email, 'Reply Email');
        $mail->IsHTML(true);
        $mail->Subject = 'Reply Message From Concepttocreation';
        $mail->Body = $htmlContent;
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
    $this->session->set_flashdata('success', 'Replied Successfully');
    $this->db->update('contacts',$arr,array('id'=>$id));
    redirect(admin_url('contacts'));




        }
    }
    public function view_review($page=1)
    {

        if(isset($_GET['page'])){
            $page = $_GET['page'];
        }
        $show_per_page = 20;
        $offset = ($page - 1) * $show_per_page;
        $this->data['title'] = 'Rating User Lists';
        $this->data['tab'] = 'rv_cont';
        $this->data['main'] = admin_view('contact/review_index');
        $contact = $this->Master_model->getAll($offset, $show_per_page,'review');
      
        $this->data['contacts'] = $contact['results'];
        $config['base_url'] = admin_url('contact/view_review');
        $config['num_links'] = 2;
        $config['uri_segment'] = 4;
        $config['total_rows'] = $contact['total'];
        $config['per_page'] = $show_per_page;
        $config['full_tag_open'] = '<ul class="pagination pagination-sm">';
        $config['full_tag_close'] = '</ul>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['prev_link'] = 'Prev';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['use_page_numbers'] = true;
        $config['use_page_numbers'] = true;
        $config['page_query_string'] = true;
        $config['query_string_segment'] = 'page';
        $config['reuse_query_string'] = true;

        $this->pagination->initialize($config);
        $this->data['paginate'] = $this->pagination->create_links();
        $this->load->view(admin_view('default'),$this->data);

    }
    function review_reply($id=false){

         $this->data['detl']= $detl=$this->db->get_where('review',array('id'=>$id))->row();
         $userd= $this->db->get_where('users',array('id'=>$detl->userid))->row();
         if($cmnts=$this->input->post('cmnts')){
         $arr=array('rply_text'=>$cmnts,
            'rply_status'=>1,
            'rply_date'=>date("Y-m-d h:i:s"));

             $htmlContent = "
        <table align='center' style='width:650px; text-align:center; background:#8e88881f;'>
        <tbody>
        <tr style='height:50px;background-color:#ffeabf;'>
        <td valign='middle' style='color:white;'><h2 class='start'>CCRC</h2></td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <table align='center' style='height:380px; color:#000; width:600px;'>
        <tbody>
        <tr>
        <td style='width:8px;'>&nbsp;</td>
        <td align='center' style='font-size:28px;border-top:1px dashed #ccc;' colspan='3'>Hello, ".$userd->fname."</td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <p>".$cmnts."</p>
        
        <br>
        Best Regards,<br>
        CCRC <br><br>
        This is an automated response, please DO NOT reply.
        </td>
        </tr>
        </tbody>
        </table>
        </td>
        </tr>
        </tbody>
        </table>
        ";

        $this->load->library('email');
        $this->email->set_mailtype("html");
        $this->email->from('CCRC Team');
        $this->email->to($userd->email);

        $this->email->subject('Reply Message From CCRC');

        $this->email->message($htmlContent);

        if($this->email->send()){
       $this->session->set_flashdata('success', 'Replied Successfully');
       $this->db->update('review',$arr,array('id'=>$id));
       redirect(admin_url('contacts/view_review'));

        }
    }
   
    }
 public function certificate_review($page=1) 
    {

        if(isset($_GET['page'])){
            $page = $_GET['page'];
        }
        $show_per_page = 20;
        $offset = ($page - 1) * $show_per_page;
        $this->data['title'] = 'Certificate Verification User Lists';
        $this->data['tab'] = 'cert_contacts';
        $this->data['main'] = admin_view('contact/cert_verification');
        $contact = $this->Master_model->getAll($offset, $show_per_page,'cert_verify');
      
        $this->data['contacts'] = $contact['results'];
        $config['base_url'] = admin_url('contact/certificate_review');
        $config['num_links'] = 2;
        $config['uri_segment'] = 4;
        $config['total_rows'] = $contact['total'];
        $config['per_page'] = $show_per_page;
        $config['full_tag_open'] = '<ul class="pagination pagination-sm">';
        $config['full_tag_close'] = '</ul>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['prev_link'] = 'Prev';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['use_page_numbers'] = true;
        $config['use_page_numbers'] = true;
        $config['page_query_string'] = true;
        $config['query_string_segment'] = 'page';
        $config['reuse_query_string'] = true;

        $this->pagination->initialize($config);
        $this->data['paginate'] = $this->pagination->create_links();
        $this->load->view(admin_view('default'),$this->data);

    }
    public function stay_with_us($page=1)
    {

        if(isset($_GET['page'])){
            $page = $_GET['page'];
        }
        $show_per_page = 20;
        $offset = ($page - 1) * $show_per_page;
        $this->data['title'] = 'Stay in Touch User Lists';
        $this->data['tab'] = 'contacts_stay';
        $this->data['main'] = admin_view('contact/stay_index');
        $contact = $this->Master_model->getAll($offset, $show_per_page,'consulting_form');
       
        $this->data['contacts'] = $contact['results'];
        $config['base_url'] = admin_url('contact/stay_with_us');
        $config['num_links'] = 2;
        $config['uri_segment'] = 4;
        $config['total_rows'] = $contact['total'];
        $config['per_page'] = $show_per_page;
        $config['full_tag_open'] = '<ul class="pagination pagination-sm">';
        $config['full_tag_close'] = '</ul>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['prev_link'] = 'Prev';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['use_page_numbers'] = true;
        $config['use_page_numbers'] = true;
        $config['page_query_string'] = true;
        $config['query_string_segment'] = 'page';
        $config['reuse_query_string'] = true;

        $this->pagination->initialize($config);
        $this->data['paginate'] = $this->pagination->create_links();
        $this->load->view(admin_view('default'),$this->data);

    }
    function stay_delete($id){
       if ($id > 0) {
            $this->Master_model->delete($id,'consulting_form');
            $this->session->set_flashdata('success', 'row deleted successfully.');
        }
        redirect(admin_url('contacts/stay_with_us'));
    }

   function certificate_reply($id=false)
   {
         $this->data['detl']= $detl=$this->db->get_where('cert_verify',array('id'=>$id))->row();
         if($cmnts=$this->input->post('cmnts')){
         $arr=array('rply_text'=>$cmnts,
            'rply_status'=>1,
            'rply_date'=>date("Y-m-d h:i:s"));

        $htmlContent = "
        <table align='center' style='width:650px; text-align:center; background:#8e88881f;'>
        <tbody>
        <tr style='height:50px;background-color:#ffeabf;'>
        <td valign='middle' style='color:white;'><h2 class='start'>CCRC</h2></td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <table align='center' style='height:380px; color:#000; width:600px;'>
        <tbody>
        <tr>
        <td style='width:8px;'>&nbsp;</td>
        <td align='center' style='font-size:28px;border-top:1px dashed #ccc;' colspan='3'>Hello, ".$detl->fname."</td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <p>".$cmnts."</p>
        
        <br>
        Best Regards,<br>
        CCRC <br><br>
        This is an automated response, please DO NOT reply.
        </td>
        </tr>
        </tbody>
        </table>
        </td>
        </tr>
        </tbody>
        </table>
        ";

        $this->load->library('email');
        $this->email->set_mailtype("html");
        $this->email->from('CCRC Team');
        $this->email->to($detl->email);

        $this->email->subject('Cerificate Verification From CCRC');

        $this->email->message($htmlContent);

        if($this->email->send()){
       $this->session->set_flashdata('success', 'Mail Sent Successfully');
       $this->db->update('cert_verify',$arr,array('id'=>$id));
       redirect(admin_url('contacts/certificate_review'));

        }
    }
   
    }
     function stayin_touch_reply($id=false)
     {
        $this->data['detl']= $detl=$this->db->get_where('consulting_form',array('id'=>$id))->row();
         if($cmnts=$this->input->post('cmnts'))
         {
         $arr=array('rply_text'=>$cmnts,
            'rply_status'=>1,
            'rply_date'=>date("Y-m-d h:i:s"));

        $htmlContent = "
        <table align='center' style='width:650px; text-align:center; background:#8e88881f;'>
        <tbody>
        <tr style='height:50px;background-color:#ffeabf;'>
        <td valign='middle' style='color:white;'><h2 class='start'>CCRC</h2></td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <table align='center' style='height:380px; color:#000; width:600px;'>
        <tbody>
        <tr>
        <td style='width:8px;'>&nbsp;</td>
        <td align='center' style='font-size:28px;border-top:1px dashed #ccc;' colspan='3'>Hello, ".$detl->fname."</td>
        </tr>
        <tr>
        <td valign='top' align='center' colspan='2'>
        <p>".$cmnts."</p>
        
        <br>
        Best Regards,<br>
        CCRC <br><br>
        This is an automated response, please DO NOT reply.
        </td>
        </tr>
        </tbody>
        </table>
        </td>
        </tr>
        </tbody>
        </table>
        ";

        // $this->load->library('email');
        // $this->email->set_mailtype("html");
        // $this->email->from('CCRC Team');
        // $this->email->to($detl->email);

        // $this->email->subject('Reply Message From CCRC');

        // $this->email->message($htmlContent);

        //   if($this->email->send()){
        //    $this->session->set_flashdata('success', 'Replied Successfully');
        //    $this->db->update('consulting_form',$arr,array('id'=>$id));
        //    redirect(admin_url('contacts/stay_with_us'));

        //     }

        $mail = new PHPMailer(true);
        try {
            //Server settings
            $mail->CharSet = 'UTF-8';
            $mail->SetFrom($detl->email);
            $mail->AddAddress($detl->email, 'Reply Email');
            $mail->IsHTML(true);
            $mail->Subject = 'Reply Message From Concepttocreation';
            $mail->Body = $htmlContent;
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
        $this->session->set_flashdata('success', 'Replied Successfully');
        $this->db->update('consulting_form',$arr,array('id'=>$id));
        redirect(admin_url('contacts/stay_with_us'));








        }
   
    }
}

/* End of file Contacts.php */
/* Location: ./application/controllers/admin/Contacts.php */
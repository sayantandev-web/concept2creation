<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ConceptToCreation | <?= $title ?></title>
    <link rel="icon" href="<?= base_url('assets/img/favicon.png') ?>" type="image/jpg" sizes="16x16">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<?= site_url('assets/admin/bootstrap/dist/css/bootstrap.min.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/font-awesome/css/font-awesome.min.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/Ionicons/css/ionicons.min.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/css/AdminLTE.min.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/style.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/css/skins/_all-skins.min.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/morris.js/morris.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/jvectormap/jquery-jvectormap.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/bootstrap-daterangepicker/daterangepicker.css') ?>">
    <link rel="stylesheet" href="<?= site_url('assets/admin/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css') ?>">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <!-- jQuery 3 -->
    <script src="<?= site_url('assets/admin/jquery/dist/jquery.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/jquery-ui/jquery-ui.min.js') ?>"></script>
    <script>
    $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<?= site_url('assets/admin/bootstrap/dist/js/bootstrap.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/raphael/raphael.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/morris.js/morris.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/jquery-sparkline1/dist/jquery.sparkline.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/jvectormap1/jquery-jvectormap-1.2.2.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/jvectormap1/jquery-jvectormap-world-mill-en.js') ?>"></script>
    <script src="<?= site_url('assets/admin/jquery-knob/dist/jquery.knob.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/moment/min/moment.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/bootstrap-daterangepicker/daterangepicker.js') ?>"></script>
    <script src="<?= site_url('assets/admin/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/jquery-slimscroll/jquery.slimscroll.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/fastclick/lib/fastclick.js') ?>"></script>
    <script src="<?= site_url('assets/admin/js/adminlte.min.js') ?>"></script>
    <script src="<?= site_url('assets/admin/js/pages/dashboard.js') ?>"></script>
    <script src="<?= site_url('assets/admin/js/demo.js') ?>"></script>
  <!------------- CKEDITOR----------->
    <script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
    <style>
    span.logo-lg h2 {
        margin-top: 7px !important;
    }
    </style>
    <?php
    $aid = $this->session->userdata('userid');
    $rsid = $this->db->get_where('admin', array('id' => $aid, 'status' => 1))->row();
    $getOptionsSql = "SELECT * FROM `options`";
    $optionsList = $this->db->query($getOptionsSql)->result();
    ?>
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <header class="main-header">
            <a href="<?= admin_url('dashboard') ?>" class="logo">
                <span class="logo-mini">
                    <h2 class="start" style="margin-top:10px;"><img src="<?= base_url() ?>uploads/logo/<?php echo $optionsList[0]->option_value?>" alt="logo" style="width:128px;"></h2>
                </span>
                <span class="logo-lg">
                    <h2 class="start"><img src="<?= base_url() ?>uploads/logo/<?php echo $optionsList[0]->option_value?>" alt="logo" style="width:125px;"></h2>
                </span>
            </a>
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"><span class="sr-only">Toggle navigation</span></a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<?= site_url('assets/admin/img/user_ic.png') ?>" class="user-image" alt="User Image">
                                <span class="hidden-xs"><?= $rsid->username ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="user-header" style="height: 135px !important;">
                                    <img src="<?= site_url('assets/admin/img/user_ic.png') ?>" class="img-circle" alt="User Image">
                                    <p><?= $rsid->username ?></p>
                                </li>
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="<?= admin_url('profile') ?>" class="btn btn-default btn-flat">Change Password</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="<?= admin_url('users/logout') ?>" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li><a href="<?= admin_url('settings') ?>"><i class="fa fa-gears"></i></a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <aside class="main-sidebar">
            <section class="sidebar">
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="<?= site_url('assets/admin/img/user_ic.png') ?>" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><?= $rsid->username ?></p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN NAVIGATION</li>

                    <li class="<?= ($tab == 'dashboard') ? 'active' : ''; ?>">
                        <a href="<?= site_url('dashboard') ?>">
                            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                    </li>

                    <li class="treeview <?= ($tab == 'add_member' || $tab == 'members') ? 'active' : ''; ?>">
                        <a href="#">
                            <i class="fa fa-users"></i>
                            <span>Members Management</span>
                            <span class="pull-right-container">
                                <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<?= ($tab == 'add_member') ? 'active' : ''; ?>"><a href="<?= admin_url('members/add') ?>"><i class="fa fa-circle"></i> Add Member</a></li>
                            <li class="<?= ($tab == 'members') ? 'active' : ''; ?>"><a href="<?= admin_url('members') ?>"><i class="fa fa-circle"></i> Member Lists</a></li>
                        </ul>
                    </li>

                    <li class="treeview <?= ($tab == 'add_banner' || $tab == 'banner') ? 'active' : ''; ?>">
                    <a href="javascript:void(0);">
                    <i class="fa fa-picture-o"></i>
                    <span>Banner Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'add_banner') ? 'active' : ''; ?>"><a href="<?= admin_url('banner/add') ?>"><i class="fa fa-circle"></i> Add Banner</a></li>
                    <li class="<?= ($tab == 'banner') ? 'active' : ''; ?>"><a href="<?= admin_url('banner') ?>"><i class="fa fa-circle"></i> Banner Lists</a></li>
                    </ul>
                    </li>

                    <li class="treeview <?= ($tab == 'add_homecourse' || $tab == 'homecourse') ? 'active' : ''; ?>">
                    <a href="javascript:void(0);">
                    <i class="fa fa-picture-o"></i>
                    <span>Home Courses Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'add_homecourse') ? 'active' : ''; ?>"><a href="<?= admin_url('homecourse/add') ?>"><i class="fa fa-circle"></i> Add Home Courses</a></li>
                    <li class="<?= ($tab == 'homecourse') ? 'active' : ''; ?>"><a href="<?= admin_url('homecourse') ?>"><i class="fa fa-circle"></i> Home Courses Lists</a></li>
                    </ul>
                    </li>

                    <li class="treeview <?= ($tab == 'add_comp' || $tab == 'comp_list' || $tab == 'cat_list' || $tab == 'v_chapter' || $tab == 'ad_chapter' || $tab == 'v_mat' || $tab == 'ad_comp_chapter' || $tab == 'v_comp_chapter' || $tab == 'add_cat') ? 'active' : ''; ?>">
                        <a href="#">
                            <i class="fa fa-book"></i>
                            <span>Course Management </span>
                            <span class="pull-right-container">
                                <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                            </span>
                        </a>
                    <ul class="treeview-menu">
                        <li class="<?= ($tab == 'add_cat') ? 'active' : ''; ?>">
                            <a href="<?= admin_url('course/category_add') ?>"><i class="fa fa-circle"></i> Add Category </a>
                        </li>
                        <li class="<?= ($tab == 'cat_list') ? 'active' : ''; ?>">
                            <a href="<?= admin_url('course/category') ?>"><i class="fa fa-circle"></i> Category Lists</a>
                        </li>
                        <li class="<?= ($tab == 'add_comp') ? 'active' : ''; ?>">
                            <a href="<?= admin_url('course/add_course') ?>"><i class="fa fa-circle"></i> Add Course</a>
                        </li>
                        <li class="<?= ($tab == 'comp_list') ? 'active' : ''; ?>">
                            <a href="<?= admin_url('course/course_list') ?>"><i class="fa fa-circle"></i> Course Lists</a>
                        </li>
                    </ul>
                    </li>
                    <!-- <li class="treeview <?= ($tab == 'add_cert' || $tab == 'cert_list' || $tab == 'cat_list' || $tab == 'ad_chapter' || $tab == 'v_mat' || $tab == 'ad_cert_chapter' || $tab == 'v_cert_chapter') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-book"></i>
                    <span>Certificate Courses</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                    <li class="<?= ($tab == 'add_cert') ? 'active' : ''; ?>"><a href="<?= admin_url('course/add_certif_course') ?>"><i class="fa fa-circle"></i> Add Course</a></li>
                    <li class="<?= ($tab == 'cert_list') ? 'active' : ''; ?>"><a href="<?= admin_url('course/certificate_courses') ?>"><i class="fa fa-circle"></i> Course Lists</a></li>

                    </ul>
                    </li> -->
                    <!-- <li class="treeview <?= ($tab == 'add_qz_bank' || $tab == 'ques_list' || $tab == 'ex_set' || $tab == 'ex_set_list' || $tab == 'add_blk_ques') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-file"></i>
                    <span>Question Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'add_blk_ques') ? 'active' : ''; ?>"><a href="<?= admin_url('question/addbulkquestions') ?>"><i class="fa fa-circle"></i> Add a question</a></li>
                    <li class="<?= ($tab == 'add_qz_bank') ? 'active' : ''; ?>"><a href="<?= admin_url('question/add') ?>"><i class="fa fa-circle"></i> Add Question</a></li>
                    <li class="<?= ($tab == 'ques_list') ? 'active' : ''; ?>"><a href="<?= admin_url('question') ?>"><i class="fa fa-circle"></i> Question Lists</a></li>
                    <li class="<?= ($tab == 'ex_set') ? 'active' : ''; ?>"><a href="<?= admin_url('question/set_exam') ?>"><i class="fa fa-circle"></i> Set Exam Test</a></li>
                    <li class="<?= ($tab == 'ex_set_list') ? 'active' : ''; ?>"><a href="<?= admin_url('question/set_exam_list') ?>"><i class="fa fa-circle"></i> Set Exam Test Lists</a></li>

                    </ul>
                    </li> -->
                    <!--<li class="treeview <?= ($tab == 'add_subscr' || $tab == 'subscr_list' || $tab == 'cat_list' || $tab == 'v_chapter' || $tab == 'ad_chapter' || $tab == 'v_mat' || $tab == 'ad_sub_chapter') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-book"></i>
                    <span>Subscriptions </span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                    <li class="<?= ($tab == 'add_subscr') ? 'active' : ''; ?>"><a href="<?= admin_url('course/add_subscription') ?>"><i class="fa fa-circle"></i> Add Course</a></li>
                    <li class="<?= ($tab == 'subscr_list') ? 'active' : ''; ?>"><a href="<?= admin_url('course/subscription_courses') ?>"><i class="fa fa-circle"></i> Course Lists</a></li>

                    </ul>
                    </li>-->
                    <li class="treeview <?= ($tab == 'add_cms' || $tab == 'cms') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-cog"></i>
                    <span>CMS Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <!-- <li class="<?= ($tab == 'add_cms') ? 'active' : ''; ?>"><a href="<?= admin_url('cms/add') ?>"><i class="fa fa-circle"></i> Add CMS</a></li> -->
                    <li class="<?= ($tab == 'cms') ? 'active' : ''; ?>"><a href="<?= admin_url('cms') ?>"><i class="fa fa-circle"></i> CMS Lists</a></li>
                    </ul>
                    </li>
                    <li class="treeview <?= ($tab == 'add_teams' || $tab == 'teams') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-users"></i>
                    <span>Team Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'add_teams') ? 'active' : ''; ?>"><a href="<?= admin_url('teams/add') ?>"><i class="fa fa-circle"></i> Add Team </a></li>
                    <li class="<?= ($tab == 'teams') ? 'active' : ''; ?>"><a href="<?= admin_url('teams') ?>"><i class="fa fa-circle"></i>Team Lists</a></li>
                    </ul>
                    </li>
                    <li class="treeview <?= ($tab == 'add_blog' || $tab == 'blog') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-newspaper-o"></i>
                    <span>Media Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'add_blog') ? 'active' : ''; ?>"><a href="<?= admin_url('blog/add') ?>"><i class="fa fa-circle"></i> Add Media</a></li>
                    <li class="<?= ($tab == 'blog') ? 'active' : ''; ?>"><a href="<?= admin_url('blog') ?>"><i class="fa fa-circle"></i> Media Lists</a></li>

                    </ul>
                    </li>

                    <li class="treeview <?= ($tab == 'faqs') ? 'active' : ''; ?> ">
                    <a href="#">
                    <i class="fa fa-user"></i>
                    <span>FAQ Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'add_faq') ? 'active' : ''; ?>"><a href="<?= admin_url('faqs/add') ?>"><i class="fa fa-circle"></i> Add Faq</a></li>
                    <li class="<?= ($tab == 'faqs') ? 'active' : ''; ?>"><a href="<?= admin_url('faqs') ?>"><i class="fa fa-circle"></i> Faq Lists</a></li>
                    </ul>
                    </li>
                    <!-- <li class="treeview <?= ($tab == 'add_testimonials' || $tab == 'testimonials') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-user"></i>
                    <span>Testimonial Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'add_testimonials') ? 'active' : ''; ?>"><a href="<?= admin_url('testimonials/add') ?>"><i class="fa fa-circle"></i> Add Testimonial</a></li>
                    <li class="<?= ($tab == 'testimonials') ? 'active' : ''; ?>"><a href="<?= admin_url('testimonials') ?>"><i class="fa fa-circle"></i> Testimonial Lists</a></li>
                    </ul>
                    </li> -->

                    <li class="treeview <?= ($tab == 'gallery' || $tab == 'ad_gallery') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-image"></i>
                    <span>Partner Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <li class="<?= ($tab == 'ad_gallery') ? 'active' : ''; ?>"><a href="<?= admin_url('Partner/add') ?>"><i class="fa fa-circle"></i> Add Partner</a></li>
                    <li class="<?= ($tab == 'gallery') ? 'active' : ''; ?>"><a href="<?= admin_url('Partner') ?>"><i class="fa fa-circle"></i> Partner Lists</a></li>
                    </ul>
                    </li>
                    <li class="treeview <?= ($tab == 'cert_apply' || $tab == 'rv_cont' || $tab == 'contacts' || $tab == 'cert_contacts' || $tab == 'contacts_stay') ? 'active' : ''; ?>">
                    <a href="#">
                    <i class="fa fa-envelope"></i>
                    <span>Contact Management</span>
                    <span class="pull-right-container">
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                    </span>
                    </a>
                    <ul class="treeview-menu">
                    <!-- <li class="<?= ($tab == 'cert_apply') ? 'active' : ''; ?>"><a href="<?= admin_url('contacts/certificate_apply') ?>"><i class="fa fa-circle"></i> Applied For Certificate</a></li>
                    <li class="<?= ($tab == 'rv_cont') ? 'active' : ''; ?>"><a href="<?= admin_url('contacts/view_review') ?>"><i class="fa fa-circle"></i> Review Management</a></li> -->
                    <li class="<?= ($tab == 'contacts') ? 'active' : ''; ?> "><a href="<?= admin_url('contacts') ?>"><i class="fa fa-circle"></i> <span>Contact Form</span></a></li>
                    <li class="<?= ($tab == 'contacts_stay') ? 'active' : ''; ?> "><a href="<?= admin_url('contacts/stay_with_us') ?>"><i class="fa fa-circle"></i> <span>Consult With Us</span></a></li>
                    <!-- <li class="<?= ($tab == 'cert_contacts') ? 'active' : ''; ?> ">
                    <a href="<?= admin_url('contacts/certificate_review') ?>">
                    <i class="fa fa-circle"></i> <span>Certificate Verification List</span>
                    </a>
                    </li> -->
                    </ul>
                    </li>

                    <!-- <li class="<?= ($tab == 'option') ? 'active' : ''; ?>">
                    <a href="<?= admin_url('option') ?>"><i class="fa fa-bolt"></i>Solution Management</a>
                    </li> -->
                    <li class="<?= ($tab == 'add_service' || $tab == 'service') ? 'active' : ''; ?>">
                    <a href="<?= admin_url('settings') ?>"><i class="fa fa-wrench"></i> Settings</a>
                    </li>

                    <li class="<?= ($tab == 'email_unsubscribe') ? 'active' : ''; ?>"><a href="<?= admin_url('settings/email_unsubscribe_list') ?>"><i class="fa fa-circle"></i> Email Subscribe List</a></li>
                    </ul>
        </section>
        <!-- /.sidebar -->
        </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->


      <?php $this->load->view($main); ?>

    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">

      <strong>Copyright &copy; <?= date('Y') ?> <a href="https://dev.igiapp.com/concepttocreation">ConceptToCreation</a>.</strong> All rights
      reserved.
    </footer>
    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->

<style>
.red {
color: #dc3545;
}

#output_image {
width: 60px;
height: 60px;
object-fit: cover;
border: 1px solid #ccc;
padding: 2px;
border-radius: 5px;
margin-top: 0;
}

.error {
width: 100%;
margin-top: .25rem;
font-size: .875em;
color: #dc3545;
}

.invalid-feedback {
width: 100%;
margin-top: .25rem;
font-size: 80%;
color: #dc3545;
font-weight: 500;
}

.is-invalid {
border-color: #dc3545 !important;
}

.truncate {
width: 150px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
}

.truncate_desc {
width: 200px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
}

.truncate_name {
width: 100px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
}

.checkbox.checbox-switch label,
.checkbox-inline.checbox-switch {
display: inline-block;
position: relative;
padding-left: 0;
}

.checkbox.checbox-switch label input,
.checkbox-inline.checbox-switch input {
display: none;
}

.checkbox.checbox-switch label span,
.checkbox-inline.checbox-switch span {
width: 35px;
border-radius: 20px;
height: 18px;
border: 1px solid #dbdbdb;
background-color: rgb(255, 255, 255);
border-color: rgb(223, 223, 223);
box-shadow: rgb(223, 223, 223) 0px 0px 0px 0px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s;
display: inline-block;
vertical-align: middle;
margin-right: 5px;
}

.checkbox.checbox-switch label span:before,
.checkbox-inline.checbox-switch span:before {
display: inline-block;
width: 16px;
height: 16px;
border-radius: 50%;
background: rgb(255, 255, 255);
content: " ";
top: 0;
position: relative;
left: 0;
transition: all 0.3s ease;
box-shadow: 0 1px 4px rgba(0, 0, 0, 0.4);
}

.checkbox.checbox-switch label>input:checked+span:before,
.checkbox-inline.checbox-switch>input:checked+span:before {
left: 17px;
}


/* Switch Default */
.checkbox.checbox-switch label>input:checked+span,
.checkbox-inline.checbox-switch>input:checked+span {
background-color: rgb(180, 182, 183);
border-color: rgb(180, 182, 183);
box-shadow: rgb(180, 182, 183) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch label>input:checked:disabled+span,
.checkbox-inline.checbox-switch>input:checked:disabled+span {
background-color: rgb(220, 220, 220);
border-color: rgb(220, 220, 220);
box-shadow: rgb(220, 220, 220) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch label>input:disabled+span,
.checkbox-inline.checbox-switch>input:disabled+span {
background-color: rgb(232, 235, 238);
border-color: rgb(255, 255, 255);
}

.checkbox.checbox-switch label>input:disabled+span:before,
.checkbox-inline.checbox-switch>input:disabled+span:before {
background-color: rgb(248, 249, 250);
border-color: rgb(243, 243, 243);
box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
}

/* Switch Light */
.checkbox.checbox-switch.switch-light label>input:checked+span,
.checkbox-inline.checbox-switch.switch-light>input:checked+span {
background-color: rgb(248, 249, 250);
border-color: rgb(248, 249, 250);
box-shadow: rgb(248, 249, 250) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

/* Switch Dark */
.checkbox.checbox-switch.switch-dark label>input:checked+span,
.checkbox-inline.checbox-switch.switch-dark>input:checked+span {
background-color: rgb(52, 58, 64);
border-color: rgb(52, 58, 64);
box-shadow: rgb(52, 58, 64) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch.switch-dark label>input:checked:disabled+span,
.checkbox-inline.checbox-switch.switch-dark>input:checked:disabled+span {
background-color: rgb(100, 102, 104);
border-color: rgb(100, 102, 104);
box-shadow: rgb(100, 102, 104) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

/* Switch Success */
.checkbox.checbox-switch.switch-success label>input:checked+span,
.checkbox-inline.checbox-switch.switch-success>input:checked+span {
background-color: rgb(40, 167, 69);
border-color: rgb(40, 167, 69);
box-shadow: rgb(40, 167, 69) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch.switch-success label>input:checked:disabled+span,
.checkbox-inline.checbox-switch.switch-success>input:checked:disabled+span {
background-color: rgb(153, 217, 168);
border-color: rgb(153, 217, 168);
box-shadow: rgb(153, 217, 168) 0px 0px 0px 8px inset;
}

/* Switch Danger */
.checkbox.checbox-switch.switch-danger label>input:checked+span,
.checkbox-inline.checbox-switch.switch-danger>input:checked+span {
background-color: rgb(200, 35, 51);
border-color: rgb(200, 35, 51);
box-shadow: rgb(200, 35, 51) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch.switch-danger label>input:checked:disabled+span,
.checkbox-inline.checbox-switch.switch-danger>input:checked:disabled+span {
background-color: rgb(216, 119, 129);
border-color: rgb(216, 119, 129);
box-shadow: rgb(216, 119, 129) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

/* Switch Primary */
.checkbox.checbox-switch.switch-primary label>input:checked+span,
.checkbox-inline.checbox-switch.switch-primary>input:checked+span {
background-color: rgb(0, 105, 217);
border-color: rgb(0, 105, 217);
box-shadow: rgb(0, 105, 217) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch.switch-primary label>input:checked:disabled+span,
.checkbox-inline.checbox-switch.switch-primary>input:checked:disabled+span {
background-color: rgb(109, 163, 221);
border-color: rgb(109, 163, 221);
box-shadow: rgb(109, 163, 221) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

/* Switch Info */
.checkbox.checbox-switch.switch-info label>input:checked+span,
.checkbox-inline.checbox-switch.switch-info>input:checked+span {
background-color: rgb(23, 162, 184);
border-color: rgb(23, 162, 184);
box-shadow: rgb(23, 162, 184) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch.switch-info label>input:checked:disabled+span,
.checkbox-inline.checbox-switch.switch-info>input:checked:disabled+span {
background-color: rgb(102, 192, 206);
border-color: rgb(102, 192, 206);
box-shadow: rgb(102, 192, 206) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

/* Switch Warning */
.checkbox.checbox-switch.switch-warning label>input:checked+span,
.checkbox-inline.checbox-switch.switch-warning>input:checked+span {
background-color: rgb(255, 193, 7);
border-color: rgb(255, 193, 7);
box-shadow: rgb(255, 193, 7) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}

.checkbox.checbox-switch.switch-warning label>input:checked:disabled+span,
.checkbox-inline.checbox-switch.switch-warning>input:checked:disabled+span {
background-color: rgb(226, 195, 102);
border-color: rgb(226, 195, 102);
box-shadow: rgb(226, 195, 102) 0px 0px 0px 8px inset;
transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;
}
</style>
<!-- <link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.css" rel="stylesheet"> -->
<link href="<?= base_url('assets/sweetalert/sweetalert.css') ?>" rel="stylesheet" type="text/css">
<script src="<?= base_url('assets/sweetalert/sweetalert.min.js') ?>"></script>
<script src="<?= base_url('assets/sweetalert/jquery.sweet-alert.custom.js') ?>"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js" type="text/javascript"></script>
<script>
    function alert_func(data) {
        swal({
            type: data[1],
            title: data[0],
        });
    }

    function preview_image(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var output = document.getElementById('output_image');
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
<?php if (!empty($this->session->flashdata('msg'))) : ?>
    <?php if ($this->session->flashdata('msg') == 'error') { ?>
    <script>
        alert_func(["Some error occured, Please try again!", "error", "#e50914"]);
    </script>
    <?php } else { ?>
    <script>
        alert_func(<?= $this->session->flashdata('msg') ?>);
    </script>
    <?php } ?>
<?php $this->session->unset_userdata('msg');
endif ?>

<script>
    $.validator.setDefaults({
        submitHandler: function() {
            // $("#phone_number_full").val($("#phone").intlTelInput("getNumber"));
            return true;
        }
    });

    $('form[id="form_validation"]').validate({
        ignore: [],
        rules: {
            email: {
                required: true,
                email: true,
            },
            password: {
                required: true,
                minlength: 8
            },
            confirm_password: {
                required: true,
                minlength: 8,
                equalTo: "#password"
            },
            name: {
                required: true
            },
            fname: {
                required: true
            },
            lname: {
                required: true
            },
            team_search: {
                required: true
            },
            heading: {
                required: true
            },
            sub_heading: {
                required: true
            },
            banner_image: {
                required: true
            },
            /*phone: {
                required: true,
                minlength: 10,
                number: true
            },*/
            'frm[title]': {
                required: true
            },
            'frm[name]': {
                required: true
            },
            'frm[cat_id]': {
                required: true
            },
            'frm[module]': {
                required: true
            },
        },
        messages: {
            email: {
                required: "Please enter an email address",
                email: "Please enter a vaild email address"
            },
            password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 8 characters long"
            },
            confirm_password: {
                required: "Please provide a confirm password",
                minlength: "Your password must be at least 8 characters long"
            },
            name: {
                required: "Please enter a name"
            },
            team_search: {
                required: "Please choose search"
            },
            /*phone: {
            required: "Please enter a valid phone number"
            },*/
        },
        errorElement: 'span',
        errorPlacement: function(error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        }
    });
    
    function changeUserStatus(id, thisSwitch) {
        var newStatus;
        if (thisSwitch.val() == 1) {
            thisSwitch.val('0');
            newStatus = '0';
        } else {
            thisSwitch.val('1');
            newStatus = '1';
        }
        $.ajax({
            url: '<?= admin_url('members/changeStatus') ?>',
            type: 'POST',
            dataType: 'json',
            data: {
                user_id: String(id),
                status: String(newStatus)
            },
        })
        .done(function(data) {
            alert_func(data);
        })
        .fail(function(data) {
            console.log(data);
        });
    }

    function changeBannerStatus(id, thisSwitch) {
        var newStatus;
        if (thisSwitch.val() == 1) {
            thisSwitch.val('0');
            newStatus = '0';
        } else {
            thisSwitch.val('1');
            newStatus = '1';
        }
        $.ajax({
            url: '<?= admin_url('banner/changeStatus') ?>',
            type: 'POST',
            dataType: 'json',
            data: {
                id: String(id),
                status: String(newStatus)
            },
        })
        .done(function(data) {
            alert_func(data);
        })
        .fail(function(data) {
            console.log(data);
        });
    }

    function changehomecoursetatus(id, thisSwitch) {
        if (thisSwitch.val() == 1) {
            thisSwitch.val('2');
            newStatus = '2';
        } else {
            thisSwitch.val('1');
            newStatus = '1';
        }
        $.ajax({
            url: '<?= admin_url('homecourse/changeStatus') ?>',
            type: 'POST',
            dataType: 'json',
            data: {id: String(id), status: String(newStatus)},
        })
        .done(function(data) {
            alert_func(data);
        })
        .fail(function(data) {
            console.log(data);
        });
    }

    function changeCourseStatus(id, thisSwitch) {
        var newStatus;
        if (thisSwitch.val() == 1) {
            thisSwitch.val('0');
            newStatus = '0';
        } else {
            thisSwitch.val('1');
            newStatus = '1';
        }
        $.ajax({
            url: '<?= admin_url('course/changeStatus') ?>',
            type: 'POST',
            dataType: 'json',
            data: {
                id: String(id),
                status: String(newStatus)
            },
        })
        .done(function(data) {
            alert_func(data);
        })
        .fail(function(data) {
            console.log(data);
        });
    }
    jQuery(document).ready(function($) {
        $('#vid_type').hide();
        $('#video_link').hide();
        $('#quiz_s').hide();
        $('#res_doc').hide();
        $('#videof').hide();
        $('#addmoreques').hide();
    });
    
    /*function orderclick() {
        var odrr = document.getElementById("ordr").value;
        if (odrr == 'video') {
            $('#quiz_s').hide();
            $('#res_doc').hide();
            $('#vid_type').show();
            $('#video_link').hide();
            $('#videof').hide();
        } else if (odrr == 'resource') {
            $('#res_doc').show();
            $('#video_link').hide();
            $('#vid_type').hide();
            $('#quiz_s').hide();
            $('#addmoreques').hide();
        } else if (odrr == 'quiz') {
            $('#quiz_s').show();
            $('#vid_type').hide();
            $('#video_link').hide();
            $('#res_doc').hide();
            $('#addmoreques').show();
        }
    }*/

    $(document).ready (function () {  
        $("#ordr").change (function () {  
            var orderBy = $(this).val();  
            if(orderBy=="") {
                $('#vid_type').hide();
                $('#video_link').hide();
                $('#quiz_s').hide();
                $('#res_doc').hide();
                $('#videof').hide();
                $('#addmoreques').hide();
            } else if (orderBy == 'video') {
                $('#quiz_s').hide();
                $('#res_doc').hide();
                $('#vid_type').show();
                $('#video_link').hide();
                $('#videof').hide();
                $('#addmoreques').hide();
            } else if (orderBy == 'resource') {
                $('#res_doc').show();
                $('#video_link').hide();
                $('#vid_type').hide();
                $('#quiz_s').hide();
                $('#videof').hide();
                $('#addmoreques').hide();
            } else if (orderBy == 'quiz') {
                $('#quiz_s').show();
                $('#vid_type').hide();
                $('#video_link').hide();
                $('#videof').hide();
                $('#res_doc').hide();
                $('#addmoreques').show();
            }
        });  
    });  
    
    function videoclick() {
        var vdd = document.getElementById("v_type").value;
        if (vdd == 'youtube') {
            $('#video_link').show();
            $('#videof').hide();
        } else {
            $('#videof').show();
            $('#video_link').hide();
        }
    }
  
    $(document).ready(function() {
        var i = 1;
        $('#addmoreques').click(function() {
            i++;
            $('#quiz_s').append('<div class="col-sm-10" style="margin-top:20px;" id="morques' + i + '"><button style="margin-top:27px;" type="button" name="remove" id="' + i + '" class="btn btn-danger btn-sm btn_remove">X</button><div class="col-sm-11"><div class="form-group"><label for="exampleInputEmail1">Question</label><input type="text" name="ques[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Question"></div></div><div class="col-sm-12"><div class="form-group"><label for="exampleInputEmail1">Image</label><input type="file" name="file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option1</label><input type="text" name="ans1[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option1 Image</label><input type="file" name="option1_file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option2</label><input type="text" name="ans2[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option2 Image</label><input type="file" name="option2_file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option3</label> <input type="text" name="ans3[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option3 Image</label><input type="file" name="option3_file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option4</label><input type="text" name="ans4[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option4 Image</label><input type="file" name="option4_file_name[]" class="form-control"></div></div><div class="col-sm-12"><div class="form-group"><label for="exampleInputEmail1">Choose Correct Answer</label> <select name="cor_ans[]" class="form-control"><option  value="ans1">Option1</option><option value="ans2">Option2</option><option value="ans3">Option3</option><option value="ans4">Option4</option></select></div></div>')
        });
        $(document).on('click', '.btn_remove', function() {
            var button_id = $(this).attr("id");
            $('#morques' + button_id + '').remove();
        });
    });

    $(document).ready(function() {
        var j = 1;
        $('#addmoreques_edit').click(function() {
        j++;
        $('#quiz_s_edt').append('<div class="col-sm-10" style="margin-top:20px;" id="morques' + j + '"><button style="margin-top:27px;" type="button" name="remove" id="' + j + '" class="btn btn-danger btn-sm btn_remove">X</button><div class="col-sm-11"><div class="form-group"><label for="exampleInputEmail1">Question</label><input type="text" name="ques[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Question"></div></div><div class="col-sm-12"><div class="form-group"><label for="exampleInputEmail1">Image</label><input type="file" name="file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option1</label><input type="text" name="ans1[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option1 Image</label><input type="file" name="option1_file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option2</label><input type="text" name="ans2[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option2 Image</label><input type="file" name="option2_file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option3</label> <input type="text" name="ans3[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option3 Image</label><input type="file" name="option3_file_name[]" class="form-control"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option4</label><input type="text" name="ans4[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option4 Image</label><input type="file" name="option4_file_name[]" class="form-control"></div></div><div class="col-sm-12"><div class="form-group"><label for="exampleInputEmail1">Choose Correct Answer</label> <select name="cor_ans[]" class="form-control"><option  value="ans1">Option1</option><option value="ans2">Option2</option><option value="ans3">Option3</option><option value="ans4">Option4</option></select></div></div>')
        });

        $(document).on('click', '.btn_remove', function() {
            var button_id = $(this).attr("id");
            $('#morquesedt' + button_id + '').remove();
        });
    });

    function removedQuiz(id) {
        $('#quizRemoved-' + id).remove();
    }
  
    $(document).ready(function() {
        $(".delete").click(function() {
            if (!confirm("Do you want to delete")) {
                return false;
            }
        });
    });
    
    CKEDITOR.replace('editor1');
    CKEDITOR.replace('editor2');
    CKEDITOR.replace('editor3');
    CKEDITOR.replace('editor4');
    CKEDITOR.replace('editor5');
    CKEDITOR.replace('editor6');
    
    $(document).ready(function() {
        var i = 1;
        $('#addmorequesbank').click(function() {
        i++;
        $('#quiz_quess').append('<div class="col-sm-10" id="morquess' + i + '"><button type="button" name="remove" id="' + i + '" class="btn btn-danger btn_remove">X</button><div class="col-sm-12"><div class="form-group"><label for="exampleInputEmail1">Question</label><input type="text" name="ques[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Question"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option1</label><input type="text" name="ans1[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option2</label><input type="text" name="ans2[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option3</label> <input type="text" name="ans3[]]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-6"><div class="form-group"><label for="exampleInputEmail1">Option4</label><input type="text" name="ans4[]" value="" class="form-control" id="exampleInputEmail1" placeholder="Enter Answer"></div></div><div class="col-sm-12"><div class="form-group"><label for="exampleInputEmail1">Choose Correct Answer</label> <select name="cor_ans[]" class="form-control"><option  value="ans1">Option1</option><option value="ans2">Option2</option><option value="ans3">Option3</option><option value="ans4">Option4</option></select></div></div>')
        });
        $(document).on('click', '.btn_remove', function() {
            var button_id = $(this).attr("id");
            $('#morquess' + button_id + '').remove();
        });
    });
    
    function exam_confirm() {
        if ($('.checkbox:checked').length > 0) {
            var result = confirm("Are you sure to set selected Listing?");
            if (result) {
                return true;
            } else {
                return false;
            }
        } else {
            alert('Select at least 1 record to set.');
            return false;
        }
    }

    $(document).ready(function() {
        $('#select_all').on('click', function() {
            if (this.checked) {
                $('.checkbox').each(function() {
                this.checked = true;
                });
            } else {
                $('.checkbox').each(function() {
                    this.checked = false;
                });
            }
        });

        $('.checkbox').on('click', function() {
            if ($('.checkbox:checked').length == $('.checkbox').length) {
                $('#select_all').prop('checked', true);
            } else {
                $('#select_all').prop('checked', false);
            }
        });
    });
    
    function getvalue(sel) {
        var id = sel.value;
        $.ajax({
            url: '<?= admin_url('question/getcourse') ?>',
            method: 'POST',
            data: {
            id: id
            },
        })
        .done(function(e) {
            console.log(e);
            $("#courselist").html(e);
        });
    }
  </script>
</body>
</html>
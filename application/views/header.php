<?php
    $user_id = $this->session->userdata('user_id');
    $isLoggedIn = $this->session->userdata('isLoggedIn');
    $getOptionsSql = "SELECT * FROM `options`";
    $optionsList = $this->db->query($getOptionsSql)->result();
?>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <!-- meta tag -->
    <meta charset="utf-8">
    <title><?= SITENAME ?> <?php echo @$title; ?></title>
    <meta name="description" content="">
    <!-- responsive tag -->
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon -->
    <link rel="apple-touch-icon" href="apple-touch-icon.html">
    <link rel="shortcut icon" type="image/x-icon" href="<?= base_url('user_assets/images/favicon.png') ?>">
    <!-- Bootstrap v4.4.1 css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/bootstrap.min.css') ?>">
    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/font-awesome.min.css') ?>">
    <!-- animate css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/animate.css') ?>">
    <!-- owl.carousel css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/owl.carousel.css') ?>">
    <!-- slick css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/slick.css') ?>">
    <!-- off canvas css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/off-canvas.css') ?>">
    <!-- linea-font css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/fonts/linea-fonts.css') ?>">
    <!-- flaticon css  -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/fonts/flaticon.css') ?>">
    <!-- magnific popup css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/magnific-popup.css') ?>">
    <!-- Main Menu css -->
    <link rel="stylesheet" href="<?= base_url('user_assets/css/rsmenu-main.css') ?>">
    <!-- spacing css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/rs-spacing.css') ?>">
    <!-- style css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/style.css') ?>">
    <!-- responsive css -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('user_assets/css/responsive.css') ?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/intlTelInput.css') ?>">
</head>

<body class="defult-home">
    <!--Preloader area start here-->
    <div id="loader" class="loader orange-color">
        <div class="loader-container">
            <div class='loader-icon'>
                <img src="<?= base_url() ?>favicon.png" alt="">
            </div>
        </div>
    </div>
    <!--Preloader area End here-->
    <!--Full width header Start-->
    <div class="full-width-header header-style3 home-style15">
        <!--Header Start-->
        <header id="rs-header" class="rs-header">
            <!-- Topbar Area Start -->
            <div class="topbar-area home11-topbar modify1 home15-style">
                <div class="container-fluid2">
                    <div class="row y-middle">
                        <div class="col-md-5">
                            <ul class="topbar-contact">
                                <li><svg xmlns="http://www.w3.org/2000/svg" width="24.509" height="20" viewBox="0 0 24.509 20"><g id="Icon_feather-mail" data-name="Icon feather-mail" transform="translate(1 1)"><path id="Path_1" data-name="Path 1" d="M5.238,5H23.271a3.241,3.241,0,0,1,3.238,3.238V21.762A3.241,3.241,0,0,1,23.271,25H5.238A3.241,3.241,0,0,1,2,21.762V8.238A3.241,3.241,0,0,1,5.238,5ZM23.271,23.033a1.272,1.272,0,0,0,1.271-1.271V8.238a1.272,1.272,0,0,0-1.271-1.271H5.238A1.272,1.272,0,0,0,3.967,8.238V21.762a1.272,1.272,0,0,0,1.271,1.271Z" transform="translate(-3 -6)" fill="#186aff"/><path id="Path_2" data-name="Path 2" d="M14.254,18.022a.971.971,0,0,1-.564-.181L2.419,9.819a1.011,1.011,0,0,1-.242-1.393.973.973,0,0,1,1.37-.246L14.254,15.8,24.961,8.181a.973.973,0,0,1,1.37.246,1.011,1.011,0,0,1-.242,1.393L14.818,17.841A.971.971,0,0,1,14.254,18.022Z" transform="translate(-3 -6.708)" fill="#186aff"/></g></svg><a href="mailto:<?php echo $optionsList[8]->option_value?>"><?php echo $optionsList[8]->option_value?></a>
                                </li>
                                <li><svg xmlns="http://www.w3.org/2000/svg" width="19.964" height="20" viewBox="0 0 19.964 20"><path id="Icon_feather-phone-call" data-name="Icon feather-phone-call" d="M7.6,1.646a2.663,2.663,0,0,1,2.624,2.28v.007a11.06,11.06,0,0,0,.6,2.417,2.658,2.658,0,0,1-.6,2.795l0,0L9.5,9.876a13.969,13.969,0,0,0,4.4,4.4l.728-.728,0,0a2.65,2.65,0,0,1,2.8-.6,11.056,11.056,0,0,0,2.415.6h.007a2.65,2.65,0,0,1,2.28,2.68v2.759a2.651,2.651,0,0,1-2.651,2.658c-.079,0-.16,0-.239-.011h-.014a19.16,19.16,0,0,1-8.312-2.956A18.923,18.923,0,0,1,5.136,12.9,19.159,19.159,0,0,1,2.18,4.548V4.535A2.651,2.651,0,0,1,4.816,1.646Zm1.03,2.5A1.045,1.045,0,0,0,7.6,3.256H4.817A1.04,1.04,0,0,0,3.782,4.385a17.54,17.54,0,0,0,2.707,7.641l0,.006a17.3,17.3,0,0,0,5.289,5.289l.006,0a17.541,17.541,0,0,0,7.6,2.707,1.04,1.04,0,0,0,1.128-1.041V16.219q0-.01,0-.02a1.04,1.04,0,0,0-.892-1.056,12.673,12.673,0,0,1-2.765-.689,1.04,1.04,0,0,0-1.1.232L14.6,15.857a.805.805,0,0,1-.967.131A15.577,15.577,0,0,1,7.79,10.149a.805.805,0,0,1,.131-.967L9.091,8.011a1.043,1.043,0,0,0,.232-1.1A12.677,12.677,0,0,1,8.633,4.148Z" transform="translate(-2.168 -1.646)" fill="#186aff"/></svg><a href="tel:<?php echo $optionsList[7]->option_value?>"><?php echo $optionsList[7]->option_value?></a></li>
                            </ul>
                        </div>
                        <div class="col-md-7 text-right">
                            <ul class="toolbar-sl-share">
                                <li class="opening"><svg xmlns="http://www.w3.org/2000/svg" width="15.714" height="20" viewBox="0 0 15.714 20"><g id="location-information-svgrepo-com" transform="translate(-160 -64)"><path id="Path_47" data-name="Path 47" d="M256.714,896h10a.714.714,0,1,1,0,1.429h-10a.714.714,0,1,1,0-1.429Z" transform="translate(-93.857 -813.429)" fill="#186aff"/><path id="Path_48" data-name="Path 48" d="M174.286,71.857a6.429,6.429,0,1,0-12.857,0c0,2.637,2.11,6.074,6.429,10.191C172.176,77.931,174.286,74.494,174.286,71.857ZM167.857,84Q160,76.858,160,71.857a7.857,7.857,0,0,1,15.714,0Q175.714,76.856,167.857,84Z" fill="#186aff"/><path id="Path_49" data-name="Path 49" d="M355.571,261.714a2.143,2.143,0,1,0-2.143-2.143A2.143,2.143,0,0,0,355.571,261.714Zm0,1.429a3.571,3.571,0,1,1,3.571-3.571A3.571,3.571,0,0,1,355.571,263.143Z" transform="translate(-187.714 -187.714)" fill="#186aff"/></g></svg><?php echo $optionsList[6]->option_value?></li>
                                <li>
                                    <a href="<?php echo $optionsList[3]->option_value?>"><svg xmlns="http://www.w3.org/2000/svg" width="8.32" height="17.246" viewBox="0 0 8.32 17.246"><path id="facebook-svgrepo-com" d="M-331.873,276.692c0-.694.62-.943,1.314-.943a5.977,5.977,0,0,1,1.435.216l.445-2.641a11.077,11.077,0,0,0-3.193-.323,3.172,3.172,0,0,0-2.769,1.3,4.669,4.669,0,0,0-.573,2.675v1.731H-337v2.58h1.785v8.96h3.341v-8.96h2.648l.2-2.58h-2.843Z" transform="translate(337 -273)" fill="#fff"/></svg></a>
                                </li>
                                <li>
                                    <a href="<?php echo $optionsList[2]->option_value?>"><svg xmlns="http://www.w3.org/2000/svg" width="18.829" height="15.302" viewBox="0 0 18.829 15.302"><path id="Icon_metro-twitter" data-name="Icon metro-twitter" d="M21.4,6.629a7.724,7.724,0,0,1-2.219.608A3.875,3.875,0,0,0,20.88,5.1a7.734,7.734,0,0,1-2.453.937,3.867,3.867,0,0,0-6.583,3.523A10.967,10.967,0,0,1,3.882,5.524a3.867,3.867,0,0,0,1.2,5.158,3.847,3.847,0,0,1-1.75-.483c0,.016,0,.032,0,.049a3.866,3.866,0,0,0,3.1,3.788,3.869,3.869,0,0,1-1.745.066A3.867,3.867,0,0,0,8.29,16.784a7.751,7.751,0,0,1-4.8,1.654,7.835,7.835,0,0,1-.922-.054A10.934,10.934,0,0,0,8.492,20.12,10.916,10.916,0,0,0,19.484,9.128q0-.251-.011-.5a7.848,7.848,0,0,0,1.928-2Z" transform="translate(-2.571 -4.817)" fill="#fff"/></svg></a>
                                </li>
                                <li>
                                    <a href="<?php echo $optionsList[16]->option_value?>"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="17.276" height="17.246" viewBox="0 0 17.276 17.246"><defs><clipPath id="clip-path"><rect id="Rectangle_134" data-name="Rectangle 134" width="17.277" height="17.246" fill="#fff"/></clipPath></defs><g id="Group_37" data-name="Group 37" transform="translate(0 0)"><rect id="Rectangle_133" data-name="Rectangle 133" width="3.585" height="11.515" transform="translate(0.286 5.731)" fill="#fff"/><g id="Group_36" data-name="Group 36" transform="translate(0 0)"><g id="Group_35" data-name="Group 35" clip-path="url(#clip-path)"><path id="Path_2983" data-name="Path 2983" d="M2.076,0h0A2.075,2.075,0,1,0,4.15,2.074,2.074,2.074,0,0,0,2.074,0" transform="translate(0 0)" fill="#fff"/><path id="Path_2984" data-name="Path 2984" d="M9.116,8.549h.005v0Z" transform="translate(-3.006 -2.818)" fill="#fff"/><path id="Path_2985" data-name="Path 2985" d="M15.991,8.124A3.764,3.764,0,0,0,12.6,9.983h-.048V8.41H9.123V19.922H12.7v-5.7c0-1.5.287-2.956,2.149-2.956,1.836,0,1.86,1.719,1.86,3.054v5.6h3.577V13.609c0-3.1-.669-5.485-4.293-5.485" transform="translate(-3.008 -2.679)" fill="#fff"/></g></g></g></svg>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?php echo $optionsList[18]->option_value?>"><svg xmlns="http://www.w3.org/2000/svg" width="17.246" height="17.246" viewBox="0 0 17.246 17.246"><g id="Instagram-Glyph-Color-Logo.wine" transform="translate(0 0)"><path id="Path_2978" data-name="Path 2978" d="M2.077-5.5A1.036,1.036,0,0,0,1.041-6.533,1.036,1.036,0,0,0,.005-5.5,1.036,1.036,0,0,0,1.041-4.463,1.035,1.035,0,0,0,2.077-5.5" transform="translate(12.185 9.518)" fill="#fff"/><path id="Path_2979" data-name="Path 2979" d="M15.641-41.9a4.811,4.811,0,0,1-.3,1.6,2.664,2.664,0,0,1-.647.992,2.635,2.635,0,0,1-.99.643,4.8,4.8,0,0,1-1.6.3c-.909.04-1.178.049-3.483.049s-2.574-.009-3.483-.049a4.78,4.78,0,0,1-1.6-.3,2.637,2.637,0,0,1-.992-.643A2.628,2.628,0,0,1,1.9-40.3a4.754,4.754,0,0,1-.3-1.6c-.044-.909-.052-1.183-.052-3.483s.008-2.577.052-3.486a4.786,4.786,0,0,1,.3-1.6,2.624,2.624,0,0,1,.646-.99,2.668,2.668,0,0,1,.992-.645,4.78,4.78,0,0,1,1.6-.3c.909-.04,1.18-.05,3.483-.05s2.574.01,3.483.05a4.8,4.8,0,0,1,1.6.3,2.665,2.665,0,0,1,.99.645,2.659,2.659,0,0,1,.647.99,4.843,4.843,0,0,1,.3,1.6c.042.909.052,1.18.052,3.486s-.01,2.574-.052,3.483Zm1.553-7.039a6.267,6.267,0,0,0-.4-2.093,4.2,4.2,0,0,0-.993-1.529,4.24,4.24,0,0,0-1.527-.994,6.286,6.286,0,0,0-2.094-.4C11.259-54,10.965-54,8.622-54s-2.637.008-3.556.052a6.311,6.311,0,0,0-2.094.4,4.251,4.251,0,0,0-1.524.994,4.237,4.237,0,0,0-1,1.529,6.376,6.376,0,0,0-.4,2.093C.01-48.017,0-47.723,0-45.38s.01,2.635.05,3.554a6.4,6.4,0,0,0,.4,2.094,4.23,4.23,0,0,0,1,1.527,4.25,4.25,0,0,0,1.524,1,6.366,6.366,0,0,0,2.094.4c.919.042,1.215.052,3.556.052s2.637-.01,3.556-.052a6.34,6.34,0,0,0,2.094-.4,4.24,4.24,0,0,0,1.527-1,4.2,4.2,0,0,0,.993-1.527,6.293,6.293,0,0,0,.4-2.094c.042-.919.052-1.213.052-3.554s-.01-2.637-.052-3.556Z" transform="translate(0 54.004)" fill="#fff"/><path id="Path_2980" data-name="Path 2980" d="M4.487-20.515a2.873,2.873,0,0,1-2.874-2.872,2.875,2.875,0,0,1,2.874-2.876,2.877,2.877,0,0,1,2.876,2.876A2.875,2.875,0,0,1,4.487-20.515Zm0-7.3A4.429,4.429,0,0,0,.06-23.387,4.427,4.427,0,0,0,4.487-18.96a4.428,4.428,0,0,0,4.429-4.427A4.431,4.431,0,0,0,4.487-27.817Z" transform="translate(4.136 32.011)" fill="#fff"/></g></svg></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Topbar Area End -->
            <!-- Menu Start -->
            <div class="menu-area">
                <div class="container-fluid2">
                    <div class="custom-table">
                        <div class="col-cell">
                            <div class="header-logo">
                                <div class="custom-logo-area">
                                    <a href="<?= base_url() ?>"><img src="<?= base_url() ?>uploads/logo/<?php echo $optionsList[0]->option_value?>" alt="Header"></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-cell">
                            <div class="rs-menu-area">
                                <div class="main-menu">
                                    <div class="mobile-menu">
                                        <a class="rs-menu-toggle"><i class="fa fa-bars"></i></a>
                                    </div>
                                    <nav class="rs-menu">
                                        <ul class="nav-menu">
                                            <li <?php if($this->uri->segment(1) == ''){ echo "class='current-menu-item'"; } ?>> <a href="<?= base_url() ?>">Home</a></li>
                                            <li <?php if($this->uri->segment(1) == 'course-list'){ echo "class='current-menu-item'"; } ?>><a href="<?php echo base_url('course-list') ?>">Courses</a></li>
                                            <li <?php if($this->uri->segment(1) == 'consulting'){ echo "class='current-menu-item'"; } ?>><a href="<?php echo base_url('consulting') ?>">Consulting</a></li>
                                            <li <?php if($this->uri->segment(1) == 'about'){ echo "class='current-menu-item'"; } ?>><a href="<?php echo base_url('about') ?>">About Us</a></li>
                                            <li <?php if($this->uri->segment(1) == 'contact'){ echo "class='current-menu-item'"; } ?>><a href="<?php echo base_url('contact') ?>">Contact Us</a></li>
                                            <?php if(!empty($isLoggedIn)) { ?>
                                                <li class="apply-btn"><a href="<?php echo base_url('student-dashboard') ?>">Dashboard</a></li>
                                            <?php } else { ?>
                                                <li class="apply-btn"><a href="<?php echo base_url('login') ?>">Login</a></li>
                                                <li class="apply-btn"><a href="<?php echo base_url('register') ?>">Enroll Now</a></li>
                                            <?php } ?>                                           
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Menu End -->
        </header>
        <!--Header End-->
    </div>
    <!--Full width header End-->
<!-- Main content -->
<section class="content-header">
  <h1>
    <?= $title ?>
  </h1>
  <ol class="breadcrumb">
    <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="<?= admin_url('course/course_list') ?>"> Course List</a></li>
    <li class="active"><?= $title ?></li>
  </ol>
</section>

<section class="content">
  <div class="row">
    <!-- left column -->
    <div class="col-md-12">
      <!-- general form elements -->
      <div class="box box-primary">
        <div class="box-header with-border">
          
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form action="<?=admin_url('course/category_add/'.$course->id)?>" id="form_validation" method="post" enctype="multipart/form-data">
          <div class="box-body">
            <div class="container">
              <div class="row">
                <div class="col-sm-10">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Category Title</label>
                      <input type="text" name="frm[name]" value="<?=$course->name?>" class="form-control" id="exampleInputEmail1" placeholder="Enter category Name">
                    </div>
                  </div>

                </div>
              </div>
              <div class="box-footer">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
            </div>
          </div>
         
        </form>
      </div>
      <!-- /.box -->
    </div>
  </div>
</section>
<style>
  .form-control {
    margin-bottom: 15px;
  }
</style>
<!-- Main content -->
<section class="content-header">
  <h1>
    <?= $title ?>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active"><?= $title ?></li>
  </ol>
</section>

<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box">
        <div class="box-header with-border2">
          <h3 class="box-title">Member Lists</h3>
          <!-- <a href="<?= admin_url('members/exportmember') ?>" class="pull-right btn btn-primary">Export</a> -->
          <a href="<?= admin_url('members/add/') ?>" class="pull-right btn btn-primary"><span class="fa fa-plus"></span> Add New</a>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <table class="table">
            <tr>
              <th style="width: 10px">#</th>
              <!-- <th>Image</th> -->
              <th>Name</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Date</th>
              <th>Status</th>
              <th>Actions</th>
              <!-- <th>Reply</th> -->

            </tr>
            <?php
            if (!empty($members)) {
              $i = 1;
              foreach ($members as $member) {
            ?>
                <tr>
                  <td><?= $i ?></td>
                  <td><?= $member->fname." ".$member->lname ?></td>
                  <td><?= $member->email ?></td>
                  <td><?php if(@$member->phone) {echo @$member->phone; } else { echo"&#8212;"; } ?></td>

                  <td><?= date('d M Y', strtotime($member->created_at)); ?></td>
                  <!-- <td><img src="<?= site_url('assets/images/cms/' . $member->image) ?>" title="<?= $pages->title ?>" width="80px" onerror="this.src='<?= site_url('assets/images/no-image.png'); ?>';"></td> -->


                  <td style="vertical-align: middle;">
                      <div class="checkbox checbox-switch switch-success">
                          <label>
                          <input type="checkbox" value="<?= @$member->status ?>" <?= (@$member->status == 1) ? 'checked="checked"' : ''; ?> onchange="changeUserStatus(<?= @$member->id ?>, $(this))">
                              <span></span>
                          </label>
                      </div>
										</td>
                  <!-- <td>
                    <?php
                    if ($member->status == 1) {
                    ?>
                      <a href="<?= admin_url('members/deactivate/' . $member->id) ?>"><span class="badge bg-green">Active</span></a>
                    <?php
                    } else {
                    ?>
                      <a href="<?= admin_url('members/activate/' . $member->id) ?>"><span class="badge bg-red">Inactive</span></a>
                    <?php
                    }
                    ?>
                  </td> -->

                  <!-- <td><?= $member->rply_text ?></td> -->
                  <!-- <td>
                    <?php if ($member->rply_status != 1) { ?>
                      <a href="javascript:void(0);" data-toggle="modal" data-target="#myModal<?= $i ?>" class="text-info" title="contact">Contact</a>
                    <?php } else { ?>
                      <a href="javascript:void(0);" class="btn btn-primary" title="Replied">REPLIED</a>
                      <p>Date: <?= date('d M Y', strtotime($member->rply_date)) ?></p>
                    <?php } ?>
                  </td> -->
                   <td>
                      <div class="action-button">
                      
                        <a href="<?= admin_url('members/add/' . $member->id) ?>" class="btn btn-xs btn-info"><span class="fa fa-pencil"></span></a>
                        <button class="btn btn-xs btn-danger" style="margin-left: 5px;" title="Delete" data-toggle="tooltip" onclick="deleteUsers(<?= @$member->id ?>)">
                          <i class="fa fa-trash"></i>
                        </button>
                        <!-- <a href="<?= admin_url('members/deleteUsers/' . $member->id) ?>" class="btn btn-xs btn-danger delete"><span class="fa fa-trash"></span></a> -->
                      </div>
                    </td>
                </tr>
                <!--start Modal for reply content-->
                <div class="modal fade" id="myModal<?= $i ?>" role="dialog">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Contact To <?= $member->fname ?></h4>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col-md-8 col-md-offset-2">
                            <form action="<?= admin_url('members/member_reply/' . $member->id) ?>" method="post">
                              <input class="form-control" type="email" value="<?= $member->email ?>" name="email" readonly>
                              <textarea class="form-control" name="cmnts" rows="4"></textarea>
                              <input type="submit" value="Send" class="btn btn-primary">
                            </form>
                          </div>
                        </div>

                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                    </div>

                  </div>
                </div>
            <?php $i++; } } else { echo"<tr><td colspan='7' class='text-center red'><h3>No record available!</h3></td></tr>";} ?>
          </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
          <?= $paginate ?>
        </div>
      </div>
    </div>
  </div>

  <script>
    function deleteUsers(id) {
        swal({
            title: 'Are You sure want to delete this user?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#36A1EA',
            cancelButtonColor: '#e50914',
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
            closeOnConfirm: true,
            closeOnCancel: true
        }, function(isConfirm) {
            if (isConfirm) {
                window.location.href = '<?= admin_url('members/deleteUsers/') ?>' + id
            }
        });
    }
  </script>
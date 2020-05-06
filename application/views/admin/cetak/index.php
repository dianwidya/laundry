<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="<?php echo base_url('vendor/css/styles.css') ?> " rel="stylesheet" />
        <link href="<?php echo base_url('vendor/https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css') ?>" rel="stylesheet" crossorigin="anonymous" />
        <script src="<?php echo base_url('vendor/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js') ?> " crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
<div class="container">
    

        <div id="page-content">
    <div class="panel">
        <!-- <div class="panel-heading">
            <h3 class="panel-title">Basic Data Tables with responsive plugin</h3>
        </div> -->
        <div class="panel-body">
        
        <center><h1>Laporan Pembayaran</h1></center>
        <br>
        <h5>Bulan <?php echo $bulan;?>, <?php echo $tahun;?></h5>
       
        <hr>
        <center>
            <table id="demo-dt-basic" class="table table-striped table-bordered" cellspacing="0" width="50%">
                    <tr>
                        <td><b>No</b></td>
                        <td><b>Tanggal dibuat</b></td>
                        <td><b>Total Bayar</b></td>
                    </tr>
                    <?php 
                $no = 1;
                foreach ($pemesanan as $key) {
                ?>
                    <tr>
                        <td> <?= $no ?></td>
                        <td> <?= $key->tanggal_masuk ;?></td>
                        <td> Rp <?= $key->jml_bayar; ?></td>   
                    </tr>

                   
                    <?php $no++ ; } ?>

                    <tr>
                        <td></td>
                        <td ><b>Total Bayar</b></td>
                        <td style="border: 2px solid #8c8c8c"><b> Rp <?php foreach ($total_bayar as $row) { 
                            echo $row->totalBayar;
                            }?></b></td>   
                    </tr>
            </table>
             <a href="javascript:window.print()" class="btn btn-primary">cetak</a>
        </center>
   </div>
</div>
</div>
          </div> 
       
</body>
 <script src="<?php echo base_url('vendor/https://code.jquery.com/jquery-3.4.1.min.js') ?> " crossorigin="anonymous"></script>
        <script src="<?php echo base_url('vendor/https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js') ?> " crossorigin="anonymous"></script>
        <script src="<?php echo base_url('vendor/js/scripts.js') ?>"></script>
        <script src="<?php echo base_url('vendor/https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js') ?> " crossorigin="anonymous"></script>
        <script src="<?php echo base_url('vendor/assets/demo/chart-area-demo.js') ?> "></script>
        <script src="<?php echo base_url('vendor/assets/demo/chart-bar-demo.js') ?> "></script>
        <script src="<?php echo base_url('vendor/https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js') ?> " crossorigin="anonymous"></script>
        <script src="<?php echo base_url('vendor/https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js') ?> " crossorigin="anonymous"></script>
        <script src="<?php echo base_url('vendor/assets/demo/datatables-demo.js') ?> "></script>
</html>


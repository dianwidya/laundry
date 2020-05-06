<div id="page-head">
    <div id="page-title">
        <h1 class="page-header text-overflow">Laporan Keuangan Bulanan</h1>
    </div>
    <ol class="breadcrumb">
        <li><a href="#"><i class="demo-pli-home"></i></a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Laporan Keuangan Bulanan</li>
    </ol>
</div>
<div id="page-content">
    <div class="panel">
        <!-- <div class="panel-heading">
            <h3 class="panel-title">Basic Data Tables with responsive plugin</h3>
        </div> -->
        <div class="panel-body">
            <h4>Range Tanggal</h4>
                <!-- <?php $years = range(1945, strftime("%Y", time())); ?> -->
             
                    <form action="<?=base_url('Admin/Laporan/cetakLaporan/')?>" method="post">
                        <div class="col-sm-2">
                            <input type="date" class="form-control" tabindex="2" name="date_awal">
                   
                    </div>
                     <div class="col-sm-2">
                        <input type="date" class="form-control" tabindex="3"  name="date_akhir">
                   <!-- <select name="year" class="form-control demo-chosen-select" tabindex="3" required>
                            <option value="">-- Pilih Tahun --</option>
                            <?php foreach($years as $year) : ?>
                        <option value="<?php echo $year; ?>"><?php echo $year; ?></option>
                      <?php endforeach; ?>
                        </select> -->
                    </div>
                      
                    <button type="submit" class="btn btn-primary">Download</button>
                    </form>
               <br>

            <?php $this->load->view('admin/section/notification')?>
            <table id="demo-dt-basic" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Judul Laporan</th>
                        <th>Tanggal dibuat</th>
                        <th>Nama Customer</th>
                        <th>Paket</th>
                        <th>Layanan</th>
                        <th>Berat <small>(kg)</small></th>
                        <th>Total Bayar</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php //$this->load->view('admin/paket/form')?>
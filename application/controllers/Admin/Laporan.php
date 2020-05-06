<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('Asia/Jakarta');
class Laporan extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->authenticated();
        $this->check_admin();
        $this->load->model('CustomerModel', 'customer');
        $this->load->model('PemesananModel');
        $this->load->model('UserModel', 'user');
        $this->laundry = $this->session->userdata('laundry_id');
    }

    public function index()
    {
        $this->render_admin('admin/laporan/index');
    }
    public function cetakLaporan()
    {
        $IdLaundry = $this->session->userdata('laundry_id');
        $date_awal = $this->input->post('date_awal');
        $date_akhir = $this->input->post('date_akhir');
        $month = date("F",strtotime($date_awal));
        $year = date("Y",strtotime($date_awal));
        $data['bulan'] = $month;
        $data['tahun'] = $year;
        $data['pemesanan'] = $this->PemesananModel->tampil($IdLaundry,$date_awal,$date_akhir)->result();
        $data['total_bayar'] = $this->PemesananModel->totalBayar($IdLaundry,$date_awal,$date_akhir)->result();

        $this->load->view('admin/cetak/index',$data);
    }
}

?>
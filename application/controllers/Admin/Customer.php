<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('Asia/Jakarta');
class Customer extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->authenticated();
        $this->check_admin();
        $this->load->model('CustomerModel', 'customer');
        $this->load->model('PemesananModel', 'pemesanan');
        $this->load->model('UserModel', 'user');
        $this->laundry = $this->session->userdata('laundry_id');
        $this->user_id = $this->session->userdata('user_id');
        $this->load->model('LaundryPaketModel', 'laundry_paket');
        $this->load->model('LaundryLayananModel', 'laundry_layanan');
    }

    public function index()
    {
        $data['profile'] = $this->user->fetch_laundry($this->user_id);
        $data['customer'] = $this->customer->find_by()->result();
        $data['layanan'] = $this->laundry_layanan->find_by()->result();
        
        $this->render_admin('admin/customer/index', $data);
    }

    public function getRandomUsername($string) {

        $pattern = " ";
        $firstPart = strstr(strtolower($string), $pattern, true);

        $secondPart = substr(strstr(strtolower($string), $pattern, false), 0,3);

        $nrRand = rand(0, 1000);
        
        $username = trim($firstPart).trim($secondPart).trim($nrRand);
        
        return $username;
      
    }

    public function create()
    {   

        $getUserRandom = $this->getRandomUsername($this->input->post('name'));
        $getPassRandom = $this->getRandomUsername($this->input->post('name'));
       
        $data = array(
            'laundry_id'=> $this->laundry,
            'name'      => htmlspecialchars($this->input->post('name')),
            'phone'     => htmlspecialchars($this->input->post('phone')),
            'address'   => htmlspecialchars($this->input->post('address')),
            'gender'    => htmlspecialchars($this->input->post('gender')),
            'is_member' => htmlspecialchars($this->input->post('is_member')),
            'username'  => $getUserRandom,
            //'password'  => md5($this->input->post('password')),
            'password'  => $getPassRandom,
            'email'     => htmlspecialchars($this->input->post('email')),
            'paket_id'  => htmlspecialchars($this->input->post('select_paket')),
            'layanan_id'=> htmlspecialchars($this->input->post('layanan_id')),
        );

        //  $dataPemesanan = array(
        //     'laundry_id'        => $this->laundry,
        //     'customer_id'       => $this->input->post('customer_id'),
        //     'paket_id'          => $this->input->post('paket_id'),
        //     'layanan_id'        => $this->input->post('layanan_id'),
        //     'tanggal_masuk'     => date('Y-m-d'),
        //     'tanggal_selesai'   => $this->input->post('tanggal_selesai'),
        //     'berat'             => $this->input->post('berat'),
        //     'jml_bayar'         => $this->input->post('jml_bayar'),
        //     'kuota'             => $this->input->post('kuota'),
        //     'is_bayar'          => $this->input->post('is_bayar'),
        //     'bar_code'          => $image_name
        // );

      

        $mailed = $this->sendEmail($data['username'],$getPassRandom, $data['email']);
        $result = $this->customer->insert($data);
        // $result = $this->pemesanan->insert($data);

        

        if($result == true && $mailed == true){
            $this->session->set_flashdata('success', 'Data Customer Berhasil Disimpan');
        }elseif($result == false){
            $this->session->set_flashdata('failed', 'Data Customer Gagal Disimpan');
        }

        redirect('Admin/Customer');
    }

    public function decryptIt( $q ) {
    $cryptKey  = 'qJB0rGtIn5UB1xG03efyCp';
    $qDecoded      = rtrim( mcrypt_decrypt( MCRYPT_RIJNDAEL_256, md5( $cryptKey ), base64_decode( $q ), MCRYPT_MODE_CBC, md5( md5( $cryptKey ) ) ), "\0");
    return( $qDecoded );
}

    public function sendEmail($username, $password, $email) {
        $data['profile'] = $this->user->fetch_laundry($this->user_id);
        //$randomPass = $this->getRandomUsername();
        $subject = "Selamat kamu terdaftar dalam ".$data['profile']->name." milik ".$data['profile']->owner_name;
        $message = "Silahkan login ke <a href='#'>Laundry</a> menggunakan username <b>".$username."</b> dengan password <b>".$password."</b></br>";

        // print_r($sender);
        // print_r($subject);
        // print_r($message);
        // exit;

//      harus akun aktif 
        // $config['smtp_user'] = "Madedianptr@gmail.com";
        // $config['smtp_pass'] = "2008dian";

        //ini udah bene email yg aktifnya?


        $config['protocol'] = "smtp";
        $config['smtp_host'] = "ssl://smtp.gmail.com";
        $config['smtp_port'] = "465";
        $config['smtp_user'] = "dianwidyap0@gmail.com";
        $config['smtp_pass'] = "dianputri20";
        $config['charset'] = "utf-8";
        $config['mailtype'] = "html";
        $config['newline'] = "\r\n";
        $this->email->initialize($config);

        $this->load->library('email');
        //ini dia ngambil dari database 
        $this->email->from($data['profile']->email, $data['profile']->name);
        $this->email->to($email);
        $this->email->subject($subject);
        $this->email->message($message);
        $this->email->set_mailtype('html');

        if ($this->email->send()) {
            echo 'Email sent.';
            return true;
        } else {
            show_error($this->email->print_debugger());
            return false;
             
        }
    }

    public function register_get_paket() {
        $member_id = $this->input->post('member_id');

        if($member_id == 0) {
            $dataPaket = $this->laundry_paket->find_by_non_member()->result();
            $ket = 'Non Member';
        } else {
            $dataPaket = $this->laundry_paket->find_by_member()->result();
            $ket = 'Member';
        }
        $html = "<option value='' selected disabled>-- Pilih --</option>";
        foreach($dataPaket as $p){
            $html .= "<option value='".$p->id."'>".$p->name.' - '.$ket."</option>";
        }
        $callback = array('data_paket'=>$html, 'ket'=>$ket);
        echo json_encode($callback);
    }

    public function edit($id)
    {
        $data = array(
            'name'      => htmlspecialchars($this->input->post('name')),
            'phone'     => htmlspecialchars($this->input->post('phone')),
            'address'   => htmlspecialchars($this->input->post('address')),
            'gender'    => htmlspecialchars($this->input->post('gender')),
            'is_member' => htmlspecialchars($this->input->post('is_member')),
            'updated_at'=> date('Y-m-d H:i:s')
        );

        $result = $this->customer->update($id,$data);
        if($result == true){
            $this->session->set_flashdata('success', 'Data Customer Berhasil Diubah');
        }elseif($result == false){
            $this->session->set_flashdata('failed', 'Data Customer Gagal Diubah');
        }

        redirect('Admin/Customer');
    }

    public function delete($id)
    {
        $data = array(
            'is_delete' => 1
        );

        $result = $this->customer->update($id,$data);
        if($result == true){
            $this->session->set_flashdata('success', 'Data Customer Berhasil Dihapus');
        }elseif($result == false){
            $this->session->set_flashdata('failed', 'Data Customer Gagal Dihapus');
        }

        redirect('Admin/Customer');
    }
}
?>
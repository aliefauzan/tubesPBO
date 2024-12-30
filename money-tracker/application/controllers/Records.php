<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Records extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->helper('url');
        $this->load->model('record_model');
    }

    public function index() {
        $data['records'] = $this->record_model->getAllRecords();
        $this->load->view('my_records', $data);
    }

    public function add() {
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');

        $this->form_validation->set_rules('amount', 'Amount', 'required');
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('date', 'Date', 'required');
        $this->form_validation->set_rules('transaksi', 'Transaksi', 'required', [
            'required' => 'Anda harus memilih jenis transaksi (Masuk atau Keluar).'
        ]);

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('add_records');
        } else {
            $this->insertrecord();
        }
    }

    public function edit($id) {
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');

        $data['record'] = $this->record_model->getRecordById($id);
        $this->load->view('edit_records', $data);
    }

    public function insertrecord() {
        // Ambil data dari form
        $data = array(
            'name' => $this->input->post('name'),
            'amount' => $this->input->post('amount'),
            'date' => $this->input->post('date'),
            'notes' => $this->input->post('notes'),
            'transaksi' => $this->input->post('transaksi') // Ambil nilai transaksi
        );

        // Tentukan nilai is_masuk dan is_keluar berdasarkan input transaksi
        $data['is_masuk'] = ($data['transaksi'] == 'masuk') ? 1 : 0;
        $data['is_keluar'] = ($data['transaksi'] == 'keluar') ? 1 : 0;

        // Panggil model untuk menyimpan data
        $this->record_model->insertRecord($data);
        redirect('records');
    }
    
    public function editrecord($id) {
        $this->load->library('form_validation');
    
        $this->form_validation->set_rules('amount', 'Amount', 'required');
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('date', 'Date', 'required');
        $this->form_validation->set_rules('transaksi', 'Transaksi', 'required', [
            'required' => 'Anda harus memilih jenis transaksi (Masuk atau Keluar).'
        ]);
    
        if ($this->form_validation->run() == FALSE) {
            $this->edit($id);
        } else {
            // Ambil data dari form
            $data = array(
                'name' => $this->input->post('name'),
                'amount' => $this->input->post('amount'),
                'date' => $this->input->post('date'),
                'notes' => $this->input->post('notes'),
                'transaksi' => $this->input->post('transaksi') // Ambil nilai transaksi
            );

            // Tentukan nilai is_masuk dan is_keluar berdasarkan input transaksi
            $data['is_masuk'] = ($data['transaksi'] == 'masuk') ? 1 : 0;
            $data['is_keluar'] = ($data['transaksi'] == 'keluar') ? 1 : 0;

            // Panggil model untuk memperbarui data
            $this->record_model->updateRecord($id, $data);
            redirect('records');
        }
    }
    
    public function delete($id) {
        $this->record_model->deleteRecord($id);
        redirect('records');
    }
}
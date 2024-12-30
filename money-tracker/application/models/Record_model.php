<?php
use GuzzleHttp\Client;

class Record_model extends CI_Model {

    private $client;

    public function __construct() {
        $this->client = new Client([
            // TODO: Tambahkan Base URL API
            'base_uri' => "https://backend-dot-tespbo-445812.et.r.appspot.com",
        ]);
    }

    public function getDataCount() {
        $response = $this->client->request('GET', '/dashboard', []);
        $result = json_decode($response->getBody()->getContents(), true);

        return $result[0];
    }

    public function getLastTenRecords() {
        $response = $this->client->request('GET', '/getlast10records', []);
        $result = json_decode($response->getBody()->getContents(), true);

        return $result;
    }

    public function getTopExpense() {
        $response = $this->client->request('GET', '/gettopexpense', []);
        $result = json_decode($response->getBody()->getContents(), true);

        return $result;
    }

    public function getAllRecords() {
        $response = $this->client->request('GET', '/getrecords', []);
        $result = json_decode($response->getBody()->getContents(), true);

        return $result;
    }

    public function getRecordById($id) {
        $response = $this->client->request('GET', '/getrecord/'.$id, []);
        $result = json_decode($response->getBody()->getContents(), true);

        return $result[0];
    }

    public function insertRecord() {
        $type = $this->input->post('recordtype');
        $amount = $this->input->post('amount');
    
        // Mengubah jumlah jika tipe adalah pengeluaran
        if ($type == "expense") {
            $amount = $amount * -1;
        }
    
        // Menentukan status transaksi
        $transaksi = $this->input->post('transaksi');
        $is_masuk = ($transaksi == 'masuk') ? 1 : 0;
        $is_keluar = ($transaksi == 'keluar') ? 1 : 0;
    
        $response = $this->client->request('POST', '/insertrecord', [
            'multipart' => [
                [
                    'name' => 'amount',
                    'contents' => $amount
                ],
                [
                    'name' => 'name',
                    'contents' => $this->input->post('name')
                ],
                [
                    'name' => 'date',
                    'contents' => $this->input->post('date')
                ],
                [
                    'name' => 'notes',
                    'contents' => $this->input->post('notes')
                ],
                [
                    'name' => 'is_masuk',
                    'contents' => $this->input->post('is_masuk')
                ],
                [
                    'name' => 'is_keluar',
                    'contents' => $this->input->post('is_keluar')
                ]
            ]
        ]);
        $result = json_decode($response->getBody()->getContents(), true);
    
        return $result;
    }
    
    public function updateRecord($id) {
        $type = $this->input->post('recordtype');
        $amount = $this->input->post('amount');
    
        // Mengubah jumlah jika tipe adalah pengeluaran
        if ($type == "expense") {
            $amount = $amount * -1;
        }
    
        // Menentukan status transaksi
        $transaksi = $this->input->post('transaksi');
        $is_masuk = ($transaksi == 'masuk') ? 1 : 0;
        $is_keluar = ($transaksi == 'keluar') ? 1 : 0;
    
        $response = $this->client->request('PUT', '/editrecord/'.$id, [
            'multipart' => [
                [
                    'name' => 'amount',
                    'contents' => $amount
                ],
                [
                    'name' => 'name',
                    'contents' => $this->input->post('name')
                ],
                [
                    'name' => 'date',
                    'contents' => $this->input->post('date')
                ],
                [
                    'name' => 'notes',
                    'contents' => $this->input->post('notes')
                ],
                [
                    'name' => 'is_masuk',
                    'contents' => $is_masuk
                ],
                [
                    'name' => 'is_keluar',
                    'contents' => $is_keluar
                ]
            ]
        ]);
        $result = json_decode($response->getBody()->getContents(), true);
    
        return $result;
    }

    public function deleteRecord($id) {
        $response = $this->client->request('DELETE', '/deleterecord/'.$id, []);
        $result = json_decode($response->getBody()->getContents(), true);

        return $result;
    }
}
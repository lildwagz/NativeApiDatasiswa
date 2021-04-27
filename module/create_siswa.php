<?php
    // 03022021.2 : API stable with authentication

    // Tag: 180121.2

    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
    
        $nis = $_POST['nis'];
        $nama_lengkap = $_POST['nama_lengkap'];
        $jenis_kelamin = $_POST['jenis_kelamin'];
        $alamat = $_POST['alamat'];
        $nomor_telfon = $_POST['nomor_telfon'];
        $email = $_POST['email'];

        $query_tambahsiswa = "INSERT INTO `tbl_siswa` (`nis`, `nama_siswa`, `jenis_kelamin`, `alamat`, `no_telp`, `email`) VALUES ('$nis','$nama_lengkap', '$jenis_kelamin', '$alamat', '$nomor_telfon','$email')";

        if(mysqli_query($_AUTH, $query_tambahsiswa)) {
            $query_tampilkanlistsiswa = "SELECT * FROM tbl_siswa
            WHERE nis = '$nis'";
                $execute_viewlistsiswa = mysqli_query($_AUTH, $query_tampilkanlistsiswa);


            $response['message'] = "Data siswa berhasil ditambahkan kedalam database dan list berhasil ditampilkan";
            $response['code'] = 201;
            $response['status'] = true;
            $response['tambahdata'] = array();

            while($row = mysqli_fetch_array($execute_viewlistsiswa)) {

                $data = array();

                $data['nama_lengkap'] = $row['nama_siswa'];
                $data['jenis_kelamin'] = $row['jenis_kelamin'];
                $data['alamat'] = $row['alamat'];
                $data['nomor_telfon'] = $row['nomor_telfon'];
                $data['email'] = $row['email'];
                $data['tgl_terdaftar'] = $row['tgl_terdaftar'];

                array_push($response['tambahdata'], $data);
            }

            echo json_encode($response);
        }else{
            $response["message"] = trim("Oops! Sory, Data gagal ditambahkan!, periksa kembali  fieldnya.");
            $response["code"] = 400;
            $response["status"] = false;

            echo json_encode($response);
        }

        

    } else {
        $response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $response["code"] = 400;
        $response["status"] = false;

        echo json_encode($response);
    }

?>
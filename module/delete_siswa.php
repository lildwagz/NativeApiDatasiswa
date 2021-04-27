<?php
    // 03022021.2 : API stable with authentication

    // Tag: 190121.2

    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
      
            // Berhasil login
        $get_nis = $_POST['nis']; 

        $query_mencaridatasiswa = "SELECT COUNT(*) total_data FROM tbl_siswa WHERE nis = '$get_nis'";
        $execute_caridatasiswa = mysqli_query($_AUTH, $query_mencaridatasiswa);
        $get_ketersediaan_data = mysqli_fetch_assoc($execute_caridatasiswa);

        if($get_ketersediaan_data['total_data'] > 0) {

            $query_menghapusdatasiswa = "DELETE FROM tbl_siswa WHERE nis = '$get_nis'";
            $execute_penghapusandatasiswa = mysqli_query($_AUTH, $query_menghapusdatasiswa);


            $response['message'] = "Data siswa dengan nis $get_nis berhasil dihapus dari database";
            $response['code'] = 201;
            $response['status'] = true;

            echo json_encode($response);
        } else {


            $response['message'] = "Data siswa dengan nis $get_nis gagal terhapus dari database, karna data tidak tersedia";
            $response['code'] = 404;
            $response['status'] = false;
            echo json_encode($response);
        }


    } else {
        $response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $response["code"] = 400;
        $response["status"] = false;

        echo json_encode($response);
    }

?>
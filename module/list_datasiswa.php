<?php
    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {

        $kelasparam = $_POST['kelas'];
      
              
        $total_datasiswa = "SELECT COUNT(*) 'total' FROM tbl_datasiswa JOIN tbl_kelas ON tbl_kelas.id_kelas=tbl_datasiswa.id_kelas WHERE  tbl_kelas.id_kelas = '$kelasparam' ORDER BY tgl_tambah ASC";
            $execute_querytotaldatasiswa = mysqli_query($_AUTH, $total_datasiswa);
            $result_totaldatasiswa = mysqli_fetch_assoc($execute_querytotaldatasiswa);

        $walikls  = "SELECT  tbl_guru.nama_guru 
        FROM tbl_kelas 
        JOIN tbl_guru ON tbl_guru.id_guru=tbl_kelas.id_guru
        WHERE  tbl_kelas.id_kelas ='$kelasparam'";
        $execute_walikls = mysqli_query($_AUTH,$walikls);
        $result_walikls = mysqli_fetch_assoc($execute_walikls);

        $query_listnotes = "SELECT tbl_guru.nama_guru, tbl_kelas.kelas,tbl_siswa.nama_siswa, tbl_siswa.jenis_kelamin,tbl_siswa.alamat ,tbl_siswa.no_telp, tbl_siswa.email, tbl_jurusan.jurusan,tbl_siswa.tgl_terdaftar 
                FROM tbl_datasiswa 
                JOIN tbl_kelas ON tbl_kelas.id_kelas=tbl_datasiswa.id_kelas
                JOIN tbl_guru ON tbl_guru.id_guru  =tbl_kelas.id_guru
                JOIN tbl_siswa ON tbl_siswa.nis = tbl_datasiswa.nis
                JOIN tbl_jurusan ON tbl_jurusan.id_jurusan=tbl_datasiswa.id_jurusan
                WHERE tbl_kelas.id_kelas = '$kelasparam'  ORDER BY tgl_tambah ASC;";
        $execute_querylistnotes = mysqli_query($_AUTH, $query_listnotes);
            
        if ($result_totaldatasiswa['total'] == 0) {

            $response["message"] = trim("Data $kelasparam tidak ditemukan didatabase / " . $result_totaldatasiswa['total'] . " data");
            $response["code"] = 401; // Tidak ditemukan
            $response["status"] = false;
            $response["kelas"] = $kelasparam;
            $response["total_datasiswa "] = $result_totaldatasiswa['total'];

            echo json_encode($response);
        } else {

            $response["message"] = trim("Data $kelasparam berhasil ditemukan didatabase / " . $result_totaldatasiswa['total'] . " data");
            $response["code"] = 200; // Berhasil ditemukan
            $response["status"] = true;
            $response["kelas"] = $kelasparam;
            $response["wali_kelas"] = $result_walikls["nama_guru"];
            $response["total_datasiswa"] = $result_totaldatasiswa['total']; 
            $response["datakelas"] = array(); 

            while($row = mysqli_fetch_array($execute_querylistnotes)) {
                $data = array();

                $data['nama_lengkap'] = $row['nama_siswa'];
                $data['jenis_kelamin'] = $row['jenis_kelamin'];
                $data['alamat'] = $row['alamat'];
                $data['nomor_telfon'] = $row['no_telp'];
                $data['email'] = $row['email'];
                $data['jurusan'] = $row['jurusan'];
                $data['tgl_terdaftar'] = $row['tgl_terdaftar'];

                array_push($response['datakelas'], $data);
            }

            echo json_encode($response);
        }

  
        
    } else {
        $response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $response["code"] = 400;
        $response["status"] = false;

        echo json_encode($response);
    }
?>
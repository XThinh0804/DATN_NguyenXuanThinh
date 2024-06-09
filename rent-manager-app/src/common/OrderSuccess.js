import React, { useEffect } from "react";
import './ForgotPassword.css';
import {  useNavigate, useLocation } from 'react-router-dom';
import { useState } from "react";
import { changeConfirmedStatus} from "../services/fetch/ApiUtils";
import { toast } from "react-toastify";

function OrderSuccess() {
    return (
        <>
            <div className="content">
                <div className="container">
                    <div className="row">
                        <div className="col-md-6 order-md-2">
                            <img src="../../assets/img/undraw_file_sync_ot38.svg" alt="Image" className="img-fluid" />
                        </div>
                        <div className="col-md-6 contents">
                            <div className="row justify-content-center">
                                <div className="col-md-8">
                                    <div className="mb-4">
                                        <h3>Đặt phòng thành công🎉✨🎉</h3>
                                        <p className="mb-4">Bạn có thể kiểm tra email để nắm được hóa đơn và hãy giữ hóa đơn khi đến Phòng trọ.</p>
                                    </div>
                                    <AccountStatus />
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </>
    )
}




function AccountStatus() {
    const history = useNavigate();
    const location = useLocation();
  
    const handleSubmit = event => {
      event.preventDefault();
      history('/');
    };
  

    return (
        <form onSubmit={handleSubmit}>
            <input type="submit" value="Quay lại Trang Chủ" className="btn text-white btn-block btn-primary" />
        </form>
    )
}

export default OrderSuccess;
import { useState, useEffect } from "react";
import ContractService from "../../services/axios/ContractService";
import { toast } from "react-toastify";
import CheckoutService from "../../services/axios/CheckoutService";
import { useNavigate } from "react-router-dom";

const FormBooking = (props) => {
    const {price, roomId} = props;
    const history = useNavigate();
    const [roomOptions, setRoomOptions] = useState([]);
    const [numOfDays, setNumOfDays] = useState(null);
    const [contractData, setContractData] = useState({
        name: "",
        nameOfRent: "",
        phone: "",
        numOfPeople: "",
        startDate: null,
        endDate: null,
        files: [],
    });

    const handleInputChange = (event) => {
        const { name, value } = event.target;
        setContractData((prevState) => ({
            ...prevState,
            [name]: value,
        }));
    };

    useEffect(() => {
        if (contractData.startDate && contractData.endDate) {
            const start = new Date(contractData.startDate);
            const end = new Date(contractData.endDate);
            const timeDiff = Math.abs(end.getTime() - start.getTime());
            const numOfDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
            setNumOfDays(numOfDays);
        }
    }, [contractData.startDate, contractData.endDate]);

    const handleSubmit = (event) => {
        event.preventDefault();

        console.log(roomId);
        const formData = new FormData();
        formData.append('name', contractData.name);
        formData.append('roomId', roomId);
        formData.append('nameOfRent', contractData.nameOfRent);
        formData.append('numOfPeople', contractData.numOfPeople);
        formData.append('phone', contractData.phone);
        formData.append('totalPrice', price * numOfDays)
        formData.append('startDate', contractData.startDate);
        formData.append('endDate', contractData.endDate);
        formData.append('isInvoice', String(false));
        contractData.files.forEach((file, index) => {
            formData.append(`files`, file);
        });
        console.log(formData.getAll)
        toast.success("Hóa đơn sẽ được gửi vào email của bạn")
        CheckoutService.createPayment(formData)
            .then(response => {
                toast.success("Tiến hành thanh toán VNPay")
                setTimeout(() => {
                    const paymentUrl = response.data.url;
                    window.location.href = paymentUrl;
                }, 3000);

                

            })
            .then(data => {
                console.log(data);
                // Do something with the response data here
                setContractData({
                    name: '',
                    nameOfRent: '',
                    phone:'',
                    numOfPeople: '',
                    startDate: null,
                    endDate: null,
                    files: []
                });
            })
            .catch(error => {
                toast.error((error && error.message) || 'Oops! Có điều gì đó xảy ra. Vui lòng thử lại!');
            });
    };

    return (
        <>
            <div className="card-body">
                <form onSubmit={handleSubmit}>
                    <div className="row">
                        <div className="mb-3 col-md-6">
                            <label className="form-label" htmlFor="description">Họ và tên</label>
                            <input type="text" className="form-control" id="description" name="nameOfRent" value={contractData.nameOfRent} onChange={handleInputChange} required/>
                        </div>
                    </div>
                    <div className="row">
                        <div className="mb-3 col-md-6">
                            <label className="form-label" htmlFor="title">Số lượng người</label>
                            <input type="text" className="form-control" id="title" name="numOfPeople" value={contractData.numOfPeople} onChange={handleInputChange} required/>
                        </div>
                        <div className="mb-3 col-md-6">
                            <label className="form-label" htmlFor="description">Số điện thoại</label>
                            <input type="text" className="form-control" id="description" name="phone" value={contractData.phone} onChange={handleInputChange} required/>
                        </div>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="price">
                            Thời Gian Nhận Phòng trọ
                        </label>
                        <input
                            type="datetime-local"
                            className="form-control"
                            id="price"
                            name="startDate"
                            value={contractData.startDate}
                            onChange={handleInputChange}
                            required
                        />
                    </div>

                    <div className="mb-3">
                        <label className="form-label" htmlFor="price">
                            Thời Gian Trả Phòng trọ
                        </label>
                        <input
                            type="datetime-local"
                            className="form-control"
                            id="price"
                            name="endDate"
                            value={contractData.endDate}
                            onChange={handleInputChange}
                            required
                        />
                    </div>

                    <div className="mb-3">
                        <label className="form-label" htmlFor="numOfDays">
                            Số ngày thuê
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            id="numOfDays"
                            name="numOfDays"
                            value={numOfDays}
                            readOnly
                        />
                    </div>

                    
                    <div className="mb-3">
                        <label className="form-label" htmlFor="numOfDays">
                            Tổng tiền
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            id="numOfDays"
                            name="numOfDays"
                            value={(price * numOfDays)?.toLocaleString('vi-VN', {
                                style: 'currency',
                                currency: 'VND',
                            })}
                            readOnly
                        />
                    </div>

                    <button type="submit" className="btn btn-primary">
                        Thanh Toán
                    </button>
                </form>
            </div>
        </>
    );
};

export default FormBooking;



import React, { Component } from "react";
import Header from "../../common/Header";
import Footer from "../../common/Footer";
import axios from "axios"; // Import axios for making API requests
import { Swiper, SwiperSlide } from 'swiper/react';
import "react-alice-carousel/lib/alice-carousel.css";
import { Navigation } from 'swiper/modules';
import Rating from '@mui/material/Rating';
import Stack from '@mui/material/Stack';
import { Button, Comment, Form } from 'semantic-ui-react'
import 'semantic-ui-css/semantic.min.css'
import Map from "../rentaler/map/MyMapComponent";
import { saveBlog, sendEmailForContact } from "../../services/fetch/ApiUtils";
import { toast } from "react-toastify";
import FormBooking from "./FormBooking";

class RentailHomeDetail extends Component {

    constructor(props) {
        super(props);
        this.state = {
            rooms: null, // State to store fetched rooms data
            showCommentForm: false,
            content: "",
            rate: 5,
            submittingComment: false,
            comments: [],
            toEmail: "",
            description: "",
            title: "",
            nameOfRentaler: "",
        };
    }

    componentDidMount() {
        this.fetchRooms(); // Call the fetchRooms function when component mounts
        this.fetchComments();
    }

    handleInputChange = (event) => {
        const { name, value } = event.target;
        this.setState({ [name]: value });
    };

    handleSubmit = (event) => {
        event.preventDefault();
        const sendEmailRequest = { title: this.state.title, nameOfRentaler: this.state.nameOfRentaler, toEmail: this.state.toEmail, description: this.state.description };
        sendEmailForContact(sendEmailRequest).then(response => {
            console.log(response.message)
            toast.success(response.message)
            this.setState({
                title: "",
                nameOfRentaler: "",
                description: ""
            })
        }).catch(
            error => {
                toast.error((error && error.message) || 'Oops! Có điều gì đó xảy ra. Vui lòng thử lại!');
            }
        )
    };


    fetchRooms = async () => {
        try {
            const id = window.location.pathname.split("/").pop();
            const response = await axios.get(`http://localhost:8080/room/${id}`);
            const data = response.data; // Assuming API returns rooms data

            this.setState({
                rooms: data,
            });
            this.setState({
                toEmail: data.user.email
            })
        } catch (error) {
            console.error("Error fetching rooms:", error);
        }
    };

    fetchComments = async () => {
        try {
            const id = window.location.pathname.split("/").pop();
            const response = await axios.get(`http://localhost:8080/room/${id}/comments`);
            const comments = response.data; // Assuming API returns comments data

            this.setState({
                comments: comments,
            });
        } catch (error) {
            console.error("Error fetching comments:", error);
        }
    };

    handleSaveBlog = (id) => {
        const storeRequest = { roomId: id };
        saveBlog(storeRequest)
            .then(response => {
                toast.success(response.message)
            })
            .catch(error => {
                toast.error((error && error.message) || 'Vui lòng đăng nhập để có thể lưu bài đăng.');
            });

    }

    handleSubmitComment = async (event) => {
        event.preventDefault();
        const { content, rate, rooms } = this.state;
        const roomId = window.location.pathname.split("/").pop();; // Assuming room id is available

        // Construct the comment data
        const commentData = {
            content: content,
            rateRating: rate,
            room_id: roomId,
        };

        // Replace with your JWT token retrieval logic from localStorage
        const accessToken = localStorage.getItem("accessToken");

        try {
            this.setState({ submittingComment: true });
            // Make the API request to submit the comment
            const response = await axios.post(
                `http://localhost:8080/room/${roomId}/comments`,
                commentData,
                {
                    headers: {
                        Authorization: `Bearer ${accessToken}`,
                    },
                }
            );

            // Handle success and reset the form
            console.log("Comment submitted:", response.data);
            this.setState({
                content: "",
                rate: 5,
                submittingComment: false,
                showCommentForm: false, // Hide the form after submitting
            });
            this.fetchComments();
        } catch (error) {
            console.log(commentData)
            console.error("Error submitting comment:", error);
            this.setState({ submittingComment: false });
        }
    };



    render() {

        const { rooms, comments, showCommentForm, content, rate, submittingComment } = this.state;

        return (
            <>
                <Header authenticated={this.props.authenticated} currentUser={this.props.currentUser} onLogout={this.props.onLogout} />
                <main id="main">
                    <section class="intro-single">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 col-lg-8">
                                    <div class="title-single-box">
                                        <h1 class="title-single">{rooms ? rooms.title : ""} </h1>
                                        <span class="color-text-a">Khu vực: {rooms ? rooms.location.cityName : ""}</span> &nbsp;&nbsp;
                                        <button type="button" onClick={() => this.handleSaveBlog(rooms?.id)} class="btn btn-outline-success rounded-pill">Lưu +</button>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-4">
                                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="/">Trang chủ</a>
                                            </li>
                                            <li class="breadcrumb-item">
                                                {rooms ? rooms.category.name : ""}
                                            </li>
                                            {/* <li class="breadcrumb-item">
                                                <a href="property-grid.html">Properties</a>
                                            </li> */}
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="property-single nav-arrow-b">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <div id="property-single-carousel" class="swiper">
                                        <div>

                                            <Swiper autoHeight={true} navigation={true} modules={[Navigation]} className="swiper-wrapper">
                                                {rooms && rooms.roomMedia.map((media) => (
                                                    <SwiperSlide className="carousel-item-b swiper-slide" >
                                                        <img src={media.files} alt="" style={{ width: "100%", height: "100%" }} />
                                                    </SwiperSlide>
                                                ))}
                                            </Swiper>
                                        </div>

                                    </div>
                                    <div class="property-single-carousel-pagination carousel-pagination"></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="row justify-content-between">
                                        <div class="col-md-5 col-lg-4">
                                            <div class="property-price d-flex justify-content-center foo">
                                                <div class="card-header-c d-flex">
                                                    <div class="card-box-ico">
                                                        <span class="bi bi-cash"></span>
                                                    </div>
                                                    <div class="card-title-c align-self-center">
                                                        <h5 class="title-c">{rooms ? rooms.price.toLocaleString('vi-VN', {
                                                            style: 'currency',
                                                            currency: 'VND',
                                                        })+"/ngày" : ""}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="property-summary">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="title-box-d section-t4">
                                                            <h3 class="title-d">Tóm tắt nhanh</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="summary-list">
                                                    <ul class="list">
                                                        <li class="d-flex justify-content-between">
                                                            <strong>Địa chỉ:</strong>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <span>{rooms && rooms.address}</span>
                                                        </li>
                                                        <li class="d-flex justify-content-between">
                                                            <strong>Loại Phòng trọ</strong>
                                                            <span>{rooms && rooms.category.name}</span>
                                                        </li>
                                                        <li class="d-flex justify-content-between">
                                                            <strong>Trạng thái:</strong>
                                                            <span>{rooms && rooms.status ? (rooms.status == "ROOM_RENT" ? "Cho thuê" : "Đã cho thuê") : ""}</span>
                                                        </li>
                                                        <li class="d-flex justify-content-between">
                                                            <strong>Khu vực</strong>
                                                            <span>
                                                                {rooms && rooms.location.cityName}
                                                            </span>
                                                        </li>
                                                        {rooms && rooms.assets.map((item) => (
                                                            <li class="d-flex justify-content-between">
                                                                <strong>{item.name}:</strong>
                                                                <span>{item.number}</span>
                                                            </li>
                                                        ))}
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-7 col-lg-7 section-md-t3">
                                            <br></br>
                                            <div className="col-md-12 mt-3">
                                                <div class="title-box-d">
                                                    <h3 class="title-d">Thông tin đặt Phòng trọ</h3>
                                                </div>
                                                <FormBooking roomId={window.location.pathname.split("/").pop()} price={rooms?.price} />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </section>

                </main>
                <Footer />
            </>
        )
    }
}

export default RentailHomeDetail;
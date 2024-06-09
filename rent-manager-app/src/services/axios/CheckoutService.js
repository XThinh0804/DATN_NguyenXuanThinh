import axios from "axios"
import { ACCESS_TOKEN } from "../../constants/Connect";

const BASE_URL = "http://localhost:8080/"

class CheckoutService {

  createPayment(formData) {
    return axios.post(BASE_URL + 'create_payment', formData,
      {
        headers: {
          Authorization: `Bearer ${localStorage.getItem(ACCESS_TOKEN)}`
        }
      }
    );

  }
}
export default new CheckoutService();
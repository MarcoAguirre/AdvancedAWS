import { toast } from "react-toastify";
import axios from "axios";
export const request = async (method: string, id: number) => {
  try {
    const axiosRequest = await axios({
      method,
      url: `https://pokeapi.co/api/v2/pokemon/${id}`,
    });
    return await axiosRequest.data;
  } catch (error: any) {
    const errorMessage = error.response.data.detail;
    toast.error(errorMessage, {
      toastId: errorMessage,
    });
    return error;
  }
};

export const randomNumber = (min: number) => {
  return Math.floor(Math.random() * (1015 - min + 1) + min)
}

package com.example.case_study.controllers.admin;

import com.example.case_study.dto.OrderDto;
import com.example.case_study.dto.OrderItemDto;
import com.example.case_study.enity.OrderStatus;
import com.example.case_study.service.order.IOrderService;
import com.example.case_study.service.order.OrderService;
import com.example.case_study.service.order_item.IOrderItemService;
import com.example.case_study.service.order_item.OrderItemService;
import com.example.case_study.service.order_status.IOrderStatusService;
import com.example.case_study.service.order_status.OrderStatusService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrderController", value = "/admin/orders")
public class AdminOrderController extends AdminBaseController{
    private final IOrderService orderService = new OrderService();
    private final IOrderItemService orderItemService = new OrderItemService();
    private final IOrderStatusService orderStatusService = new OrderStatusService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!checkAdmin(req, resp)) {
            return;
        }
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "searchOrderCustomer":
                searchOrderCustomer(req, resp);
                break;
            case "orderDetail":
                showOrderDetail(req, resp);
                break;
            default:
                showOrder(req, resp);
        }
    }

    private void showOrder(HttpServletRequest req, HttpServletResponse resp) {
        List<OrderDto> orders = orderService.findAll();
        req.setAttribute("orders", orders);
        req.setAttribute("currentAction", "orders");
        try {
            req.getRequestDispatcher(req.getContextPath() + "/admin/orders.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchOrderCustomer(HttpServletRequest req, HttpServletResponse resp) {
        String nameCustomer = req.getParameter("searchOrderCustomer");
        List<OrderDto> orders = orderService.searchOrderByUserName(nameCustomer);
        req.setAttribute("orders", orders);
        req.setAttribute("searchOrderCustomer", nameCustomer);
        req.setAttribute("currentAction", "orders");
        try {
            req.getRequestDispatcher(req.getContextPath() + "/admin/orders.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!checkAdmin(req, resp)) {
            return;
        }
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "orderDetail":
                showOrderDetail(req, resp);
                break;
            case "orderItemDelete":
                orderItemDelete(req, resp);
                break;
            case "orderStatusUpdate":
                orderStatusUpdate(req, resp);
                break;
            default:
                showOrder(req, resp);
        }
    }
    private void showOrderDetail(HttpServletRequest req, HttpServletResponse resp) {
        int orderId = Integer.parseInt(req.getParameter("orderId"));
        OrderDto order = orderService.getOrderByOrderId(orderId);
        List<OrderItemDto> orderItems = orderItemService.findOrderItemByOrderId(orderId);
        List<OrderStatus> orderStatuses = orderStatusService.findAll();
        req.setAttribute("order", order);
        req.setAttribute("orderItems", orderItems);
        req.setAttribute("currentAction", "orders");
        req.setAttribute("orderStatuses", orderStatuses);
        try {
            req.getRequestDispatcher(req.getContextPath() + "/admin/order-detail.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void orderItemDelete(HttpServletRequest req, HttpServletResponse resp) {
        int orderId = Integer.parseInt(req.getParameter("orderId"));
        int orderItemId = Integer.parseInt(req.getParameter("orderItemId"));
        boolean isSuccess = orderItemService.deleteOrderItem(orderItemId);
        String mess = "Xóa không thành công!";
        if (isSuccess) {
            mess = "Xóa thành công!";
        }
        try {
            redirectValidate(req, resp, "/admin/orders?action=orderDetail&orderId=" + orderId + "&message=", mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void orderStatusUpdate(HttpServletRequest req, HttpServletResponse resp) {
        int orderStatusId =  Integer.parseInt(req.getParameter("orderStatusId"));
        int orderId =  Integer.parseInt(req.getParameter("orderId"));
        boolean isSuccess = orderService.updateOrder(orderId, orderStatusId);
        String mess = "Cập nhật không thành công!";
        if (isSuccess) {
            mess = "Cập nhật thành công!";
        }
        try {
            redirectValidate(req, resp, "/admin/orders?action=orders&message=", mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

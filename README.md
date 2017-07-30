# DoAnWeb2
@model List<ElectronicStore.Models.CartItem>
@{
    ViewBag.Title = "Cart";
    int subtotal = 0;
}

<div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="btn btn-default">Your Counts: <span class="badge">@Model.Count</span></div>
        </div>
        <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>
                            Code
                        </th>
                        <th>
                            Title
                        </th>
                        <th>
                            Image
                        </th>
                        <th>
                            Quantity
                        </th>
                        <th>
                            Unit Price
                        </th>
                        <th>
                            Total
                        </th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @if (Model.Count > 0)
                    {
                        foreach (var item in Model)
                        {
                            <tr>
                                <td>
                                    @item.Product.Id
                                </td>
                                <td>
                                    @item.Product.Name
                                </td>
                                <td>
                                    <img src="@item.Product.ImageUrl" width="100" />
                                </td>
                                <td>
                                    <input type="number" class="txtQuantity quantity" data-id="@item.Product.Id" min="1" max="@item.Product.Quantity" width="50" value="@item.Quantity" />
                                </td>
                                <td>
                                    @item.Product.Price
                                </td>
                                <td>
                                    <i class="fa fa-usd" aria-hidden="true"></i>@(item.Product.Price * item.Quantity)
                                </td>
                                <td><a href="#" data-id="@item.Product.Id" class="btn-delete">Delete</a></td>
                            </tr>
                            subtotal += item.Product.Price * item.Quantity;
                        }
                    }
                    else
                    {
                        <tr><td>You have no product</td></tr>
                    }
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4"></td>
                        @if (Model.Count == 1)
                        {
                            <td>Subtotal (@Model.Count item):</td>
                        }
                        else
                        {
                            <td>Subtotal (@Model.Count items):</td>
                        }
                        <td><i class="fa fa-usd" aria-hidden="true"></i>@subtotal</td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <div class="panel-footer">
            <button id="btnContinue" class="btn btn-primary">Continuo shopping</button>
            <button id="btnUpdate" class="btn btn-info">Update</button>
            <button id="btnDeleteAll" class="btn btn-danger">Delete all items</button>
            <button id="btnPayment" class="btn btn-success">Payment</button>
        </div>
    </div>
</div>
@section Scripts {
    <script src="/Assets/Client/js/plugin/cart.js"></script>
}

﻿using ExtraaEdge.BAL;
using ExtraaEdge.DAL;
using ExtraaEdge.DAL.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ExtraaEdge.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly ApplicationDbContext dbContext;
        private readonly ProductService _service;

        public ProductController(ApplicationDbContext dbContext)

        {
            this.dbContext = dbContext;
            this._service = new ProductService(dbContext);
        }

        [Authorize]
        [HttpGet]
        public async Task<IActionResult> GetAllProducts()
        {
            var products = await _service.GetAllProductsAsync();
            return Ok(products);
        }

        [Authorize]
        [HttpGet("{id}")]
        public async Task<IActionResult> GetProductById(int id)
        {
            var product = await _service.GetProductByIdAsync(id);
            if (product == null) return NotFound();
            return Ok(product);
        }

        [Authorize]
        [HttpPost]
        public async Task<IActionResult> AddProduct(Product product)
        {
            await _service.AddProductAsync(product);
            return CreatedAtAction(nameof(GetProductById), new { id = product.ProductId }, product);
        }

        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProduct(int id, Product product)
        {
            if (id != product.ProductId) return BadRequest();
            await _service.UpdateProductAsync(product);
            return NoContent();
        }

        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            await _service.DeleteProductAsync(id);
            return NoContent();
        }

        [Authorize]
        [HttpPost("bulk-insert")]
        public async Task<IActionResult> BulkInsert(IEnumerable<Product> products)
        {
            await _service.BulkInsertAsync(products);
            return Ok();
        }

        [Authorize]
        [HttpPut("bulk-update")]
        public async Task<IActionResult> BulkUpdate(IEnumerable<Product> products)
        {
            await _service.BulkUpdateAsync(products);
            return Ok();
        }

      

        [Authorize(Roles = "Admin")]
        [HttpGet("profit-loss")]
        public async Task<IActionResult> GetProfitLoss([FromQuery] DateTime fromDate, [FromQuery] DateTime toDate, [FromQuery] DateTime compareWith)
        {
            
                var profitLoss = await _service.CalculateProfitLossAsync(fromDate, toDate, compareWith);

            if (profitLoss > 0)
            {
                return Ok(new { Message = "TotalProfit", Amount = profitLoss });
            }
            else
            {
                return Ok(new { Message = "TotalLoss", Amount = profitLoss });
            }


        }

        [Authorize(Roles = "Admin")]
        [HttpGet("{id}/best-price")]
        public async Task<IActionResult> GetBestPrice(int id)
        {
            var bestPrice = await _service.GetBestPriceAsync(id);
            return Ok(bestPrice);
        }

    }
}

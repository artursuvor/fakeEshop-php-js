document.addEventListener('DOMContentLoaded', () => {
    const productList = document.getElementById('product-list');
    fetch('../backend/products.php') 
        .then((response) => response.json())
        .then(products => {
            products.forEach(product => {
                const productDiv = document.createElement('div');
                productDiv.classList.add('product');

                productDiv.innerHTML = `
                    <h3>${product.name}</h3>
                    <p>${product.description}</p>
                    <p><strong>Price:</strong> $${parseFloat(product.price).toFixed(2)}</p>
                    <p>Stock: ${product.stock}</p>
                `;
                productList.appendChild(productDiv);
            });
        })
        .catch(error => {
            console.error('Error fetching products:', error);
            productList.innerHTML = '<p>Failed to load products. Please try again later.</p>';
        });
});

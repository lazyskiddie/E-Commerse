/* Ember & Oak — frontend cart logic.
   No backend exists in this build, so the cart is persisted to
   localStorage and re-rendered on each page load. */

const CART_KEY = "eo_cart";
const SHIPPING_FLAT = 6.50;
const FREE_SHIPPING_OVER = 50;

function getCart() {
  try {
    const raw = localStorage.getItem(CART_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch (e) {
    return [];
  }
}

function saveCart(cart) {
  localStorage.setItem(CART_KEY, JSON.stringify(cart));
  updateCartCount();
}

function updateCartCount() {
  const cart = getCart();
  const count = cart.reduce((sum, item) => sum + item.qty, 0);
  document.querySelectorAll("#cartCount").forEach(el => {
    el.textContent = count;
    el.style.display = count > 0 ? "inline-flex" : "none";
  });
}

function addToCart(id, name, price, tone, glyph, qty) {
  qty = qty || 1;
  const cart = getCart();
  const existing = cart.find(item => item.id === id);
  if (existing) {
    existing.qty += qty;
  } else {
    cart.push({ id, name, price: parseFloat(price), tone, glyph, qty });
  }
  saveCart(cart);
  flashAdded(id);
}

function flashAdded(id) {
  const btn = document.querySelector('[data-add-id="' + id + '"]');
  if (!btn) return;
  const original = btn.textContent;
  btn.textContent = "Added \u2713";
  setTimeout(() => { btn.textContent = original; }, 1200);
}

function removeFromCart(id) {
  let cart = getCart();
  cart = cart.filter(item => item.id !== id);
  saveCart(cart);
  renderCartPage();
}

function changeCartQty(id, delta) {
  const cart = getCart();
  const item = cart.find(i => i.id === id);
  if (!item) return;
  item.qty = Math.max(1, item.qty + delta);
  saveCart(cart);
  renderCartPage();
}

function currency(n) {
  return "$" + n.toFixed(2);
}

/* ---- Cart page rendering ---- */
function renderCartPage() {
  const container = document.getElementById("cartLines");
  const emptyState = document.getElementById("emptyCart");
  const summary = document.getElementById("cartSummary");
  if (!container) return;

  const cart = getCart();

  if (cart.length === 0) {
    container.innerHTML = "";
    if (emptyState) emptyState.style.display = "block";
    if (summary) summary.style.display = "none";
    return;
  }

  if (emptyState) emptyState.style.display = "none";
  if (summary) summary.style.display = "block";

  container.innerHTML = cart.map(item => `
    <div class="cart-line">
      <div class="cart-thumb ${item.tone}">${item.glyph}</div>
      <div>
        <h4>${item.name}</h4>
        <div class="origin">${currency(item.price)} each</div>
        <button class="remove-link" onclick="removeFromCart('${item.id}')">Remove</button>
      </div>
      <div class="qty-stepper">
        <button type="button" onclick="changeCartQty('${item.id}', -1)" aria-label="Decrease quantity">&minus;</button>
        <input type="text" readonly value="${item.qty}" aria-label="Quantity">
        <button type="button" onclick="changeCartQty('${item.id}', 1)" aria-label="Increase quantity">+</button>
      </div>
      <div class="price">${currency(item.price * item.qty)}</div>
    </div>
  `).join("");

  const subtotal = cart.reduce((sum, i) => sum + i.price * i.qty, 0);
  const shipping = subtotal === 0 || subtotal >= FREE_SHIPPING_OVER ? 0 : SHIPPING_FLAT;
  const total = subtotal + shipping;

  document.getElementById("sumSubtotal").textContent = currency(subtotal);
  document.getElementById("sumShipping").textContent = shipping === 0 ? "Free" : currency(shipping);
  document.getElementById("sumTotal").textContent = currency(total);
}

/* ---- Product detail page stepper ---- */
function initPdpStepper() {
  const input = document.getElementById("pdpQty");
  if (!input) return;
  document.getElementById("pdpQtyMinus").addEventListener("click", () => {
    input.value = Math.max(1, parseInt(input.value || "1", 10) - 1);
  });
  document.getElementById("pdpQtyPlus").addEventListener("click", () => {
    input.value = parseInt(input.value || "1", 10) + 1;
  });
}

/* ---- Checkout summary mirror (uses same cart) ---- */
function renderCheckoutSummary() {
  const list = document.getElementById("checkoutLines");
  if (!list) return;
  const cart = getCart();
  if (cart.length === 0) {
    list.innerHTML = "<p>Your cart is empty — nothing to check out yet.</p>";
    document.querySelectorAll(".checkout-layout button[type=submit]").forEach(b => b.disabled = true);
    return;
  }
  list.innerHTML = cart.map(item => `
    <div class="summary-row">
      <span>${item.name} &times; ${item.qty}</span>
      <span>${currency(item.price * item.qty)}</span>
    </div>
  `).join("");
  const subtotal = cart.reduce((sum, i) => sum + i.price * i.qty, 0);
  const shipping = subtotal >= FREE_SHIPPING_OVER ? 0 : SHIPPING_FLAT;
  document.getElementById("checkoutTotal").textContent = currency(subtotal + shipping);
}

function handleCheckoutSubmit(e) {
  e.preventDefault();
  localStorage.removeItem(CART_KEY);
  updateCartCount();
  const form = document.getElementById("checkoutForm");
  const confirmation = document.getElementById("orderConfirmation");
  if (form) form.style.display = "none";
  if (confirmation) confirmation.style.display = "block";
}

/* ---- Filter chips on the shop page ---- */
function initFilterChips() {
  const chips = document.querySelectorAll(".filter-chip");
  chips.forEach(chip => {
    chip.addEventListener("click", () => {
      const category = chip.getAttribute("data-category");
      const url = new URL(window.location.href);
      if (category === "all") {
        url.searchParams.delete("category");
      } else {
        url.searchParams.set("category", category);
      }
      window.location.href = url.toString();
    });
  });
}

document.addEventListener("DOMContentLoaded", () => {
  updateCartCount();
  renderCartPage();
  initPdpStepper();
  renderCheckoutSummary();
  initFilterChips();

  const checkoutForm = document.getElementById("checkoutForm");
  if (checkoutForm) checkoutForm.addEventListener("submit", handleCheckoutSubmit);
});
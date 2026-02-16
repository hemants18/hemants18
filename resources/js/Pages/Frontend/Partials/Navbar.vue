<template>
   <header class="main_header">
      <div class="container">
        <nav class="navbar navbar-expand-lg">
          <Link class="navbar-brand" href="/">
            <img
              src="@/assets/images/wabizboost-logo.png"
              alt="WaBizBoost"
              class="img-fluid main-logo"
            />
          </Link>
          <div class="d-flex align-items-center gap-1">
            <Link href="/signup" class="btn btn_global btn_primary btn_sm d-lg-none"
              >Register</Link
            >
            <button
              class="navbar-toggler"
              type="button"
              data-bs-toggle="offcanvas"
              data-bs-target="#offcanvasNavbar"
              aria-controls="offcanvasNavbar"
            >
              <i class="fa-solid fa-bars-staggered"></i>
            </button>
          </div>
          <div
            class="offcanvas offcanvas-start"
            tabindex="-1"
            id="offcanvasNavbar"
            aria-labelledby="offcanvasNavbarLabel"
          >
            <div class="offcanvas-header">
              <h5 class="offcanvas-title" id="offcanvasNavbarLabel">
                wabizboost
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="offcanvas"
                aria-label="Close"
              ></button>
            </div>
            <div class="offcanvas-body">
              <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <Link class="nav-link" href="/#pricing">Pricing</Link>
                </li>
                <li class="nav-item">
                  <Link class="nav-link" href="/#features">Features</Link>
                </li>
                <li class="nav-item">
                  <Link class="nav-link" href="/#solution">Solution</Link>
                </li>
                <li class="nav-item">
                  <Link class="nav-link" href="/#resources">Resources</Link>
                </li>
              </ul>
              <div class="header_actions">
                <a href="/login" class="login_link">Login</a>
                <a href="/signup" class="btn btn_global btn_primary"
                  >Start Free Trial</a
                >
                <Link href="/contact-us" class="btn btn_global btn_outline">Book Demo</Link>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </header>
</template>
<script setup>
import { Link } from '@inertiajs/vue3'
</script>
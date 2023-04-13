<template>
  <footer class="pie">
    <div>
      <ul class="navbar-nav footer">
        <li class="nav-item foot"><a href="#" class="nav-link">Términos y condiciones</a></li>
        <li class="nav-item foot"><a href="#" class="nav-link">Cómo cuidamos tu privacidad</a></li>
        <li class="nav-item foot"><a href="#" class="nav-link">Accesibilidad</a></li>
        <li class="nav-item foot"><a href="#" class="nav-link">Ayuda</a></li>
      </ul>
    </div>
    <div class="fout">
      <p class="pt-1">© 2023 Oficios de México, S. de R.L. de C.V. identificada bajo la marca comercial "Chambeaya".</p>
      <p>Dirección conocida, Ciudad de México, CDMX, Mexico</p>
    </div>
  </footer>
</template>

<style scoped>
.footer {
  display: inline-block;
  width: 100%;
}

.foot {
  display: inline-block;
  padding-left: 2rem;
  padding-top: 1rem;
  font-size: 13px;
  color: #000000;
}

.fout {
  font-size: 12px;
  padding-left: 2rem;
  color: #999;
  margin: 0;
  padding-bottom: .5rem;
  text-align: center;
}
.pie{
  background: #d4d4d4;
  margin-top: 2rem;
}
@media screen and (max-width: 576px) {
  .foot {
    display: block;
    padding-left: 0;
    text-align: center;
  }
}
</style>

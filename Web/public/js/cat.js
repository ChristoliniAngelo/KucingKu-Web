document.addEventListener('DOMContentLoaded', () => {
  const catsContainer = document.getElementById('cats-container');
  const catOverlay = document.getElementById('cat-overlay');
  const closeOverlay = document.getElementById('close-overlay');
  const catImage = document.getElementById('cat-image');
  const catName = document.getElementById('cat-name');
  const catGender = document.getElementById('cat-gender');
  const catAge = document.getElementById('cat-age');
  const catLocation = document.getElementById('cat-location');
  const catColor = document.getElementById('cat-color');
  const catVaccineStatus = document.getElementById('cat-vaccine-status');
//   const catCluster = document.getElementById('cat-cluster');

  const createCatCard = (cat) => {
      const catCard = document.createElement('div');
      catCard.classList.add('cat-card');
      catCard.innerHTML = `
          <img src="${cat.FotoKucing}" alt="Cat Image" id="cat-card-image-${cat.id}">
          <h3><strong>${cat.nama_kucing}</strong></h3>
          <p>Jenis Kelamin: ${cat.jenis_kelamin}</p>
      `;

      catCard.addEventListener('click', () => {
          catImage.src = cat.FotoKucing;
          catName.innerText = cat.nama_kucing;
          catGender.innerText = cat.jenis_kelamin;
          catAge.innerText = cat.umur;
          catLocation.innerText = cat.lokasi;
          catColor.innerText = cat.warna;
          catVaccineStatus.innerText = cat.status_vaksinasi;

          catOverlay.style.display = 'flex';
      });

      return catCard;
  };

  fetch('http://localhost:3000/result')
      .then(response => {
          if (!response.ok) {
              throw new Error('Network response was not ok');
          }
          return response.json();
      })
      .then(data => {
          if (data.length === 0) {
              catsContainer.innerHTML = '<p>No cats available.</p>';
              return;
          }

          data.forEach(cat => {
              const catCard = createCatCard(cat);
              catsContainer.appendChild(catCard);
          });
      })
      .catch(error => {
          console.error('Error fetching cat data:', error);
          catsContainer.innerHTML = '<p>Failed to load cat data. Please try again later.</p>';
      });

  closeOverlay.addEventListener('click', () => {
      catOverlay.style.display = 'none';
  });

  catOverlay.addEventListener('click', (event) => {
      if (event.target === catOverlay) {
          catOverlay.style.display = 'none';
      }
  });
});

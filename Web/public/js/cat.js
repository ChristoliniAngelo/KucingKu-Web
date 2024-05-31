// Fetch cat data from the server
fetch('/catsData')
  .then(response => response.json())
  .then(catsData => {
    // Display the fetched cats
    const catsContainer = document.getElementById('cats-container');

    catsData.forEach(cat => {
      const catCard = document.createElement('div');
      catCard.classList.add('cat-card');

      const catImage = document.createElement('img');
      catImage.src = cat.FotoKucing; // Assuming FotoKucing contains the image URL
      catImage.alt = 'Cat';

      const catDetails = document.createElement('div');
      catDetails.classList.add('cat-details');
      catDetails.innerHTML = `
        <p>Name: ${cat.nama_kucing}</p>
        <p>Gender: ${cat.jenis_kelamin}</p>
        <p>Age: ${cat.umur}</p>
        <p>Color: ${cat.warna}</p>
        <p>Location: ${cat.lokasi}</p>
        <p>Vaccination Status: ${cat.status_vaksinasi}</p>
        <p>Cluster: ${cat.ClusterKucing}</p>
      `;

      catCard.appendChild(catImage);
      catCard.appendChild(catDetails);
      catsContainer.appendChild(catCard);
    });
  })
  .catch(error => console.error('Error fetching cat data:', error));

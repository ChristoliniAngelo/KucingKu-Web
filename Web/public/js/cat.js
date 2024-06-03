document.addEventListener('DOMContentLoaded', () => {
  // Fetch recommendation data from the server
  fetch('/result')
      .then(response => {
          // Check if response is ok
          if (!response.ok) {
              throw new Error('Network response was not ok');
          }
          return response.json(); // Parse JSON response
      })
      .then(recommendationData => {
          const catsContainer = document.getElementById('cats-container');

          // Check if recommended_cat_clusters exist and is not empty
          if (recommendationData.recommended_cat_clusters && recommendationData.recommended_cat_clusters.length > 0) {
              recommendationData.recommended_cat_clusters.forEach(cluster => {
                  // Create a div for each recommended cat cluster
                  const catDiv = document.createElement('div');
                  catDiv.classList.add('cat');

                  // Construct HTML content for cat details
                  catDiv.innerHTML = `
                      <h3>Cat Cluster: ${cluster.ClusterKucing}</h3>
                      <p>Name: ${cluster.nama_kucing}</p>
                      <p>Gender: ${cluster.jenis_kelamin}</p>
                      <p>Age: ${cluster.umur}</p>
                      <p>Color: ${cluster.warna}</p>
                      <p>Location: ${cluster.lokasi}</p>
                      <p>Vaccination Status: ${cluster.status_vaksinasi}</p>
                      <img src="${cluster.FotoKucing}" alt="Cat Image">
                  `;
                  
                  catsContainer.appendChild(catDiv);
              });
          } else {
              // If no recommendations available, display a message
              catsContainer.textContent = 'No recommendations available';
          }
      })
      .catch(error => {
          console.error('Error fetching recommendation data:', error);
          const catsContainer = document.getElementById('cats-container');
          catsContainer.textContent = 'Error fetching recommendation data';
      });
});

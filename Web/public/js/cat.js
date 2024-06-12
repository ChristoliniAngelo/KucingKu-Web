    document.addEventListener('DOMContentLoaded', () => {
        const catsContainer = document.getElementById('cats-container');
        const loadMoreBtn = document.getElementById('load-more-btn');
        const catOverlay = document.getElementById('cat-overlay');
        const closeOverlay = document.getElementById('close-overlay');
        const catImage = document.getElementById('cat-image');
        const catName = document.getElementById('cat-name');
        const catGender = document.getElementById('cat-gender');
        const catAge = document.getElementById('cat-age');
        const catLocation = document.getElementById('cat-location');
        const catColor = document.getElementById('cat-color');
        const catVaccineStatus = document.getElementById('cat-vaccine-status');
        const overlayContent = document.querySelector('.overlay-content');

        let catsData = [];
        let catsDisplayed = 9;
        const catsPerPage = 6;

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

        const displayCats = () => {
            catsContainer.innerHTML = '';

            for (let i = 0; i < catsDisplayed && i < catsData.length; i++) {
                const catCard = createCatCard(catsData[i]);
                catsContainer.appendChild(catCard);
            }

            if (catsDisplayed >= catsData.length) {
                loadMoreBtn.style.display = 'none';
            } else {
                loadMoreBtn.style.display = 'block';
            }
        };

        const loadMoreCats = () => {
            catsDisplayed += catsPerPage;
            displayCats();
        };

        const fetchCatsData = () => {
            fetch('http://localhost:3000/result')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    catsData = data;
                    displayCats();
                })
                .catch(error => {
                    console.error('Error fetching cat data:', error);
                    catsContainer.innerHTML = '<p>Failed to load cat data. Please try again later.</p>';
                });
        };

        const adoptButton = document.createElement('button');
        adoptButton.innerText = 'Adopt';
        adoptButton.classList.add('overlay-button');
        adoptButton.addEventListener('click', () => {
            // Tambahkan overlay konfirmasi
            const confirmationOverlay = document.createElement('div');
            confirmationOverlay.classList.add('overlay','confirmation-overlay');
            confirmationOverlay.style.zIndex = '200';
            const confirmationMessage = document.createElement('div');
            confirmationMessage.classList.add('message','confirmation-message');
            confirmationMessage.innerHTML = `
                <p>Apakah Anda yakin ingin mengadopsi kucing ini?</p>
                <div class="button-container">
                    <button class="confirm-adopt overlay-button">Ya</button>
                    <button class="cancel-adopt overlay-button">Tidak</button>
                </div>
            `;
            confirmationOverlay.appendChild(confirmationMessage);
            document.body.appendChild(confirmationOverlay);

            // Jika pengguna menyetujui
            document.querySelector('.confirm-adopt').addEventListener('click', () => {
                document.body.removeChild(confirmationOverlay);
    
                const satisfactionOverlay = document.createElement('div');
                satisfactionOverlay.classList.add('rating-overlay');
                satisfactionOverlay.style.zIndex = '300'; // Ensure it is above other overlays
                
                const satisfactionMessage = document.createElement('div');
                satisfactionMessage.classList.add('rating-message');
                satisfactionMessage.innerHTML = `
                    <p>Seberapa puas Anda dengan sistem rekomendasi ini?</p>
                    <div class="rating-container"></div>
                `;
                
                satisfactionOverlay.appendChild(satisfactionMessage);
                document.body.appendChild(satisfactionOverlay);
    
                const ratingContainer = satisfactionOverlay.querySelector('.rating-container');
                for (let i = 1; i <= 5; i++) {
                    const star = document.createElement('span');
                    star.classList.add('star');
                    star.setAttribute('data-rating', i);
                    star.innerHTML = '&#9733;';
                    ratingContainer.appendChild(star);
                }
    
                function handleStarRating(event) {
                    const selectedRating = parseInt(event.target.getAttribute('data-rating'));
                    console.log('Rating:', selectedRating);
                    // Add logic to send rating and remove overlay
                    document.body.removeChild(satisfactionOverlay);
                }
    
                const stars = satisfactionOverlay.querySelectorAll('.star');
                stars.forEach(star => {
                    star.addEventListener('mouseenter', (event) => {
                        const rating = parseInt(event.target.getAttribute('data-rating'));
                        stars.forEach((s, index) => {
                            if (index < rating) {
                                s.style.color = 'gold';
                            } else {
                                s.style.color = 'gray';
                            }
                        });
                    });
    
                    star.addEventListener('click', handleStarRating);
                    star.style.fontSize = '30px'; // Inline styling for star size
                    star.style.cursor = 'pointer'; // Ensure the stars are clickable
                });
    
                satisfactionOverlay.addEventListener('click', (event) => {
                    if (event.target === satisfactionOverlay) {
                        document.body.removeChild(satisfactionOverlay);
                    }
                });
            });

            // Jika pengguna membatalkan
            document.querySelector('.cancel-adopt').addEventListener('click', () => {
                // Hapus overlay pertama
                document.body.removeChild(confirmationOverlay);
            });
        });

        const cancelButton = document.createElement('button');
        cancelButton.innerText = 'Cancel';
        cancelButton.classList.add('overlay-button');
        cancelButton.addEventListener('click', () => {
            catOverlay.style.display = 'none';
        });

        const buttonContainer = document.createElement('div');
        buttonContainer.classList.add('button-container');
        buttonContainer.appendChild(adoptButton);
        buttonContainer.appendChild(cancelButton);
        overlayContent.appendChild(buttonContainer);

        catOverlay.addEventListener('click', (event) => {
            if (event.target === catOverlay) {
                catOverlay.style.display = 'none';
            }
        });

        closeOverlay.addEventListener('click', () => {
            catOverlay.style.display = 'none';
        });

        loadMoreBtn.addEventListener('click', loadMoreCats);

        fetchCatsData();
    });

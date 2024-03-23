import numpy as np

import numpy as np

def dodaj_padding(slika, padding_visina, padding_sirina):
    visina, sirina = slika.shape
    nova_visina = visina + 2 * padding_visina
    nova_sirina = sirina + 2 * padding_sirina
    slika_z_paddingom = np.zeros((nova_visina, nova_sirina), dtype=slika.dtype)
    slika_z_paddingom[padding_visina:-padding_visina, padding_sirina:-padding_sirina] = slika
    return slika_z_paddingom

def konvolucija(vhodna_slika, konvolucijsko_jedro):
    visina_slike, sirina_slike = vhodna_slika.shape
    visina_jedra, sirina_jedra = konvolucijsko_jedro.shape

    padding_visina = visina_jedra // 2
    padding_sirina = sirina_jedra // 2

    # 0 ob robu
    slika_z_paddingom = dodaj_padding(vhodna_slika, padding_visina, padding_sirina)

    izhodna_slika = np.zeros_like(vhodna_slika)

    for y in range(visina_slike):
        for x in range(sirina_slike):

            segment = slika_z_paddingom[y:y + visina_jedra, x:x + sirina_jedra]
            izhodna_slika[y, x] = np.sum(segment * konvolucijsko_jedro)
    
    return izhodna_slika


def filtriraj_z_gaussovim_jedrom(slika,sigma):
    '''Filtrira sliko z Gaussovim jedrom..'''
    pass

def filtriraj_sobel_smer(slika):
    '''Filtrira sliko z Sobelovim jedrom in označi gradiente v orignalni sliki glede na ustrezen pogoj.'''
    pass

if __name__ == '__main__':   
    slika_diagonala = np.zeros((4, 4), dtype=np.uint8)
    np.fill_diagonal(slika_diagonala, 1)

    slika_točke = np.array([[0, 1, 0, 1],
                            [1, 0, 1, 0],
                            [0, 1, 0, 1],
                            [1, 0, 1, 0]], dtype=np.uint8)

    slika_vodoravna = np.zeros((4, 4), dtype=np.uint8)
    slika_vodoravna[2, :] = 1

    slike = [slika_diagonala, slika_točke, slika_vodoravna]

    jedro = np.array([[1, 1, 1],
                      [1, 1, 1],
                      [1, 1, 1]], dtype=np.uint8)
    
    for i, slika in enumerate(slike, 1):
        slika_konvolucija = konvolucija(slika, jedro)
        print(f"Primer {i} - Original:\n{slika}\n")
        print(f"Primer {i} - Konvolucija:\n{slika_konvolucija}\n")
        print("######################")
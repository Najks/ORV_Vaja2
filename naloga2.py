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
    slika3 = np.zeros((4, 4), dtype=np.uint8)
    slika3[1, 1] = 1

    slike = [slika3]

    jedro = np.array([[1, 1, 1],
                      [1, 1, 1],
                      [1, 1, 1]], dtype=np.uint8)
    
    for slika in slike:
        slika_konvolucija = konvolucija(slika, jedro)
        print("Original:\n", slika)
        print("Konvolucija:\n", slika_konvolucija)
        print("######################")

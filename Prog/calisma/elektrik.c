#include <stdio.h>
#include <stdlib.h>

/*
Bir elektrik dağıtım şirketi verdikleri hizmet karşılığında
müşterilerinden aylık olarak harcanan toplam kilowatt saat
miktarına ve belirli bir abonelik ücreti talep etmektedir.
Birim kilowatt saat ücreti ve abonelik ücreti her ay enflasyon
oranında artmaktadır. Buna göre müşterinin bir aya ait ödeyeceği
fatura miktarını hesaplayan program nasıl ifade edilir?

Fatura miktarı = (Harcanan elektrik * Birim fiyat) + Abonelik ücreti
*/

int main()
{
    float odenecekFatura , eskiBirimFiyat , yeniBirimFiyat , enflasyon , eskiAbonelikUcreti , yeniAbonelikUcreti;
    int yeniOkuma , eskiOkuma , toplamHarcananElektrik

    //Kullanıcı verilerinin alınması
    printf("Onceki aya ait enflasyon giriniz:");
    scanf(%f , &enflasyon);

    printf("Onceki aya ait birim fiyati giriniz:");
    scanf(%f , &eskiBirimFiyat);

    printf("Onceki abonelik ücreti giriniz:");
    scanf(%f , &eskiAbonelikUcreti);

    printf("Onceki aya ait okuma değeri giriniz:");
    scanf(%d , &eskiOkuma);

    printf("Bu aya ait okuma değeri giriniz:");
    scanf(%d , &yeniOkuma);


    toplamHarcananElektrik = yeniOkuma - eskiOkuma;
    yeniBirimFiyat = eskiBirimFiyat * (1 + enflasyon / 100);
    yeniAbonelikUcreti = eskiAbonelikUcreti * (1 + enflasyon / 100);

    odenecekFatura = (toplamHarcananElektrik * yeniBirimFiyat) + yeniAbonelikUcreti;
    printf("\n Odeyeceginiz fatura tutari: %f\n\n" , odenecekFatura);
    
    return 0;
}
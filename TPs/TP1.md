# TP 2: Le protocole TCP et le Routage
## Réseaux Avancés

24 janvier 2023  
Ryan PERSÉE

---

### Ex. 1 : TCP
#### Question 1.1

Le MSS (Maximum Segment Size) est la taille maximale des segments de données qui peuvent être transmis en une seule fois
par l'Agent/TCP/RFC793edu. Dans cet énoncé, le paramètre packetSize_ est défini comme étant 1000 bytes, ce qui est
également la taille du MSS.

Calcul du Round Trip Time (RTT) pour chacune des 4 connections :

$$
\begin{aligned}
    T_{PL}  &= \frac{MSS}{C_L} \\
            &= \frac{1000 \; \text{bytes}}{10 \; \text{Mbit/s}} \\
            &= \frac{8e3 \; \text{bits}}{1e7} \; \text{bits/s} \\
            &= 8e{-4} \; \text{s}
\end{aligned}
$$

$$
\begin{aligned}
    RTT_L   &= T_{PL} + 2\tau + T_A \\
            &= 8e{-4} + 2*10e{-3} + 0 \\
            &= 2.08e{-2} \; \text{s}
\end{aligned}
$$

Calcul du débit de transmission moyen pour un lien de gauche:

$$
\begin{aligned}
    R_L &= \frac{window * packetSize}{RTT_L} \\
        &= \frac{20 * 8e3 \; \text{bits}}{2.08e{-2} \; \text{s}} \\
        &= 7.69 \; \text{Mbits/s}
\end{aligned}
$$

#### Question 1.2

La capacité du lien de droite $C_R = 10 \; \text{Mbits/s}$ est inférieure à celle du débit total des liens de gauche
$4 * R_L = 30.76 \; \text{Mbits/s}$.

#### Question 1.3

On observe des pertes de paquets dans le réseau car le buffer du lien à droite est plein. Les paquets supplémentaires
qui arrivent seront alors éliminés car ils ne peuvent pas être stockés dans le buffer.

En moyenne un paquet venant des liens de gauche séjourne dans le buffer pendant :

$$
\begin{aligned}
    \frac{\text{bufferSize} * \text{packetSize}}{4 * R_L}   &= \frac{80 * 8e3}{4 * 7.69e6} \\
                                                            &= 2.08e{-2} \; \text{s}
\end{aligned}
$$

C'est environ le double du temps de propagation (égal à $10 \; \text{ms}$), on doit donc observer un grand nombre de
paquets perdus.

---

### Ex. 2
#### Question 2.1

Calcul du débit de transmission moyen :

$$
\begin{aligned}
    R_L &= \frac{window * packetSize}{RTT_L} \\
        &= \frac{5 * 8e3 \; \text{bits}}{2.08e{-2} \; \text{s}} \\
        &= 1.92 \; \text{Mbits/s}
\end{aligned}
$$

#### Question 2.2

En moyenne un paquet venant des liens de gauche séjourne donc dans le buffer pendant :

$$
\begin{aligned}
    \frac{\text{bufferSize} * \text{packetSize}}{4 * R_L}   &= \frac{10 * 8e3}{4 * 1.92e6} \\
                                                            &= 1.04e{-2} \; \text{s}
\end{aligned}
$$

Ce temps est légèrement supérieur au délai de propagation qui est de $10 \; \text{ms}$, on devrait donc observer peu de
pertes de paquets.

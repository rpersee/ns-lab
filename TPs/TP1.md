# TP 2: Le protocole TCP et le Routage
## Réseaux Avancés
24 janvier 2023  
Ryan PERSÉE

---

### Ex. 1 : TCP
#### Question 1.1

Le MSS (Maximum Segment Size) est la taille maximale des segments de données qui peuvent être transmis en une seule fois par l'Agent/TCP/RFC793edu. Dans cet énoncé, le paramètre packetSize_ est défini comme étant 1000 bytes, ce qui est également la taille du MSS.

Calcul du Round Trip Time (RTT) pour chacune des 4 connections :
$$
\begin{aligned}
    T_P &= \frac{MSS}{C} \\
        &= \frac{1000 \; \text{bytes}}{10 \; \text{Mbit/s}} \\
        &= \frac{8e3 \; \text{bits}}{1e7} \; \text{bits/s} \\
        &= 8e{-4} \; \text{s}
\end{aligned}
$$

$$
\begin{aligned}
    RTT &= T_P + 2\tau + T_A \\
        &= 8e{-4} + 2*10e{-3} + 0 \\
        &= 2.08e{-2} \; \text{s}
\end{aligned}
$$

Calcul du débit de tranmission moyen :
$$
\begin{aligned}
    R   &= \frac{window * packetSize}{RTT} \\
        &= \frac{20 * 8e3 \; \text{bits}}{2.08e{-2} \; \text{s}} \\
        &= 7.69 \; \text{Mbits/s}
\end{aligned}
$$

#### Question 1.2
La capacité du lien de droite $C = 10 \; \text{Mbits/s}$ est inférieure à celle du débit total des liens de gauche $4 * R = 30.76 \; \text{Mbits/s}$.

#### Question 1.3
Il est possible qu'il y ait des pertes de paquets dans le réseau si le buffer du lien à droite est plein. Les paquets supplémentaires qui arrivent seront alors éliminés car ils ne peuvent pas être stockés dans le buffer. 
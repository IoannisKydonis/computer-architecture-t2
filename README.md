# 2η εργασία Αρχιτεκτονικής Προηγμένων Υπολογιστών
## Συντελεστές (ομάδα 9):
Κυδώνης Ιωάννης, ΑΕΜ: 9407, email: ikydonis@ece.auth.gr  
Ούρδας Αντώνιος, ΑΕΜ: 9358, email: ourdasav@ece.auth.gr

## Βήμα 1

### Ερώτημα 1

Από το αρχείο εξόδου config.ini βλέπουμε ότι το υποσύστημα μνήμης χαρακτηρίζεται από τις εξής παραμέτρους:

- [system.cpu.icache] -> size = 32768 = 32kB
- [system.cpu.dcache] -> size = 65536 = 64kB
- [system.l2] -> size = 2097152 = 2MB
- [system.cpu.icache] -> assoc = 2
- [system.cpu.dcache] -> assoc = 2
- [system.l2] -> assoc = 8
- [system] -> cache_line_size = 64

### Ερώτημα 2

| Benchmark | Χρόνος Εκτέλεσης | CPI | L1 dcache miss rate | L1 icache miss rate | L2 cache miss rate |
| --- | --- | --- | --- | --- | --- |
| specbzip | 0.083656 | 1.673124 | 0.014312 | 0.000075 | 0.295245 |
| spechmmer | 0.070205 | 1.404099 | 0.006198 | 0.000170 | 0.031957 |
| speclibm | 0.174764 | 3.495270 | 0.060972 | 0.000095 | 0.999940 |
| specmcf | 0.062472 | 1.249432 | 0.002113 | 0.019032 | 0.067657 |
| specsjeng | 0.513859 | 10.277188 | 0.121831 | 0.000020 | 0.999978 |

Ακολουθούν γραφήματα με τα παραπάνω δεδομένα:

![Simulation Seconds per Benchmark](./charts/1_2/1_2_simulation_seconds.png)

![CPI per Benchmark](./charts/1_2/1_2_CPI.png)

![L1 dcache miss rate per Benchmark](./charts/1_2/1_2_l1_dcache_miss_rate.png)

![L1 icache miss rate per Benchmark](./charts/1_2/1_2_l1_icache_miss_rate.png)

![L2 cache miss rate per Benchmark](./charts/1_2/1_2_l2_cache_miss_rate.png)

Από τα παραπάνω γραφήματα παρατηρούμε ότι η συμπεριφορά ενός συστήματος μπορεί να διαφέρει σημαντικά ανάλογα με το benchmark το οποίο εκτελείται. Οπότε το κάθε benchmark από μόνο του δεν αρκεί για να μας δώσει μια συνολική εικόνα για το σύστημα.

Το μέσο CPI το οποίο προκύπτει από την εξομοίωση του κάθε benchmark φαίνεται να έχει ισχυρή συσχέτιση με το miss rate που συμβαίνει αθροιστικά και στις 3 caches.
Επιπλέον, το μέσο CPI βρίσκεται σε αντιστοιχία με τα simulation seconds.

Παρατηρούμε ότι το specmcf benchmark παρουσιάζει πολύ μεγαλύτερο miss rate στην L1 instruction cache από το οποίο μπορούμε να συμπεράνουμε ότι το benchmark αυτό τρέχει κώδικα οι εντολές του οποίου δεν εκτελούνται ακολουθιακά αλλά περιέχουν μεγάλο αριθμό από branches.

Αντίστοιχα τα benchmarks speclibm και specsjeng φαίνεται ότι προσπαθούν να κάνουν access σε δεδομένα τα οποία δεν έχουν συνέχεια στη μνήμη. Αυτό επιβεβαιώνεται τόσο από τις τιμές miss rate στην L1 data cache όσο και στην L2 cache.

### Ερώτημα 3

Κατόπιν εκτέλεσης των ιδίων benchmarks με _--cpu-clock=1GHz_ προέκυψαν τα εξής αποτελέσματα:

| Benchmark | Χρόνος Εκτέλεσης | CPI | L1 dcache miss rate | L1 icache miss rate | L2 cache miss rate |
| --- | --- | --- | --- | --- | --- |
| specbzip | 0.083656 | 1.673124 | 0.014312 | 0.000075 | 0.295245 |
| spechmmer | 0.070205 | 1.404099 | 0.006198 | 0.000170 | 0.031957 |
| speclibm | 0.174764 | 3.495270 | 0.060972 | 0.000095 | 0.999940 |
| specmcf | 0.062472 | 1.249432 | 0.002113 | 0.019032 | 0.067657 |
| specsjeng | 0.513859 | 10.277188 | 0.121831 | 0.000020 | 0.999978 |

Τα αποτελέσματα είναι ίδια με πριν καθώς η default τιμή για το cpu-clock είναι τα 2GHz.


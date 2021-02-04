# Patryk Majewski, 250134

import sys

def compute_delta(pattern, alphabet):
    m = len(pattern)
    d = {(q, a): 0 for q in range(m + 1) for a in alphabet}
    for q in range(m+1):
        for a in alphabet:
            k = min([m, q+1])
            while k > 0 and pattern[:k] != (pattern[:q] + a)[-k:]:
                k -= 1
            d[q, a] = k
    return d


def match(text, delta, m):
    n = len(text)
    q = 0
    for i in range(n):
        q = delta[q, text[i]]
        if q == m:
            print("Pattern occurs with shift", i-m+1)

if __name__ == "__main__":
    pattern = sys.argv[1]
    with open(sys.argv[2]) as file:
        text = file.read()
    alphabet = {a for a in text}
    print(f'Pattern: "{pattern}"')
    match(text, compute_delta(pattern, alphabet), len(pattern))

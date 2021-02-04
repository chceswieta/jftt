# Patryk Majewski, 250134

import sys

def compute_pi(pattern):
    m = len(pattern)
    pi = [0 for p in pattern]
    k = 0
    for q in range(1, m):
        while k > 0 and pattern[k] != pattern[q]:
            k = pi[k-1]
        if pattern[k] == pattern[q]:
            k += 1
        pi[q] = k
    return pi


def match(text, pattern):
    n = len(text)
    m = len(pattern)
    pi = compute_pi(pattern)
    q = 0
    for i in range(n):
        while q > 0 and pattern[q] != text[i]:
            q = pi[q-1]
        if pattern[q] == text[i]:
            q += 1
        if q == m:
            print("Pattern occurs with shift", i-m+1)
            q = pi[q-1]


if __name__ == "__main__":
    pattern = sys.argv[1]
    with open(sys.argv[2]) as file:
        text = file.read()
    print(f'Pattern: "{pattern}"')
    match(text, pattern)
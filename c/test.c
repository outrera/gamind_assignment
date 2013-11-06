// Plain C99
/////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef struct pair {struct pair *Head, *Tail;} pair;
void *head (pair *P) {
  assert (P);
  return P->Head;
}
void *tail (pair *P) {
  assert (P);
  return P->Tail;
}

pair *cons (void *Head, void *Tail) {
  pair *R = malloc(sizeof(pair));
  R->Head = Head;
  R->Tail = Tail;
  return R;
}

#define pop(Xs) pop_helper(&Xs)
pair *pop_helper (pair **Xs) {
  pair *R = head(*Xs);
  *Xs = tail(*Xs);
  return R;
}

// complexity is O(N) by time
void print_list (pair *Xs) {
  while (Xs) printf("%d ", (int)pop(Xs));
  printf("\n");
}

// complexity is O(N) by memory (creates new list) and O(N) by time
pair *reverse_list (pair *Xs) {
  pair *Ys = 0;
  while (Xs) Ys = cons(pop(Xs), Ys);
  return Ys;
}

// fast way would be using hash table or binary tree, but C has no hashes
void sums_to(int What, int *Xs, int L) {
  int I, J, K, N;
  int *As = malloc(L*sizeof(int));
  int *Bs = malloc(L*sizeof(int));
  N = 0;
  for (I = 0; I < L; I++) {
    for (J = 0; J < L; J++) {
      if (Xs[I] + Xs[J] == What) {
        for (K = 0; K < N; K++) {
          if (As[K] == Xs[I] || As[K] == Xs[J])
            goto skip; // already added this pair
        }
        printf("%d, %d\n", Xs[I], Xs[J]);
        As[N] = Xs[I];
        Bs[N] = Xs[J];
        N++;
        skip:;
      }
    }
  }
}

int main() {
  int Xs[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  print_list(reverse_list(cons(1, cons(2, cons(3, 0)))));
  sums_to(10, Xs, 11);
}
# Seven MATLAB exercises: control flow, matrices, primes and sets

Chapter 1 practice package, 21 September 2026.

## Source and attribution
Mehran Andalibi and Samuel A. Cherkauer, **Advanced MATLAB for Engineers: Integrating Theory and Programming**, Springer, 2026. Chapter 1, practice problems on printed pages 32-33. DOI: https://doi.org/10.1007/978-3-032-10677-3. Title and both authors verified from the local PDF title/copyright pages; exercise wording checked against the user-supplied page images.

These are original solutions to the book's exercises, not copied solutions or published author code. The book PDF and screenshots are not redistributed.

## What is verified versus unresolved
- Python equivalent algorithms are checked with `verify_python.py`; see its actual log and JSON.
- Re-run on 21 September 2026 on Windows 11 with Python 3.13.5 and NumPy 2.2.6: `python_equivalents: PASS`. A native MATLAB run on the same machine was attempted with R2025b and stopped at licensing error 10 (expired licence); the MATLAB Online result above stands as the only MATLAB execution.
- MATLAB Online R2026a Update 5 (26.1.0.3346908) ran run_checks successfully on 21 September 2026: PASS for all seven exercise groups and edge-case checks. The negative-input reference test was corrected to short-circuit before calling isprime.
- No ML model was trained. This is a numerical-programming exercise package, not an industrial deployment or measured business-saving claim.
- Examples use explicitly constructed test inputs and seeded random matrices; no external dataset is required by these exercises.

## Run in MATLAB
Open this folder in your licensed MATLAB session and run:
```matlab
run_checks
interactive_exercises
```
`interactive_exercises` asks for an exercise number and the book's inputs. Numeric `input` uses normal MATLAB expression entry; use only inputs you trust.

## Solutions
| Exercise | File | Key point |
|---|---|---|
| 1 | temperature_if.m | Exactly +/-2 degrees belongs to the OFF band. |
| 2 | temperature_switch.m | Classify the difference, then use switch/case/otherwise. |
| 3 | multiply_for.m | Three loops; multiplication only between scalar entries. |
| 4 | multiply_while.m | Explicitly increment i, j and k. |
| 5 | find_primes.m + is_prime_trial.m | Reset the non-prime streak after a prime; distinguish success, threshold exit and exhausted range. |
| 6 | norm_scaling.m | Every norm scales by the absolute scalar value. |
| 7 | compare_ids.m | Deduplicate IDs before comparing group sizes. |

For Exercise 4, `for` loops are more convenient because the finite index ranges are known and MATLAB updates counters automatically. Both algorithms require O(m*n*p) scalar operations for an m-by-n times n-by-p product.

For Exercise 6, **norm(scale*A)/norm(A) = abs(scale)** for every nonzero A. Thus -3 gives 3, not -3. A zero matrix gives 0/0: the ratio is undefined and is reported as NaN. The statement follows directly from absolute homogeneity of a norm; apparent small differences are floating-point rounding.

For Exercise 7, 'more unique participants' is interpreted as the number of distinct IDs in each group. `only_A` and `only_B` also report exclusive memberships so the alternative interpretation is visible. Empty groups tie; duplicate rows do not count as extra people.

## Today's selected concept
Exercise 6: unit-scaling audit for numerical thresholds. A fixed absolute norm threshold is sensitive to unit changes. A unit-converted threshold, or a ratio to a consistently converted nonzero reference, preserves the comparison. This is a mathematical demonstration, not a trained anomaly detector. Do not normalize away genuine amplitude changes when amplitude is the signal of interest.

Selection check: the saved daily prompt already lists reconciliation as Day 2, so Exercise 7 is included as requested but is not promoted as a novel project. Current public GitHub novelty has not been verified; no new day number or unique-project claim is assigned.

## Python check
Python 3 with NumPy 2.3.5:
```powershell
python -m venv .venv
.\.venv\Scripts\python -m pip install -r requirements.txt
.\.venv\Scripts\python verify_python.py
```
Preparation, examples and tests are separate from the compact MATLAB solution functions. Each individual solution file stays below 50 lines.

Suggested commit message after native validation: `MATLAB practice: solve Chapter 1 exercises 1-7`.


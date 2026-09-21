Seven MATLAB exercises. One useful lesson: test the tests, too.

I wrote original solutions to Chapter 1, pages 32-33 of Advanced MATLAB for Engineers by Mehran Andalibi and Samuel A. Cherkauer (2026). All seven exercise groups and edge-case checks passed in MATLAB Online R2026a Update 5.

Today's focus was matrix norms: multiplying a nonzero matrix by -3 made its Frobenius, 1, 2 and infinity norms exactly 3 times larger within floating-point tolerance. That matters when interpreting thresholds after a unit conversion.

The first native run caught a test bug: MATLAB isprime rejects negative inputs. I fixed the reference check, preserved the negative-input cases, and reran the suite successfully.

This is a seeded numerical demonstration, not a trained ML model or production deployment.

GitHub: https://github.com/sravanni369
LinkedIn: https://www.linkedin.com/in/lakshmi-sravani-p-212899272/
#MATLAB #NumericalComputing #SoftwareTesting #LearningInPublic

"""Independent Python equivalents, not proof of MATLAB execution."""
import json
from pathlib import Path
import numpy as np


def temperature(current, target):
    if not np.isfinite([current, target]).all():
        raise ValueError('Finite temperatures required')
    if current < target - 2:
        return 'Heating ON'
    if current > target + 2:
        return 'Cooling ON'
    return 'Heating OFF, Temperature is OK'


def multiply(a, b, use_while=False):
    a, b = np.asarray(a, dtype=float), np.asarray(b, dtype=float)
    if a.shape[1] != b.shape[0]:
        return None
    c = np.zeros((a.shape[0], b.shape[1]))
    if use_while:
        i = 0
        while i < len(a):
            j = 0
            while j < b.shape[1]:
                k = 0
                while k < a.shape[1]:
                    c[i, j] += a[i, k] * b[k, j]
                    k += 1
                j += 1
            i += 1
    else:
        for i in range(len(a)):
            for j in range(b.shape[1]):
                for k in range(a.shape[1]):
                    c[i, j] += a[i, k] * b[k, j]
    return c


def prime(n):
    return n >= 2 and all(n % d for d in range(2, int(n ** 0.5) + 1))


def search(lo, hi, count, threshold):
    found, streak = [], 0
    status = 'range exhausted'
    for n in range(lo, hi + 1):
        if not prime(n):
            streak += 1
            if streak >= threshold:
                status = 'non-prime threshold reached'
                break
            continue
        streak = 0
        found.append(n)
        if len(found) == count:
            status = 'requested count found'
            break
    return found, status


def run():
    rng = np.random.default_rng(42)
    expected = ['Heating ON'] + ['Heating OFF, Temperature is OK'] * 3 + ['Cooling ON']
    assert [temperature(x, 20) for x in [17.9, 18, 20, 22, 22.1]] == expected
    for _ in range(10):
        a, b = rng.normal(size=(3, 4)), rng.normal(size=(4, 2))
        for mode in [False, True]:
            np.testing.assert_allclose(multiply(a, b, mode), a @ b, atol=1e-12)
            assert multiply(np.ones((2, 3)), np.ones((4, 2)), mode) is None
    assert search(2, 20, 5, 4) == ([2, 3, 5, 7, 11], 'requested count found')
    assert search(8, 20, 5, 3) == ([], 'non-prime threshold reached')
    assert search(2, 5, 10, 3) == ([2, 3, 5], 'range exhausted')
    assert search(2, 13, 6, 4) == ([2, 3, 5, 7, 11, 13], 'requested count found')
    for n in range(-10, 201):
        assert prime(n) == (n >= 2 and not any(n % d == 0 for d in range(2, n)))
    a = rng.normal(size=(4, 4))
    ratios = {}
    for scale in [-3, 0, 0.5, 2]:
        r = [float(np.linalg.norm(scale*a, kind) / np.linalg.norm(a, kind))
             for kind in ['fro', 1, 2, np.inf]]
        np.testing.assert_allclose(r, abs(scale), atol=1e-12)
        ratios[str(scale)] = r
    a, b = set([1, 2, 2, 3]), set([3, 4])
    assert a | b == {1, 2, 3, 4} and a & b == {3}
    assert a - b == {1, 2} and a ^ b == {1, 2, 4}
    assert len(a) > len(b) and not (set() | set())
    result = {'python_equivalents': 'PASS', 'matlab_execution': 'BLOCKED: license error 9',
              'matrix_demo': multiply([[1, 2], [3, 4]], [[5, 6], [7, 8]]).tolist(),
              'norm_ratios_fro_1_2_inf': ratios, 'numpy': np.__version__}
    Path('python_results.json').write_text(json.dumps(result, indent=2))
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    run()

clauses = [
    {"A", "B"},
    {"~A"},
    {"~B"}
]
def resolve(c1, c2):
    for x in c1:
        if "~" + x in c2:
            return (c1 - {x}) | (c2 - {"~" + x})
        if x.startswith("~") and x[1:] in c2:
            return (c1 - {x}) | (c2 - {x[1:]})
    return None
new = []
while True:
    n = len(clauses)
    for i in range(n):
        for j in range(i + 1, n):
            res = resolve(clauses[i], clauses[j])
            if res is not None:
                print("Resolving:", clauses[i], clauses[j], "=>", res)
                if len(res) == 0:
                    print("\nEmpty clause found")
                    print("Resolution Successful")
                    exit()
                if res not in clauses and res not in new:
                    new.append(res)
    if not new:
        print("Resolution Failed")
        break
    clauses.extend(new)
    new = []

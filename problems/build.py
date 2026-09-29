"""Build the lecture, refresh external references, then build QFT Problems."""
from pathlib import Path
import json
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent


def run(*args):
    result = subprocess.run(args, cwd=ROOT, check=True, capture_output=True,
                            encoding="utf-8")
    if result.stderr:
        print(result.stderr, file=sys.stderr)
    return result


def main():
    files = sorted(HERE.glob("ch*.typ"))
    content = "\n".join(p.read_text(encoding="utf-8") for p in files)
    labels = set(re.findall(r"<([\w:-]+)>", content))
    targets = sorted(set(re.findall(r"@([\w:-]+)", content)) - labels)
    (HERE / "lecture-targets.json").write_text(
        json.dumps(targets, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    run("typst", "compile", "main.typ", "main.pdf")
    expr = '''json("problems/lecture-targets.json").map(key => {
      let es = query(label(key))
      assert(es.len() == 1, message: "Missing or duplicated lecture label: " + key)
      let e = es.first()
      assert(e.func() == math.equation, message: "Extend reference exporter for " + key)
      let h = counter(heading).at(e.location())
      let c = counter(math.equation).at(e.location())
      (key: key, page: e.location().page(), kind: "式",
       number: str(h.first()) + "." + str(h.at(1, default: 0)) + "." + str(c.first()))
    })'''
    rows = json.loads(run("typst", "eval", "--in", "main.typ", expr).stdout)
    refs = {r.pop("key"): r for r in rows}
    (HERE / "lecture-refs.json").write_text(
        json.dumps(refs, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    run("typst", "compile", "--root", str(ROOT), "problems/main.typ",
        "problems/QFT-Problems.pdf")
    print(f"Built QFT Problems: {len(files)} chapters, {len(refs)} lecture references.")


if __name__ == "__main__":
    try:
        main()
    except subprocess.CalledProcessError as error:
        print(error.stderr)
        raise SystemExit(error.returncode)

# Aviral Gupta — Resume

Single-source resume. Edit one HTML file, then regenerate the PDF and Word copies with one command.

## Commands

| Command | What it does |
|---|---|
| `make` / `make all` | Build the PDF **and** the DOCX |
| `make pdf` | Build the styled, print-ready PDF |
| `make docx` | Build the ATS / Word DOCX |
| `make open` | Open the HTML source in your browser |
| `make preview` | Render a PNG preview |
| `make clean` | Remove generated files |
| `make help` | List commands |

## Files

- `aviral-gupta-resume.html` — **the source; edit this one**
- `aviral-gupta-resume.md` — plain-text mirror (not used by the build)
- `aviral-gupta-resume.pdf` — styled output (generated)
- `aviral-gupta-resume.docx` — Word / ATS output (generated)
- `Makefile` — the build commands

## Requirements

- **Google Chrome** — used headless to render the PDF and preview
- **macOS `textutil`** — built in; used for the DOCX

## Where to edit (in `aviral-gupta-resume.html`)

- **Contact line** — the `.contact` block (email, phone, city, LinkedIn)
- **Title** — the `.title-line` and the Postman role
- **Summary / Recognition** — the first two sections
- **Experience bullets** — the `<li>` items (add, edit, or trim here)
- **Skills / Education** — the last two sections

After editing, run `make` and commit:

```bash
make
git add -A && git commit -m "Update resume"
```

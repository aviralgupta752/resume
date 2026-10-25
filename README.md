# Aviral Gupta — Resume

ATS-optimized resume repository with automated LaTeX compilation, ATS validation, and CI/CD pipeline.

## Automated Builds & Outputs

- Source LaTeX: [aviral-gupta-resume.tex](aviral-gupta-resume.tex) (single-column, standard semantic headings, ATS-friendly typography)
- Generated PDF: `generated/aviral-gupta-resume.pdf` (1 page, 100% extractable unicode text)
- Alternative HTML: [aviral-gupta-resume.html](aviral-gupta-resume.html) (print-ready web version)
- Plaintext Mirror: [aviral-gupta-resume.md](aviral-gupta-resume.md)

## Quick Start

### Build Locally
```bash
make
```
This compiles `aviral-gupta-resume.tex` into `generated/aviral-gupta-resume.pdf` using [Tectonic](https://tectonic-typesetting.github.io/) (or `pdflatex`).

### Validate ATS Parsing
```bash
node scripts/ats-validate.js generated/aviral-gupta-resume.pdf
```
Extracts the text layer via macOS PDFKit and verifies:
- Exactly 1 page
- Standard section headers (`Summary`, `Experience`, `Skills`, `Education`)
- Contact information and keyword discoverability

### Available Make Targets

| Command | Description |
|---|---|
| `make` / `make all` | Build LaTeX PDF to `generated/` |
| `make pdf` | Compile LaTeX resume to `generated/aviral-gupta-resume.pdf` |
| `make validate` | Compile PDF and run ATS validation + 1-page check |
| `make html-pdf` | Optional: compile HTML resume using headless Chrome |
| `make open` | Open the generated PDF in the default PDF viewer |
| `make clean` | Remove `generated/` build directory |
| `make help` | Show available targets |

## Automated CI/CD Pipeline

The GitHub Actions workflow in [.github/workflows/publish.yml](.github/workflows/publish.yml):
1. Runs on every push and PR to `main`.
2. Sets up `tectonic`.
3. Compiles `aviral-gupta-resume.tex` into a PDF.
4. Uploads the build artifact.
5. On merges to `main`, publishes the PDF automatically as the `latest` GitHub release.

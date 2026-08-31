LATEXMK := latexmk
XELATEX := xelatex
DVISVGM := dvisvgm
BUILD_DIR := .build
OUTPUT_DIR := ../fig/feynman
SOURCES := ch4_two_point_topologies.tex ch4_leg_fish_topologies.tex \
	ch4_phi4_scattering_one_loop.tex
XDVS := $(SOURCES:%.tex=$(BUILD_DIR)/%.xdv)
SVGS := $(SOURCES:%.tex=$(OUTPUT_DIR)/%.svg)
export TEXMFVAR := $(abspath $(BUILD_DIR)/texmf-var)
export TEXMFCONFIG := $(abspath $(BUILD_DIR)/texmf-config)

.PHONY: all clean

all: $(SVGS)

$(BUILD_DIR)/%.xdv: %.tex
	@mkdir -p "$(BUILD_DIR)" "$(TEXMFVAR)" "$(TEXMFCONFIG)"
	$(XELATEX) -no-pdf -halt-on-error -interaction=nonstopmode \
		-file-line-error -output-directory=$(BUILD_DIR) $<

$(OUTPUT_DIR)/%.svg: $(BUILD_DIR)/%.xdv
	@mkdir -p $(OUTPUT_DIR)
	$(DVISVGM) --page=1 --bbox=min --no-fonts \
		--output=$@ $<

clean:
	$(LATEXMK) -C -outdir=$(BUILD_DIR) $(SOURCES)

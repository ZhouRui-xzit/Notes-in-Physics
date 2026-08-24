LATEXMK := latexmk
LUALATEX := lualatex
DVISVGM := dvisvgm
BUILD_DIR := .build
OUTPUT_DIR := ../fig/feynman
SOURCES := ch4_two_point_topologies.tex ch4_leg_fish_topologies.tex
DVIS := $(SOURCES:%.tex=$(BUILD_DIR)/%.dvi)
SVGS := $(SOURCES:%.tex=$(OUTPUT_DIR)/%.svg)
export TEXMFVAR := $(abspath $(BUILD_DIR)/texmf-var)
export TEXMFCONFIG := $(abspath $(BUILD_DIR)/texmf-config)

.PHONY: all clean

all: $(SVGS)

$(BUILD_DIR)/%.dvi: %.tex
	@mkdir -p $(BUILD_DIR) $(TEXMFVAR) $(TEXMFCONFIG)
	$(LUALATEX) --output-format=dvi -halt-on-error -interaction=nonstopmode \
		-file-line-error -output-directory=$(BUILD_DIR) $<

$(OUTPUT_DIR)/%.svg: $(BUILD_DIR)/%.dvi
	@mkdir -p $(OUTPUT_DIR)
	$(DVISVGM) --page=1 --bbox=min --no-fonts \
		--output=$@ $<

clean:
	$(LATEXMK) -C -outdir=$(BUILD_DIR) $(SOURCES)

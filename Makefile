# Variables
APP_NAME = oauth-server
CMD_DIR = ./cmd/main.go
OUTPUT_DIR = ./bin
OUTPUT_BINARY = $(OUTPUT_DIR)/$(APP_NAME)

# Tools
GOLANGCI_LINT = golangci-lint
GO = go

# Default target
.PHONY: all
all: build

# Build the binary
.PHONY: build
build:
	@echo "Building the application..."
	@mkdir -p $(OUTPUT_DIR)
	$(GO) build -o $(OUTPUT_BINARY) $(CMD_DIR)
	@echo "Build complete! Binary is located at $(OUTPUT_BINARY)"

# Run the application
.PHONY: run
run:
	@echo "Running the application..."
	$(GO) run $(CMD_DIR)

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning up build artifacts..."
	rm -rf $(OUTPUT_DIR)

# Run tests
.PHONY: test
test:
	@echo "Running tests..."
	$(GO) test ./... -v

# Run linting
.PHONY: lint
lint:
	@echo "Running linter..."
	$(GOLANGCI_LINT) run

# Install dependencies (linters, formatters, etc.)
.PHONY: install-tools
install-tools:
	@echo "Installing tools..."
	$(GO) install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Format code
.PHONY: format
format:
	@echo "Formatting code..."
	$(GO) fmt ./...

# Verify everything (build, lint, test)
.PHONY: verify
verify: lint test build
	@echo "All checks passed!"

# Show help
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make build           Build the binary"
	@echo "  make run             Run the application"
	@echo "  make clean           Clean build artifacts"
	@echo "  make test            Run tests"
	@echo "  make lint            Run linter"
	@echo "  make format          Format code"
	@echo "  make install-tools   Install required tools"
	@echo "  make verify          Verify code (lint, test, build)"
	@echo "  make help            Show this help message"

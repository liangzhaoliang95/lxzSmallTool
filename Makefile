.PHONY: tag release patch minor major

# 从 pubspec.yaml 读取当前版本
CURRENT_VERSION := $(shell grep '^version:' pubspec.yaml | sed 's/version: //' | cut -d'+' -f1)
BUILD_NUMBER := $(shell grep '^version:' pubspec.yaml | cut -d'+' -f2)

# 解析版本号
MAJOR := $(shell echo $(CURRENT_VERSION) | cut -d'.' -f1)
MINOR := $(shell echo $(CURRENT_VERSION) | cut -d'.' -f2)
PATCH := $(shell echo $(CURRENT_VERSION) | cut -d'.' -f3)

help:
	@echo "当前版本: v$(CURRENT_VERSION)"
	@echo ""
	@echo "可用命令:"
	@echo "  make patch   - 发布补丁版本 (x.x.X)"
	@echo "  make minor   - 发布次版本   (x.X.0)"
	@echo "  make major   - 发布主版本   (X.0.0)"
	@echo "  make tag v=1.2.3 - 发布指定版本"

# 发布补丁版本
patch:
	$(eval NEW_PATCH := $(shell echo $$(($(PATCH)+1))))
	$(eval NEW_VERSION := $(MAJOR).$(MINOR).$(NEW_PATCH))
	$(eval NEW_BUILD := $(shell echo $$(($(BUILD_NUMBER)+1))))
	@$(MAKE) _do_release VERSION=$(NEW_VERSION) BUILD=$(NEW_BUILD)

# 发布次版本
minor:
	$(eval NEW_VERSION := $(MAJOR).$(shell echo $$(($(MINOR)+1))).0)
	$(eval NEW_BUILD := $(shell echo $$(($(BUILD_NUMBER)+1))))
	@$(MAKE) _do_release VERSION=$(NEW_VERSION) BUILD=$(NEW_BUILD)

# 发布主版本
major:
	$(eval NEW_VERSION := $(shell echo $$(($(MAJOR)+1))).0.0)
	$(eval NEW_BUILD := $(shell echo $$(($(BUILD_NUMBER)+1))))
	@$(MAKE) _do_release VERSION=$(NEW_VERSION) BUILD=$(NEW_BUILD)

# 指定版本发布: make tag v=1.2.3
tag:
	@if [ -z "$(v)" ]; then echo "请指定版本号: make tag v=1.2.3"; exit 1; fi
	$(eval NEW_BUILD := $(shell echo $$(($(BUILD_NUMBER)+1))))
	@$(MAKE) _do_release VERSION=$(v) BUILD=$(NEW_BUILD)

# 内部发布流程
_do_release:
	@echo "准备发布 v$(VERSION)+$(BUILD) ..."
	@# 更新 pubspec.yaml 版本号
	@sed -i '' "s/^version: .*/version: $(VERSION)+$(BUILD)/" pubspec.yaml
	@echo "✓ 已更新 pubspec.yaml -> $(VERSION)+$(BUILD)"
	@# 提交版本变更
	@git add pubspec.yaml
	@git commit -m "chore: bump version to $(VERSION)"
	@echo "✓ 已提交版本变更"
	@# 打 tag 并推送
	@git tag v$(VERSION)
	@git push origin master
	@git push origin v$(VERSION)
	@echo ""
	@echo "✓ 已发布 v$(VERSION)，GitHub Actions 构建已触发"
	@echo "  查看构建: https://github.com/$(shell git remote get-url origin | sed 's/.*github.com[:/]//' | sed 's/\.git//')/actions"

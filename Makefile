include $(TOPDIR)/rules.mk

PKG_NAME:=hev-socks5-tproxy
PKG_VERSION:=2.1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/heiher/hev-socks5-tproxy.git
PKG_SOURCE_VERSION:=b3ce87c2d7948f0ce4895e746bf43f854a81cb05
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=hev <r@hev.cc>

include $(INCLUDE_DIR)/package.mk

define Package/hev-socks5-tproxy
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A simple, lightweight transparent proxy for Linux
	URL:=ssh://git@gitlab.com/hev.proxy/hev-socks5-tproxy
endef

define Package/hev-socks5-tproxy/description
	A simple, lightweight socks5 transparent proxy for Linux.
endef

define Package/hev-socks5-tproxy/conffiles
/etc/hs5t.yml
endef

TARGET_CFLAGS += -O3

define Package/hev-socks5-tproxy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hev-socks5-tproxy $(1)/usr/bin/hs5t
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/hs5t.init $(1)/etc/init.d/hs5t
endef

$(eval $(call BuildPackage,hev-socks5-tproxy))

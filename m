Return-Path: <erkka.kaaria@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9386C731F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:53:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2016 00:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,540,1455004800"; d="scan'208";a="793295092"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2016 00:53:52 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2016 10:57:12 +0300
Message-Id: <1461743832-13718-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-intel-iot-middleware][PATCH] mosquitto_1.4.bb: Fix typo in variable name
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2016 07:53:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

bGliYmlyIC0+IGxpYmRpcgoKU2lnbmVkLW9mZi1ieTogRXJra2EgS8Okw6RyacOkIDxlcmtrYS5r
YWFyaWFAaW50ZWwuY29tPgotLS0KIHJlY2lwZXMtY29ubmVjdGl2aXR5L21vc3F1aXR0by9tb3Nx
dWl0dG9fMS40LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9zcXVpdHRvL21v
c3F1aXR0b18xLjQuYmIgYi9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vbW9zcXVpdHRv
XzEuNC5iYgppbmRleCA3ODljNTlhLi5lOTFhMzRkIDEwMDY0NAotLS0gYS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9tb3NxdWl0dG8vbW9zcXVpdHRvXzEuNC5iYgorKysgYi9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9tb3NxdWl0dG8vbW9zcXVpdHRvXzEuNC5iYgpAQCAtMjMsNyArMjMsNyBAQCBkb19jb21w
aWxlKCkgewogCiBkb19pbnN0YWxsKCkgewogICAgIG9lX3J1bm1ha2UgaW5zdGFsbCBERVNURElS
PSR7RH0KLSAgICBpbnN0YWxsIC1kICR7RH0ke2xpYmJpcn0KKyAgICBpbnN0YWxsIC1kICR7RH0k
e2xpYmRpcn0KICAgICBpbnN0YWxsIC1tIDA2NDQgbGliL2xpYm1vc3F1aXR0by5hICR7RH0ke2xp
YmRpcn0vCiAKICAgICBpbnN0YWxsIC1kICR7RH0ke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtLwot
LSAKMi43LjQKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVz
czogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYw
NiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNo
bWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ug
b2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24K
Ynkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRl
bmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwg
Y29waWVzLgo=



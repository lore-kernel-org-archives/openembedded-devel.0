Return-Path: <erkka.kaaria@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 654AE7318A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:46:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2016 03:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,516,1455004800"; d="scan'208";a="960499602"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2016 03:46:05 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 13:48:28 +0300
Message-Id: <1461322108-20584-3-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1461322108-20584-1-git-send-email-erkka.kaaria@intel.com>
References: <1461322108-20584-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 3/3] openjre-8_72b05.bb: Add missing patches
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
X-List-Received-Date: Fri, 22 Apr 2016 10:46:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VHdvIHBhdGNoZXMgd2VyZSBvbmx5IGFwcGxpZWQgdG8gb3Blbmpkay04LiBBcHBseSB0aGVzZSB0
byBqcmUgYXMgd2VsbAoKU2lnbmVkLW9mZi1ieTogRXJra2EgS8Okw6RyacOkIDxlcmtrYS5rYWFy
aWFAaW50ZWwuY29tPgotLS0KIHJlY2lwZXMtY29yZS9vcGVuamRrL29wZW5qcmUtOF83MmIwNS5i
YiB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9y
ZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuanJlLThfNzJiMDUuYmIgYi9yZWNpcGVzLWNvcmUvb3Bl
bmpkay9vcGVuanJlLThfNzJiMDUuYmIKaW5kZXggYzdkZTVjNy4uZDY1YjIwNSAxMDA2NDQKLS0t
IGEvcmVjaXBlcy1jb3JlL29wZW5qZGsvb3BlbmpyZS04XzcyYjA1LmJiCisrKyBiL3JlY2lwZXMt
Y29yZS9vcGVuamRrL29wZW5qcmUtOF83MmIwNS5iYgpAQCAtOSw2ICs5LDggQEAgUEFUQ0hFU19V
UklfYXBwZW5kID0gIlwKICAgICBmaWxlOi8vb3BlbmpkazgtZml4LXNoYXJrLWJ1aWxkLnBhdGNo
O2FwcGx5PW5vIFwKICAgICBmaWxlOi8vb3BlbmpkazgtZml4LXNoYXJrLXN0ZGMrKzExLnBhdGNo
O2FwcGx5PW5vIFwKICAgICBmaWxlOi8vb3BlbmpkazgtdXNlX2J1aWx0aW5fZnJhbWVfYWRkcmVz
c18wX3JhdGhlcl90aGFuX3JldHVybmluZ19hZGRyZXNzX29mX2xvY2FsX3ZhcmlhYmxlLnBhdGNo
O2FwcGx5PW5vIFwKKyAgICBmaWxlOi8vb3BlbmpkazgtZml4LWFzc2VtYmxlci1mbGFnLWhhbmRs
aW5nLWluLW1ha2VmaWxlLnBhdGNoO2FwcGx5PW5vIFwKKyAgICBmaWxlOi8vb3BlbmpkazgtZml4
LWFkbGMtZmxhZ3MucGF0Y2g7YXBwbHk9bm8gXAogICAgIGZpbGU6Ly9vcGVuamRrOC1zaWxlbmNl
LWRfZm9ydGlmeV9zb3VyY2Utd2FybmluZy5wYXRjaDthcHBseT1ubyBcCiAiCiAKLS0gCjIuNy40
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4
MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApE
b21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1h
eSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBp
bnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVy
cyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVj
aXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K



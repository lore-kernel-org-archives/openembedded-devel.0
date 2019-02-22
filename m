Return-Path: <tuanha@viosoft.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 359C57CABF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 02:11:38 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 101so342386pld.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 18:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=viosoft-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=hIASLkFNxCbcS+RIi+1NiVAaaUwnOx6ktxE6nf4bEEs=;
	b=FuSQdT5ogBFTJIv7Q8D5XcFfwf6pCgrvi75WNMRlOLt27ucG61guFwurvpXWh+8Uir
	RFUuN2Gji0b5xUatie3AeU3tB1S4vSqMI1LZ4Lfmo89VkEyRftTY5VculODHJkBzULfX
	J2XCmQHcDawW6J/fyBp4rc15oL9Mxg7U7hOr6FG65JRThSU6heasnb/VmWzXvVrbA7IQ
	fdkRQmbgRd6cjKIYPzIs1pF0Tu0J8Au8QvpfSWOWWt50wC9CpkSHd9Yiv1A/6f+PYlUh
	MLCTuPeb7SkqZpoKxPeFeMJFTfNjlNxnLkEHFCx1p+/a6b/jla8KF4jI7jfDYqTm9h2M
	hebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=hIASLkFNxCbcS+RIi+1NiVAaaUwnOx6ktxE6nf4bEEs=;
	b=R9/cuiz6bk4vWeT5hSuewoFNQZ+wDFhYPSRgFe/o6diEZ1OfVxDuwPZp9ZKMB/5/7H
	2TOd+7GDYwsyO/n1BtcYE03+q1Hi5esxIvSz29yoz5yeHJogXZ+uGz8QUJEkKffN3W44
	0AypgXl0L23lYk6B+bg90EiCr5aroF6riOyvz94gTacioumm9ni8O1n8CmdU7e4U0/CS
	lDwbUbU3GfxLTY+eAwSHtPVVJXvTSBZYTRXZKRC7+sdjMbNcIyWwktbKbrIqxnROVT2o
	IzDMCen/uHwqjlKvxOTgsI7kthK1TBNh4HVMsLhSB915Z45PkYa5VvpMarTpD5Y6kdau
	28Hg==
X-Gm-Message-State: AHQUAuZ0ufcXvqhz0B2gkx2c71cIuIVEfVWipCBuAm4GahiptvbXRy6q
	vUBr/eoBIKy5m4E4ybimRPIUzazzOG5whw==
X-Google-Smtp-Source: AHgI3IaYlcSgisNtE95YYvjqRSGX3moU5I6lhfsmsLJUr2Libfjk/LOtmJUBPuEgcQa3YL699PGLVg==
X-Received: by 2002:a17:902:284b:: with SMTP id
	e69mr1660201plb.11.1550801498847; 
	Thu, 21 Feb 2019 18:11:38 -0800 (PST)
Received: from [192.168.100.8] ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id w65sm144924pfb.23.2019.02.21.18.11.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 18:11:38 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Hoang Anh Tuan <tuanha@viosoft.com>
Message-ID: <a6e14d32-59d5-c567-3d45-3c3cabd6a940@viosoft.com>
Date: Fri, 22 Feb 2019 09:11:36 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] [PATCH 2/2] gtkwave: add version 3.3.98
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
X-List-Received-Date: Fri, 22 Feb 2019 02:11:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 19 
+++++++++++++++++++
  1 file changed, 19 insertions(+)
  create mode 100644 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb 
b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
new file mode 100644
index 0000000..6fd9392
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -0,0 +1,19 @@
+SUMMARY = "VCD (Value Change Dump) file waveform viewer"
+DESCRIPTION = "gtkwave is a viewer for VCD (Value Change Dump) files 
which are usually created by digital circuit simulators. (These files 
have no connection to video CDs!) "
+HOMEPAGE = "http://gtkwave.sourceforge.net/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+
+SRC_URI = "http://gtkwave.sourceforge.net/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
+SRC_URI[sha256sum] = 
"efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
+
+inherit pkgconfig autotools gettext texinfo
+DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf 
glib-2.0"
+RDEPENDS_${PN} = "tk-lib"
+
+EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} 
--with-tk=${STAGING_BINDIR_CROSS}"
+
+FILES_${PN} = "${bindir} ${datadir}"
-- 
2.7.4



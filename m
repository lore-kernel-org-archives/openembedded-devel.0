Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (unknown [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEC660144
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 05:16:39 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 10 May 2014 14:16:39 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 10 May 2014 14:17:01 +0900
Message-ID: <011e01cf6c0f$12e26590$38a730b0$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac9sDtbwKH0auyDTRvqRKA8/2e9wJg==
Subject: lttng-module error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 May 2014 05:16:40 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Hi

I'm building lttng-module with dylan.
However I got the error on creating rootfs.

Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-kernel-image:
|  * 	kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ *
|  * opkg_install_cmd: Cannot install package packagegroup-kernel-image.
| ERROR: Function failed: do_rootfs (see /....
-linux-gnueabi/....-image/1.0-r4/temp/log.do_rootfs.24420 for further
information)
NOTE: recipe ....-image-1.0-r4: task do_rootfs: Failed



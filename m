Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id F0DBA6AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 06:30:24 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 5263768A01C; Wed, 10 Feb 2016 06:30:23 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id EEFA968A019;
	Wed, 10 Feb 2016 06:30:22 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 676926740594;
	Wed, 10 Feb 2016 07:30:22 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56BAD8FD.1090304@mlbassoc.com>
Date: Wed, 10 Feb 2016 07:30:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: [meta-browser] Can't build firefox
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
X-List-Received-Date: Wed, 10 Feb 2016 06:30:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Using the latest OE-core (from Poky 7d5d8d0cd985edf507c8d00e2e162d1b9fff3589)
and meta-browser (f81404fe014da8b86dae6f47fc99975ff2a855d1) I get these errors:

ERROR: QA Issue: -dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libnss3.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libmozalloc.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libsmime3.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libssl3.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libplc4.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libnssutil3.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libxul.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libplds4.so'
-dev package contains non-symlink .so: firefox-dev path 
'work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/firefox/38.6.0esr-r0/packages-split/firefox-dev/usr/lib/firefox-devel-38.6/sdk/lib/libnspr4.so' 
[dev-elf]
ERROR: QA run found fatal errors. Please consider fixing them.

Any ideas or pointers on how to fix this?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


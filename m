Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 352 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Jan 2017 16:23:37 UTC
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C7FA471E01
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 16:23:37 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4195868A019; Tue, 31 Jan 2017 16:17:45 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL,TVD_SPACE_RATIO autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id CFF1368A019;
	Tue, 31 Jan 2017 16:17:44 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 7911E67401E9;
	Tue, 31 Jan 2017 17:17:44 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <997bde82-5208-6d17-3f4c-141258242a6e@mlbassoc.com>
Date: Tue, 31 Jan 2017 17:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: [meta-browser] chromium broken patch
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
X-List-Received-Date: Tue, 31 Jan 2017 16:23:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

poky/yocto:   d45d4a5a21ab4209b87331dddf515ecdb62367fa
meta-browser: d875f40c3a120118ddf998545dd7efba09d01cc1

ERROR: chromium-52.0.2743.76-r0 do_patch: Command Error: 'quilt --quiltrc 
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/chromium/52.0.2743.76-r0/recipe-sysroot-native/etc/quiltrc 
push' exited with 0  Output:
Applying patch 0003-Remove-hard-coded-values-for-CC-and-CXX.patch
patching file build/common.gypi
Hunk #1 FAILED at 6027.
1 out of 1 hunk FAILED -- rejects in file build/common.gypi
Patch 0003-Remove-hard-coded-values-for-CC-and-CXX.patch does not apply (enforce with -f)
ERROR: chromium-52.0.2743.76-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: 
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/chromium/52.0.2743.76-r0/temp/log.do_patch.17216
ERROR: Task (/local/poky-cutting-edge/meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_patch) failed 
with exit code '1'

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


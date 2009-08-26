Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MgJmB-0003tU-Ih
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 16:47:03 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id D36D416E23B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 16:29:06 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 930412A419E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 16:29:06 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 26 Aug 2009 16:29:01 +0200
Message-ID: <4A95468A.9080109@dresearch.de>
Date: Wed, 26 Aug 2009 16:28:26 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 26 Aug 2009 14:29:01.0359 (UTC)
	FILETIME=[8E39FBF0:01CA2659]
Subject: Parsing errors in current dev branch :(
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2009 14:47:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> git branch
* org.openembedded.dev
> git log | head -n 1
commit 73b0cf99f965eeb5a08daf614b98fa6e23c1c848

NOTE: Handling BitBake files: - (1265/7083) [17 %]ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.08.bb
NOTE: Handling BitBake files: \ (1267/7083) [17 %]ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.06.bb
ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.01.bb
ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.05.bb
NOTE: Handling BitBake files: \ (1271/7083) [17 %]ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.09.bb
NOTE: Handling BitBake files: \ (7083/7083) [100 %]
NOTE: Parsing finished. 6789 cached, 1 parsed, 288 skipped, 0 masked.
ERROR: Parsing errors found, exiting...





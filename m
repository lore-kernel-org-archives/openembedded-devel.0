Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 346 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Nov 2014 06:12:02 UTC
Received: from fgwmail7.fujitsu.co.jp (fgwmail7.fujitsu.co.jp [192.51.44.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1611F722FB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 06:12:02 +0000 (UTC)
Received: from fgwmail5.fujitsu.co.jp (fgwmail5.fujitsu.co.jp [192.51.44.35])
	by fgwmail7.fujitsu.co.jp (Postfix) with ESMTP id 8705A179351B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 15:06:28 +0900 (JST)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [10.0.237.131])
	by fgwmail5.fujitsu.co.jp (Postfix) with ESMTP id A37643EE0AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 15:06:16 +0900 (JST)
Received: from s1.gw.fujitsu.co.jp (s1.gw.fujitsu.co.jp [10.0.50.91])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id BC15CAC0892
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 15:06:15 +0900 (JST)
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by s1.gw.fujitsu.co.jp (Postfix) with ESMTP id 235EBE38006
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 15:06:15 +0900 (JST)
Received: from g01jpexchyt38.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	B1B05584270 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 15:05:37 +0900 (JST)
Received: from G01JPEXMBYT21.g01.fujitsu.local ([10.128.193.129]) by
	g01jpexchyt38 ([10.128.193.68]) with mapi id 14.03.0181.007;
	Fri, 28 Nov 2014 15:05:38 +0900
From: "Fan, Xin" <fan.xin@jp.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]Question about ntp build option
Thread-Index: AdAK0VtINHgNZV7eTj233byq3SscbA==
Date: Fri, 28 Nov 2014 06:05:36 +0000
Message-ID: <72334B6CF8FF6542A565D43122925D601999FF@G01JPEXMBYT21>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.19.50]
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
Subject: Question about ntp build option
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
X-List-Received-Date: Fri, 28 Nov 2014 06:12:05 -0000
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"

Hello,

I wonder that why the ntp uses the without-openssl build option and disables the 
openssl by default.

In my opinion, the ntp needs openssl to support public key cryptography and it
should be enabled by default.

Does anyone know the reason?

Best regards
Fan

=====================================================
Fujitsu Computer Technology
Fan Xin
fan.xin@jp.fujitsu.com


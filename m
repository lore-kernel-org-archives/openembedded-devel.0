Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDB1C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 11:01:06 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.12891.1745233263098209753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 04:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout06.t-online.de (Postfix) with SMTP id EE5A06E2;
	Mon, 21 Apr 2025 13:00:45 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.37.191]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6otI-353xse0; Mon, 21 Apr 2025 13:00:44 +0200
Date: Mon, 21 Apr 2025 13:00:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/9] libxmp: add recipe
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <3LE2VS.HY58WV2ESEG43@t-online.de>
In-Reply-To: <d6ec3752-cf25-4851-83c1-631de9c4ea15@gmail.com>
References: <20250421094832.67450-1-f_l_k@t-online.de>
	<d6ec3752-cf25-4851-83c1-631de9c4ea15@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-NtdmRjmbpjmijaDu24rE"
X-TOI-EXPURGATEID: 150726::1745233244-A1FF89FB-4C49B5C5/10/3626336762 SUSPECT URL
X-TOI-MSGID: e6d0073b-3344-4461-a057-aa66a7e08643
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117004

--=-NtdmRjmbpjmijaDu24rE
Content-Type: text/plain; charset=us-ascii; format=flowed

Thanks. I just copied the line from:
<https://github.com/schnitzeltony/meta-qt5-extra/blob/c16ba209a93c3e55f5aef07fbb1d584e228765b3/recipes-misc/recipes-multimedia/libxmp/libxmp_4.4.1.bb#L3>

I'll send a v2 to fix it

On Mon, Apr 21 2025 at 12:01:54 +02:00:00, Gyorgy Sarvari 
<skandigraun@gmail.com> wrote:
> 
> On 4/21/25 11:48, Markus Volk via lists.openembedded.org wrote:
>>  +LICENSE = "LGPL-2.1-only"
>>  +LIC_FILES_CHKSUM = 
>> "file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8" 
>> <file://readme;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8/>
> Is that correct as it is? That README;beginline=59 seems to be a
> standard MIT license.


--=-NtdmRjmbpjmijaDu24rE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Thanks. I just copied the line from:</div><div><a href="https://github.com/schnitzeltony/meta-qt5-extra/blob/c16ba209a93c3e55f5aef07fbb1d584e228765b3/recipes-misc/recipes-multimedia/libxmp/libxmp_4.4.1.bb#L3">https://github.com/schnitzeltony/meta-qt5-extra/blob/c16ba209a93c3e55f5aef07fbb1d584e228765b3/recipes-misc/recipes-multimedia/libxmp/libxmp_4.4.1.bb#L3</a></div><div><br></div><div>I'll send a v2 to fix it</div></div><div id="geary-quote" dir="auto"><br>On Mon, Apr 21 2025 at 12:01:54 +02:00:00, Gyorgy Sarvari &lt;skandigraun@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
On 4/21/25 11:48, Markus Volk via lists.openembedded.org wrote:
<blockquote> +LICENSE = "LGPL-2.1-only"
 +LIC_FILES_CHKSUM = "<a href="file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8" "="">file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8"</a>
</blockquote>Is that correct as it is? That README;beginline=59 seems to be a
standard MIT license.
</div></blockquote></div>
--=-NtdmRjmbpjmijaDu24rE--



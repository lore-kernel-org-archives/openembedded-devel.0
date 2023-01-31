Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DFFC636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 18:46:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.2342.1675190786449393245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 10:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id AD8C9162D5;
	Tue, 31 Jan 2023 19:46:24 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.44]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pMveC-0HWBBQ0; Tue, 31 Jan 2023 19:46:24 +0100
Date: Tue, 31 Jan 2023 19:46:18 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/3] system-config-printer: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <6H5DPR.NKQBKFK7B6GJ2@t-online.de>
In-Reply-To: 
	<CAMKF1soE_5+D+cg0zZRLUnB2fNqQaPu7mH4G_WYgdu4izGxN2g@mail.gmail.com>
References: <20230131170848.367522-1-f_l_k@t-online.de>
	<20230131170848.367522-2-f_l_k@t-online.de>
	<CAMKF1soE_5+D+cg0zZRLUnB2fNqQaPu7mH4G_WYgdu4izGxN2g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WEq8tbb9JTOjezNNbRtw"
X-TOI-EXPURGATEID: 150726::1675190784-D671D046-9F90097B/0/0 CLEAN NORMAL
X-TOI-MSGID: 63ea1023-31be-4893-a873-a29d3e35727f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 18:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100884

--=-WEq8tbb9JTOjezNNbRtw
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 31. Jan 2023 um 09:56:29 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> maybe change this to
> 
> #!/usr/bin/env python3

But that would be about 50 files in which the shebang would have to be 
changed. They are all '#!/usr/bin/python3'.


--=-WEq8tbb9JTOjezNNbRtw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 31. Jan 2023 um 09:56:29 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">maybe change this to

#!/usr/bin/env python3</div></blockquote><div><br></div><div>But that would be about 50 files in which the shebang would have to be changed. They are all '#!/usr/bin/python3'.</div></div>
--=-WEq8tbb9JTOjezNNbRtw--



Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9F0C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 05:50:32 +0000 (UTC)
Subject: Re: [meta-python][dunfell][PATCH 1/9] python3-pillow: Upgrade 6.2.1
 -> 7.2.0
To: openembedded-devel@lists.openembedded.org
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (165.225.120.241)
X-Originating-Platform: Linux Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 Jun 2022 22:50:22 -0700
References: 
 <CAMKF1sq+qqh7ZqedWrEeRKiKVMFGpKfbrs=OY5dREfQJadv7_A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq+qqh7ZqedWrEeRKiKVMFGpKfbrs=OY5dREfQJadv7_A@mail.gmail.com>
Message-ID: <2312.1654494622885501507@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qMtJPUrxYDwcewbglYmT"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 05:50:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97416

--qMtJPUrxYDwcewbglYmT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I have sent the below patches for the upgrade python3-pillow to 9.0.1

https://lists.openembedded.org/g/openembedded-devel/message/97359
https://lists.openembedded.org/g/openembedded-devel/message/97360
https://lists.openembedded.org/g/openembedded-devel/message/97361
https://lists.openembedded.org/g/openembedded-devel/message/97362
https://lists.openembedded.org/g/openembedded-devel/message/97363
https://lists.openembedded.org/g/openembedded-devel/message/97364
https://lists.openembedded.org/g/openembedded-devel/message/97365
https://lists.openembedded.org/g/openembedded-devel/message/97366
https://lists.openembedded.org/g/openembedded-devel/message/97367

I have cherry-picked those from the master to fix all the CVEs mentioned in=
 earlier thread. Also, each commit message has changelog included
$ git log origin/dunfell..upstream/master --oneline meta-python/recipes-dev=
tools/python | grep "python3-pillow: " 91e1461a28 python3-pillow: upgrade 9=
.0.0 -> 9.0.1 b56940049d python3-pillow: fix wheel build f41b3757dd python3=
-pillow: Upgrade 8.3.2 -> 9.0.0 4b9bceea4c python3-pillow: upgrade 8.3.1 ->=
 8.3.2 a5fc60071f python3-pillow: Upgrade 8.2.0 -> 8.3.1 0fc9235bbb python3=
-pillow: Upgrade 8.1.2 -> 8.2.0 bb0789998e python3-pillow: 8.1.0 -> 8.1.2 a=
e76da9210 python3-pillow: Upgrade 7.2.0 -> 8.1.0 995fc86b29 python3-pillow:=
 Upgrade 6.2.1 -> 7.2.0

Thanks,
Ranjitsinh Rathod

--qMtJPUrxYDwcewbglYmT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,<br /><br />I have sent the below patches for the upgrade python3-p=
illow to 9.0.1<br /><br />
<div>https://lists.openembedded.org/g/openembedded-devel/message/97359</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97360</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97361</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97362</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97363</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97364</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97365</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97366</div=
>
<div>https://lists.openembedded.org/g/openembedded-devel/message/97367</div=
>
<div><br />I have cherry-picked those from the master to fix all the CVEs m=
entioned in earlier thread. Also, each commit message has changelog include=
d<br /><span style=3D"color: #353535; font-family: monospace; font-size: sm=
all; white-space: pre;">$ git log origin/dunfell..upstream/master --oneline=
 meta-python/recipes-devtools/python | grep "python3-pillow: " 91e1461a28 p=
ython3-pillow: upgrade 9.0.0 -&gt; 9.0.1 b56940049d python3-pillow: fix whe=
el build f41b3757dd python3-pillow: Upgrade 8.3.2 -&gt; 9.0.0 4b9bceea4c py=
thon3-pillow: upgrade 8.3.1 -&gt; 8.3.2 a5fc60071f python3-pillow: Upgrade =
8.2.0 -&gt; 8.3.1 0fc9235bbb python3-pillow: Upgrade 8.1.2 -&gt; 8.2.0 bb07=
89998e python3-pillow: 8.1.0 -&gt; 8.1.2 ae76da9210 python3-pillow: Upgrade=
 7.2.0 -&gt; 8.1.0 995fc86b29 python3-pillow: Upgrade 6.2.1 -&gt; 7.2.0 </s=
pan></div>
<div><span style=3D"color: #353535; font-family: monospace; font-size: smal=
l; white-space: pre;">&nbsp;</span></div>
Thanks,<br />Ranjitsinh Rathod

--qMtJPUrxYDwcewbglYmT--


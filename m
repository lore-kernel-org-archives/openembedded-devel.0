Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2EBC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 09:32:48 +0000 (UTC)
Subject: Re: [meta-networking][PATCH] cannelloni: upgrade 1.0.0 -> 1.1.0
To: openembedded-devel@lists.openembedded.org
From: "Alper Ak" <alperyasinak1@gmail.com>
X-Originating-Location: Istanbul, TR (176.33.65.238)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Nov 2023 01:32:43 -0800
References: <CAMKF1sr8WAv+H+4Ko6M+s9gw1_2CFrvkcOoAoQDKH7hpKrTXwg@mail.gmail.com>
In-Reply-To: <CAMKF1sr8WAv+H+4Ko6M+s9gw1_2CFrvkcOoAoQDKH7hpKrTXwg@mail.gmail.com>
Message-ID: <32560.1699867963006576418@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LsYTUep72SNEAPQ8yBTu"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 09:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106636

--LsYTUep72SNEAPQ8yBTu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I can get a build without any problem, is it related to the compiler? As fa=
r as I know, bits/stdc++ is a GNU GCC extension, I could be wrong. I will t=
ry to solve it.

Maybe something like this can be done: include bits/stdc++.h if glibc defin=
ed?

--LsYTUep72SNEAPQ8yBTu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I can get a build without any problem, is it related to the compiler? As=
 far as I know, bits/stdc++ is a GNU GCC extension, I could be wrong. I wil=
l try to solve it.</p>
<p>Maybe something like this can be done: <span class=3D"blob-code-inner bl=
ob-code-marker js-code-nav-pass " data-code-marker=3D" "><span class=3D"pl-=
k">include</span> <span class=3D"pl-s">bits/stdc++.h if glibc defined?<br /=
></span></span></p>

--LsYTUep72SNEAPQ8yBTu--


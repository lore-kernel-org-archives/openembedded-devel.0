Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0976AC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 13:11:42 +0000 (UTC)
Subject: Re: [[kirkstone][meta-oe][PATCH] xterm : Fix CVE-2022-45063 code execution via OSC 50 input sequences] CVE-2022-45063
To: openembedded-devel@lists.openembedded.org
From: "mv" <sdoshi@mvista.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (49.34.204.49)
X-Originating-Platform: Linux Chrome 108
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 29 Dec 2022 05:11:36 -0800
References: <20221229125920.567710-1-sdoshi@mvista.com>
In-Reply-To: <20221229125920.567710-1-sdoshi@mvista.com>
Message-ID: <10920.1672319496310011965@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="z6Mabfpi4VHgiFSpGUZj"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 13:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100298

--z6Mabfpi4VHgiFSpGUZj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Even though the patch subject is -> *Subject: [PATCH] snapshot of project "=
xterm", label xterm-374c,* It fixes=C2=A0CVE-2022-45063 as per -> https://g=
ithub.com/ThomasDickey/xterm-snapshots/commit/787636674918873a091e7a4ef5977=
263ba982322#diff-9f51c083fda4d1b957dde3784a2aa3e18afbcb178ed8ecf960380e64ce=
541089 [file name :xterm.log.html] which states that *
*

{{{

<li>improve error-recovery when setting a bitmap font for the

VT100 window, e.g., in case <em>OSC&nbsp;50</em> failed,

restoring the most recent valid font so that a subsequent

<em>OSC&nbsp;50</em> reports this correctly (report by David

Leadbeater).</li>
}}}

Regards,
Siddharth

--z6Mabfpi4VHgiFSpGUZj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Team,<br /><br />Even though the patch subject is -&gt;&nbsp;<strong>=
Subject: [PATCH] snapshot of project "xterm", label xterm-374c,&nbsp; </str=
ong>It fixes&nbsp;CVE-2022-45063 as per -&gt;&nbsp;<a href=3D"https://githu=
b.com/ThomasDickey/xterm-snapshots/commit/787636674918873a091e7a4ef5977263b=
a982322#diff-9f51c083fda4d1b957dde3784a2aa3e18afbcb178ed8ecf960380e64ce5410=
89" target=3D"_blank" rel=3D"noopener">https://github.com/ThomasDickey/xter=
m-snapshots/commit/787636674918873a091e7a4ef5977263ba982322#diff-9f51c083fd=
a4d1b957dde3784a2aa3e18afbcb178ed8ecf960380e64ce541089</a>&nbsp;[file name =
:xterm.log.html] which states that<strong><br /></strong></p>
<p>{{{</p>
<p>&nbsp; &nbsp; &lt;li&gt;improve error-recovery when setting a bitmap fon=
t for the</p>
<p>&nbsp; &nbsp; VT100 window, e.g., in case &lt;em&gt;OSC&amp;nbsp;50&lt;/=
em&gt; failed,</p>
<p>&nbsp; &nbsp; restoring the most recent valid font so that a subsequent<=
/p>
<p>&nbsp; &nbsp; &lt;em&gt;OSC&amp;nbsp;50&lt;/em&gt; reports this correctl=
y (report by David</p>
<p>&nbsp;</p>
<p>&nbsp; &nbsp; Leadbeater).&lt;/li&gt;<br />}}}<br /><br />Regards,<br />=
Siddharth</p>
<p>&nbsp;</p>

--z6Mabfpi4VHgiFSpGUZj--


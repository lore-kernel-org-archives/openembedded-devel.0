Return-Path: <marcel.behlau@elfin.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B216CC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 10:28:18 +0000 (UTC)
Subject: Broken access to openembedded repos
To: openembedded-devel@lists.openembedded.org
From: "Marcel Behlau" <marcel.behlau@elfin.de>
X-Originating-Location: Cologne, North Rhine-Westphalia, DE (87.78.131.86)
X-Originating-Platform: Linux Chrome 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 27 May 2025 03:28:17 -0700
Message-ID: <s3wf.1748341634942227679.Wl1y@lists.openembedded.org>
X-Old-Date: Tue, 27 May 2025 03:27:14 -0700
Content-Type: multipart/alternative; boundary="o00S4fVrzsiWSkkelbqw"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 10:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117634
Message-ID: <20250527102817.fDhgdBsBk4QuCrlTlJkzWZwcHhwP9D1a9eHZ4oT4GPA@z>

--o00S4fVrzsiWSkkelbqw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

we observed problems while access openembedded repos. It seems, path has be=
en changed, repos has been renamed or removed.

What we observed:

* https://git.openembedded.org/openembedded-core/ --> Clone now via https:/=
/git.openembedded.org/openembedded-core/git/0/
* https://git.openembedded.org/bitbake --> Clone now via https://git.openem=
bedded.org/bitbake-devel/git/0/
* https://git.openembedded.org/meta-python2 --> Has been removed

Were this changes intended?

Thank you very much in advance and best regards,

Marcel

--o00S4fVrzsiWSkkelbqw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Hi, <br /><br />we observed problems while access openembedded repos. =
It seems, path has been changed, repos has been renamed or removed. <br /><=
br />What we observed: <br /><br />* <a class=3D"moz-txt-link-freetext" hre=
f=3D"https://git.openembedded.org/openembedded-core/" target=3D"_blank" rel=
=3D"nofollow noopener">https://git.openembedded.org/openembedded-core/</a> =
--&gt; Clone now via <a class=3D"moz-txt-link-freetext" href=3D"https://git=
.openembedded.org/openembedded-core/git/0/" target=3D"_blank" rel=3D"nofoll=
ow noopener">https://git.openembedded.org/openembedded-core/git/0/</a> <br =
/>* <a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org=
/bitbake" target=3D"_blank" rel=3D"nofollow noopener">https://git.openembed=
ded.org/bitbake</a> --&gt; Clone now via <a class=3D"moz-txt-link-freetext"=
 href=3D"https://git.openembedded.org/bitbake-devel/git/0/" target=3D"_blan=
k" rel=3D"nofollow noopener">https://git.openembedded.org/bitbake-devel/git=
/0/</a> <br />* <a class=3D"moz-txt-link-freetext" href=3D"https://git.open=
embedded.org/meta-python2" target=3D"_blank" rel=3D"nofollow noopener">http=
s://git.openembedded.org/meta-python2</a> --&gt; Has been removed <br /><br=
 />Were this changes intended? <br /><br />Thank you very much in advance a=
nd best regards, <br /><br />Marcel&nbsp;</div>

--o00S4fVrzsiWSkkelbqw--


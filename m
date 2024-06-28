Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5B5C30658
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 17:06:27 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-bleak: upgrade 0.21.1 -> 0.22.2
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 28 Jun 2024 10:06:26 -0700
References: <CAMKF1sqpPQAdq7FOratvtZoAGJwL0bo0L=nDHAh4YjSWw6Jg=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqpPQAdq7FOratvtZoAGJwL0bo0L=nDHAh4YjSWw6Jg=Q@mail.gmail.com>
Message-ID: <19910.1719594386814066905@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RrkuQyLK2P9CKjmWCTjB"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 17:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111153

--RrkuQyLK2P9CKjmWCTjB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I will look into this over the weekend (running ptests is a new area for me=
). I'm curious what images you usually use / recommend?

I've usually just used this one core-image-minimal ( https://github.com/ope=
nembedded/openembedded-core/blob/master/meta/recipes-core/images/core-image=
-minimal.bb ) from openembedded-core and used oe-init-build-env ( https://g=
ithub.com/openembedded/openembedded-core/blob/master/oe-init-build-env ) fo=
r the environment and manually added meta-openembedded/meta-python into bbl=
ayers.conf.

I see core-image-ptest ( https://github.com/openembedded/openembedded-core/=
blob/master/meta/recipes-core/images/core-image-ptest.bb ) exists and looks=
 like a better choice than core-image-minimal ( https://github.com/openembe=
dded/openembedded-core/blob/master/meta/recipes-core/images/core-image-mini=
mal.bb )

Thanks for the feedback by the way, I really appreciate it.

--RrkuQyLK2P9CKjmWCTjB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I will look into this over the weekend (running ptests is a new area for me=
). I'm curious what images you usually use / recommend?<br /><br />I've usu=
ally just used this one <a href=3D"https://github.com/openembedded/openembe=
dded-core/blob/master/meta/recipes-core/images/core-image-minimal.bb" targe=
t=3D"_blank" rel=3D"noopener">core-image-minimal</a> from openembedded-core=
 and used <a href=3D"https://github.com/openembedded/openembedded-core/blob=
/master/oe-init-build-env" target=3D"_blank" rel=3D"noopener">oe-init-build=
-env </a>for the environment and manually added meta-openembedded/meta-pyth=
on into bblayers.conf.<br /><br />I see <a href=3D"https://github.com/opene=
mbedded/openembedded-core/blob/master/meta/recipes-core/images/core-image-p=
test.bb" target=3D"_blank" rel=3D"noopener">core-image-ptest</a> exists and=
 looks like a better choice than <a href=3D"https://github.com/openembedded=
/openembedded-core/blob/master/meta/recipes-core/images/core-image-minimal.=
bb" target=3D"_blank" rel=3D"noopener">core-image-minimal</a><br /><br />Th=
anks for the feedback by the way, I really appreciate it.

--RrkuQyLK2P9CKjmWCTjB--


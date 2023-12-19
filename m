Return-Path: <nyantra.ranaivoarison@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A260EC46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:57:50 +0000 (UTC)
Subject: Re: python 3.12 - help needed in fixing meta-oe failures
To: openembedded-devel@lists.openembedded.org
From: nyantra.ranaivoarison@smile.fr
X-Originating-Location: FR (176.157.204.145)
X-Originating-Platform: Linux Firefox 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 07:57:40 -0800
References: <CANNYZj_RSUUieQcKPkmrVft7fGmVHzR4yjL0wFGDBLx_wBghig@mail.gmail.com>
In-Reply-To: <CANNYZj_RSUUieQcKPkmrVft7fGmVHzR4yjL0wFGDBLx_wBghig@mail.gmail.com>
Message-ID: <8133.1703001181390498333@lists.openembedded.org>
X-Old-Date: Tue, 19 Dec 2023 07:53:01 -0800
Content-Type: multipart/alternative; boundary="Ggby4NfCvwa4SY5cqfy3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 15:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107635
Message-ID: <20231219155740.MWGDLHFV_Tsdaog4OsTTPVIqjXxefUDmpFBofkiv9fo@z>

--Ggby4NfCvwa4SY5cqfy3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I send you a PR for this error:
/srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python=
3-click-spinner_0.1.10.bb:do_compile
Here :
https://github.com/kanavin/meta-openembedded/pull/1

These ones have not been maintained for years, maybe it's best to remove th=
em:
/srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python=
3-oslash_0.6.3.bb:do_compile
/srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python=
3-xmlrunner_1.7.7.bb:do_compile

This one : /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/py=
thon/python3-dominate_2.8.0.bb:do_compile
should be fixed by this patch: https://lists.openembedded.org/g/openembedde=
d-devel/message/107547

Best regards,

Ny Antra

--Ggby4NfCvwa4SY5cqfy3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I send you a PR for this error:<br />/srv/work/alex/meta-=
openembedded/meta-python/recipes-devtools/python/python3-click-spinner_0.1.=
10.bb:do_compile<br />Here :<br /><a href=3D"https://github.com/kanavin/met=
a-openembedded/pull/1" target=3D"_blank" rel=3D"nofollow noopener">https://=
github.com/kanavin/meta-openembedded/pull/1</a><br /><br />These ones have =
not been maintained for years, maybe it's best to remove them:<br />/srv/wo=
rk/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-oslas=
h_0.6.3.bb:do_compile<br />/srv/work/alex/meta-openembedded/meta-python/rec=
ipes-devtools/python/python3-xmlrunner_1.7.7.bb:do_compile<br /><br />This =
one : /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/=
python3-dominate_2.8.0.bb:do_compile <br />should be fixed by this patch: <=
a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/10754=
7" target=3D"_blank" rel=3D"nofollow noopener">https://lists.openembedded.o=
rg/g/openembedded-devel/message/107547</a><br /><br />Best regards,<br /><b=
r />Ny Antra

--Ggby4NfCvwa4SY5cqfy3--


Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1554E83852
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 04:45:53 +0000 (UTC)
Subject: Re: [meta-OE] [scarthgap] [PATCH 1/5] Nodejs 20.18.2: Fix CVE-2025-55132
To: openembedded-devel@lists.openembedded.org
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 20:45:49 -0800
References: <20260212052114.3215220-1-adongare@cisco.com> <CA+s=J=z6a2s4+VR9sqbJ84uo6wqmqQcnBMZdD9CyM2o=uisJLw@mail.gmail.com>
In-Reply-To: <CA+s=J=z6a2s4+VR9sqbJ84uo6wqmqQcnBMZdD9CyM2o=uisJLw@mail.gmail.com>
Message-ID: <960627.1771303549079490576@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ARgylYfITYTVHGUgy2pq"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 04:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124433

--ARgylYfITYTVHGUgy2pq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,
Thanks for pointing this out.
I have checked the changes in your branch and confirmed the upgrade to Node=
.js 20.20.0. Since this version upgrade covers the fix for CVE-2025-55132, =
my patch for 20.18.2 is no longer needed.
Please feel free to discard this patch series.
Thanks,
Anil Dongare.

--ARgylYfITYTVHGUgy2pq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p data-path-to-node=3D"6,0">Hi Anuj,<br />Thanks for pointing this out.<br=
 />I have checked the changes in your branch and confirmed the upgrade to N=
ode.js 20.20.0. Since this version upgrade covers the fix for CVE-2025-5513=
2, my patch for 20.18.2 is no longer needed.<br />Please feel free to disca=
rd this patch series.<br />Thanks, <br />Anil Dongare.</p>
</div>

--ARgylYfITYTVHGUgy2pq--


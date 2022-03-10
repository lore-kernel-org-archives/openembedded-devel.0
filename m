Return-Path: <clemens.terasa@garz-fricke.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99108C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 07:19:27 +0000 (UTC)
Subject: Re: [meta-python][dunfell][PATCH] python3-fasteners: Revert new
 override syntax
To: openembedded-devel@lists.openembedded.org
From: "Clemens Terasa" <clemens.terasa@garz-fricke.com>
X-Originating-Location: Hamburg, Free and Hanseatic City of Hamburg,
 DE (77.8.65.94)
X-Originating-Platform: Windows Chrome 98
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 09 Mar 2022 23:19:26 -0800
References: 
 <CAMKF1srriviyq9VC7WCjwXha-t8=PGiq9vSqTHX2N4sNi50Xfg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srriviyq9VC7WCjwXha-t8=PGiq9vSqTHX2N4sNi50Xfg@mail.gmail.com>
Message-ID: <32273.1646896766680224354@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dh8Q4G9CbcdqLO9pqAaa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 07:19:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95920

--dh8Q4G9CbcdqLO9pqAaa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

You are total right, my bad.

I checked out the poky dunfell-23.0.11 tag, however, the BBSERVER was still=
 running in the background and thus using the old bitbake.

But shouldn't meta-openembedded be as compatible as possible? I am sure thi=
s habe been discussed dozens of times and I am ignorantly not researching e=
nough.
At least in this case I do not see a compelling cause to use the new overri=
de style, that might potentially break older poky/newer oe combinations.

Nevertheless, this is a non-issue for me now and the patch can be discarded=
.

--dh8Q4G9CbcdqLO9pqAaa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>You are total right, my bad.</p>
<p>I checked out the poky dunfell-23.0.11 tag, however, the BBSERVER was st=
ill running in the background and thus using the old bitbake.&nbsp;</p>
<p>But shouldn't meta-openembedded be as compatible as possible? I am sure =
this habe been discussed dozens of times and I am ignorantly not researchin=
g enough.<br />At least in this case I do not see a compelling cause to use=
 the new override style, that might potentially break older poky/newer oe c=
ombinations.&nbsp;<br /><br />Nevertheless, this is a non-issue for me now =
and the patch can be discarded.</p>
<p>&nbsp;</p>

--dh8Q4G9CbcdqLO9pqAaa--


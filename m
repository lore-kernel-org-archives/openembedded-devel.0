Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6C9CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:19:03 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] imagemagick: adds ptest for imagemagick recipe
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: IN (1.7.20.122)
X-Originating-Platform: Windows Edge 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 27 Oct 2025 03:18:54 -0700
References: <09ba1133-9de9-4bd6-8d59-4cc87b2b2aae@gmail.com>
In-Reply-To: <09ba1133-9de9-4bd6-8d59-4cc87b2b2aae@gmail.com>
Message-ID: <798.1761560334206814866@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="h1WetfYRxbWfW9VyoVPb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 10:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121031

--h1WetfYRxbWfW9VyoVPb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Gyorgy Sarvari , for insight
Will re-look at these suggestions and re-share the patch

The problem with test cases in imagemagick were that it would require manua=
l verification of files generated
Example they require user to manually open the output file and then check i=
f the drawing are proper or not .

That i thought might not be usage for ptest , hence created an simple test =
which generates the source and then use that source for test

Point-2 & Point-3 , i will work again on patch and share them shortly

Thanks ,
Ashish Kumar Mishra

--h1WetfYRxbWfW9VyoVPb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks Gyorgy Sarvari , for insight<br />Will re-look at these suggest=
ions and re-share the patch&nbsp;<br /><br />The problem with test cases in=
 imagemagick were that it would require manual verification of files genera=
ted&nbsp;<br />Example they require user to manually open the output file a=
nd then check if the drawing are proper or not .&nbsp;</div>
<div><br />That i thought might not be usage for ptest , hence created an s=
imple test which generates the source and then use that source for test&nbs=
p;<br /><br />Point-2 &amp; Point-3 , i will work again on patch and share =
them shortly&nbsp;<br /><br />Thanks ,</div>
<div>Ashish Kumar Mishra</div>

--h1WetfYRxbWfW9VyoVPb--


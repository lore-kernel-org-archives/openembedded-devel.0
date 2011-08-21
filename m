Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QvCQE-0001oe-5S
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Aug 2011 20:06:58 +0200
Received: by yia28 with SMTP id 28so2953253yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Aug 2011 11:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5id75noMuXdWzQC7A79MHN4UMxNS/wsUFOCEMnscGLk=;
	b=qSCA0bKuY/fJTKpWId7CpN+4I/xIe1RDIvq+oIrt+U/U/DunHXVcXuBELmVTGVCwNs
	Gcyd/TO2SUIn4GZOWDDlCpsSSAv4Fzbr7hi6L5LlZWoP/aT//jyQj562vP/1mYxW0CuL
	8AyaiSsS3mUgJfyeU0KBKgf+H0gwh+uhcJdZA=
MIME-Version: 1.0
Received: by 10.42.29.193 with SMTP id s1mr1640348icc.439.1313949734360; Sun,
	21 Aug 2011 11:02:14 -0700 (PDT)
Received: by 10.42.220.70 with HTTP; Sun, 21 Aug 2011 11:02:14 -0700 (PDT)
In-Reply-To: <4E4AA7B7.7020006@dresearch-fe.de>
References: <4E4AA7B7.7020006@dresearch-fe.de>
Date: Sun, 21 Aug 2011 11:02:14 -0700
Message-ID: <CA+M6bX=9E0c-hRCnyZ-7+WWX+NP_MeE_zLP8xtLH9EYqMVRDjA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] live555 update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Aug 2011 18:06:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 10:24 AM, Steffen Sledz <sledz@dresearch-fe.de> wro=
te:
> Is there a chance to update live555 to a newer version by cherry-picking =
this patch from oe-dev master?
>
> commit b13c2ab570637b176e1411ea3db0ddf412a9f2f3
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date: =A0 Sat Apr 23 23:57:36 2011 +0200
>
> =A0 =A0live555: catch up with upstream habits of upgrading and removing t=
arballs
>
> =A0 =A0Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>
> Regards,
> Steffen

Sorry for the late reply.  With the usual amount of testing and a pull
request, yes, we can.

--=20
Tom



Return-Path: <jc@vtkloud.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A34BE6CF23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 14:33:46 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn3so1333242wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 07:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:references:to
	:message-id:mime-version;
	bh=Imf3R0SLuOATTZzJCT5uQishzulvuys8bMyLkoj99aI=;
	b=K+qODmMkRC5kACA57+Fk9SRfieloP7mH2QA+zOe97xOesKbKynnkagHjmi/j9gpopQ
	Zw1ml23cfJUAo/e/406Plr3mrMOg0oObOkqaTratoCnvP8xF8NsUAh+xOWSSO+JkXTl3
	6Bm0nTAJPPNkQLWTTjOBclxzTVXeduMJqFYAN2LAcDCNInEEvaGpEdArZUATaocqCe3x
	6TGyW+/z/MlBc+fZkcNO3LO616wamLg/MJSTzDIoFgQTsvI/sKFYxUKsGQeZc17Uk5vv
	I4knVkDew5SkDMEqKv3XlpggD4A/GSPNtVOWJus3FgfSZEi5VtPDyS0eROeyEHqcyRu7
	fuvg==
X-Gm-Message-State: ALoCoQn9J2CEBgYdVLi4RVHKGHxgkKjRbxV9vr/Caz+J/ypNTJN2HRIUMNn6/wZxP0MAoumlxaDE
X-Received: by 10.180.101.134 with SMTP id fg6mr8127838wib.9.1381415627646;
	Thu, 10 Oct 2013 07:33:47 -0700 (PDT)
Received: from [172.24.63.121] ([94.103.137.126])
	by mx.google.com with ESMTPSA id
	ey4sm26545054wic.11.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 07:33:46 -0700 (PDT)
From: =?iso-8859-1?Q?Jean-Charles_JC_Verdi=E9?= <jc@vtkloud.com>
Date: Thu, 10 Oct 2013 16:33:44 +0200
References: <CAGzCC=83=JyahKe8=3uqb5He9ccaDF3oFOoK35fkm3ZXoQghsg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-Id: <0DF97D72-CB6D-416F-9490-C089455DFF2A@vtkloud.com>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
X-Mailer: Apple Mail (2.1510)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-webos] openwebos virtualbox pointer question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2013 14:33:47 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

resending as i'm not sure the email went through...

Begin forwarded message:

> From: JC <jcv@voxtok.com>
> Subject: [meta-webos] openwebos virtualbox pointer question
> Date: 9October 2013 10:46:28 AM GMT+02:00
> To: openembedded-devel@lists.openembedded.org
> Reply-To: jcv@voxtok.com
>=20
>       Hi,
>=20
> This is a newbie question, sorry about it. I built webos from the =
meta-webos recipe from within yocto by manually adding the meta layer =
(but I get the exact same result using =
https://github.com/openwebos/build-webos).=20
>=20
> When running the generated vmdk from virtualbox, I get a full webos =
running, the keyboard is functionning but I have no pointer device: the =
mouse is not integrated, and I couldn't find any keyboard-hack to point =
& touch anywhere on the screen.=20
>=20
> Apologies if this is not the right place. Otherwise thanks for your =
help :)
>=20
> Jay



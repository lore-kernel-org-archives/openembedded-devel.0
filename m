Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOzjT-00012H-Ts
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 01:10:16 +0200
Received: by lbbgo4 with SMTP id go4so2193151lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 16:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5MASoI2bESCL5XhdPBPP7lIdo4nYKP8jMUto+Esc2eY=;
	b=Mf4kX554Sil8LJiBeE1M0bZmVnFTbl8dSCcxM0QBsM4YiVCSc+0YMmV8FWL6s1ZTLs
	F11jz0s2+PdAdVzUYcGNCIv0YQI3dEV3WZ4Ib6ymC8gMnHOI5oHkk5SY/xte9RCA8BLs
	Cp5p04tPolBRLhQVCchHB2pgDTEZxZPRxmXsCCbGEe0hBmxbJUVgcpBje6FPgacjFU4w
	sMZP98xsbh7YnDfiiVZInQ5bkYPIPQp5gQXtr0+OaEo6gQINbjGMtDIgL22LHKgE4BFO
	BFzOu7Sw9DuCC44HpEJfLL3hU6ZxGBKBe+XuvRSFdjlvPfPZcjaArrRW8s0GgFRlFb/G
	TbdA==
Received: by 10.152.112.97 with SMTP id ip1mr21358537lab.31.1335826833379;
	Mon, 30 Apr 2012 16:00:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 16:00:03 -0700 (PDT)
In-Reply-To: <4F9E2A64.6040302@gmail.com>
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1spP9gnvy7JWQhLxA7VcfhUzWS4Ra1pH3XGA8eEguTporA@mail.gmail.com>
	<4F9E2A64.6040302@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 16:00:03 -0700
Message-ID: <CAMKF1sqZuXaBWdCdaABiP2u4RZ12f=uGRchXvYoNrvkVKJph8A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Mon, 30 Apr 2012 23:10:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2012 at 11:00 PM, Martin Erts=C3=A5s <martiert@gmail.com> w=
rote:
> Sure, the patches are attached.

these patches are not right. Drop the eglibc patches completely they are bo=
gus
gcc patch you can take a look here

http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/misc=
&id=3D7cc84a60662f9f2f5a1ad0264e94cea8a6954cec

eglibc patches are still work in progress. I am working on something
but its not final yet



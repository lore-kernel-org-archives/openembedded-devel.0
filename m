Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTPbU-0004X7-A6
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 04:04:01 +0100
Received: by faat2 with SMTP id t2so2496701faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 18:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=g8Stf4gNMIY0Q8DsW6DYuLGTww46AAskAWk54eBvXGE=;
	b=as4rSDK4JidG0BnG1s4w2A+W/t9yHZBFG/mMbkfi43FusfMQjd+U1veUNhxEMXqx/c
	6afyjELISjKLO+rb4rJ6JdVYeICOw8gqczp5X0Imh0AalIwaxu0NQYdUcf8HfBb5swiM
	XRhDvtjm1lQ8uadef8Vprw8ouhRgTuhzxuKXg=
Received: by 10.152.105.226 with SMTP id gp2mr16123159lab.28.1322103447164;
	Wed, 23 Nov 2011 18:57:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 18:56:56 -0800 (PST)
In-Reply-To: <B1B7C556AEB297419157DBF4C0C054F54F467C95E8@ushqwmb03>
References: <B1B7C556AEB297419157DBF4C0C054F54F467C95E8@ushqwmb03>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 18:56:56 -0800
Message-ID: <CAMKF1sr=HPfDSQg0__uE3dOF92hcCgtJN5tQ-_fQ3yK_bO2GGw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: recipe (or directions) for mm-common
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
X-List-Received-Date: Thu, 24 Nov 2011 03:04:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 20, 2011 at 9:33 AM, Myke Smith (Palm GBU)
<Myke.Smith@palm.com> wrote:
>
> Morning,
>
> I am trying to move our current version of glibmm from 16.6 to 24.2 but r=
an into the need to have "mm-common" installed when building glibmm. Lookin=
g at the recipe for glibmm_2.24.0 I saw there was an additional DEPENDS on =
mm-common. I found the source for mm-common on the gnome site but I have no=
t found a recipe in =C2=A0the current OE for this component. =C2=A0I am ass=
uming I can just "install" everything into the STAGING directory but if som=
eone has already written =C2=A0a recipe that I can start with so much the b=
etter or someway to eliminate the need to install this component.

Does this

http://lists.linuxtogo.org/pipermail/openembedded-commits/2011-July/058849.=
html

help ?



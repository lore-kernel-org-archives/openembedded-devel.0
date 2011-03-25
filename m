Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2ut4-0006Nx-9l
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 01:28:22 +0100
Received: by bwz10 with SMTP id 10so607164bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 17:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=tbdz3he0ZxwzgIDpdr0oZTcjWFNmJowJxz1dF3NsIS4=;
	b=Fw4Ga12T4IAPJvl2Jdih0mRIZkqszzMsoIKVjnnnx2NHqQC00ICxhYpBEEZg9WZ/zm
	7xAzWWEHG0lsnHJmOqI3YKLZnje3UlOTTqznkEYEORW788qMqBsQDJIPvQ29b+ccIB0X
	ZelA0cRNTlgGzM1gjNNnpnUwBmm1Oe9/hupKU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=COl1UxCdh2mTTlTBqWqi8dCXv5n59s60SbjWC7x1knkMdeEljHNrz50bism/0jicfA
	PEV4853e0bb7UWNS8oy5QiitLNcjsgufUhxDAOPloIqKN8FzTlTDhaO5Mbj7Xb4cB6NW
	fcaJEW2+JR7X0UTqFeGxx/7FElEBNE/qDD9IU=
Received: by 10.223.78.138 with SMTP id l10mr134769fak.106.1301012789112; Thu,
	24 Mar 2011 17:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Thu, 24 Mar 2011 17:25:59 -0700 (PDT)
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2011 17:25:59 -0700
Message-ID: <AANLkTi=2wrTUFovXf3eRwcwwrqCwdMNcep01vtbQTYVc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/8] [meta-oe] remaining set of LIC_FILES_CHKSUMs for e-wm build
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
X-List-Received-Date: Fri, 25 Mar 2011 00:28:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2011 at 4:25 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> e-wm compiled fine now with few extra BBCLASSEXTEND in oe-core
>
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
> =C2=A0Branch: jama/license
> =C2=A0Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/lic=
ense
>
> Thanks,
> =C2=A0 =C2=A0Martin Jansa <Martin.Jansa@gmail.com>

whole seried looks ok

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>
>
> Martin Jansa (8):
> =C2=A0eet: add LIC_FILES_CHKSUM
> =C2=A0evas: add LIC_FILES_CHKSUM
> =C2=A0ecore: add LIC_FILES_CHKSUM and inherit gettext
> =C2=A0edbus: add LIC_FILES_CHKSUM
> =C2=A0efreet: add LIC_FILES_CHKSUM
> =C2=A0eeze: add LIC_FILES_CHKSUM
> =C2=A0edje: add LIC_FILES_CHKSUM
> =C2=A0e-wm: add LIC_FILES_CHKSUM and inherit gettext
>
> =C2=A0meta-efl/recipes-efl/e17/e-wm_svn.bb | =C2=A0 =C2=A03 ++-
> =C2=A0meta-efl/recipes-efl/efl/ecore.inc =C2=A0 | =C2=A0 =C2=A07 ++++---
> =C2=A0meta-efl/recipes-efl/efl/edbus.inc =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0meta-efl/recipes-efl/efl/edje.inc =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0meta-efl/recipes-efl/efl/eet.inc =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0meta-efl/recipes-efl/efl/eeze.inc =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0meta-efl/recipes-efl/efl/efreet.inc =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0meta-efl/recipes-efl/efl/evas.inc =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A08 files changed, 12 insertions(+), 4 deletions(-)
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



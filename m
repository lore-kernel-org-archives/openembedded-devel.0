Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oyb1k-0001Zt-Lu
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 03:55:13 +0200
Received: by wwb17 with SMTP id 17so524596wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 18:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fmL/Ttbe7Md5fJMvhVgwgUR121SFkp3QVg8M8LYEoXg=;
	b=Wm7gVrIeIj/364u0bsvzYuy79Lxa8VMdKOazPv2Bia3Nid3KbpteTBCC44VTwiQMVQ
	FK7j1IndNIZsizVf0irPyjXGLqDc6KHdh9AH+rvK/wp/dpsaTcvi9529B84Tt+I+rLDG
	NPo5Opgkm9EjZwTWNCXP4bpdjFPOpy3pcV4Os=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dWnLRahvFsSZ2H6ACh0v+XT/CamVQ42g0LIWU0YLwb4y1R2zBD5/j7YzLiGYsHvf7U
	/A1oBq8O01mQi8rl8Jc3E4Exx3gh4MEXg3vQUOxrKDNHcEr4pyEls2+OXf/FC5VLyPSB
	EYS9tXzGrYPvb9+Rf6NldG7UataSXhDHdsIhg=
MIME-Version: 1.0
Received: by 10.216.12.139 with SMTP id 11mr866307wez.63.1285206904219; Wed,
	22 Sep 2010 18:55:04 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Wed, 22 Sep 2010 18:55:04 -0700 (PDT)
In-Reply-To: <1285194952-1831-2-git-send-email-eric@eukrea.com>
References: <1285194952-1831-1-git-send-email-eric@eukrea.com>
	<1285194952-1831-2-git-send-email-eric@eukrea.com>
Date: Wed, 22 Sep 2010 21:55:04 -0400
Message-ID: <AANLkTimVQEU7wgy5rGjj7bzuACSjRhU8DTp1b92OPVTN@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] qt4-tools-sdk: bring compatibility with QTCreator
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
X-List-Received-Date: Thu, 23 Sep 2010 01:55:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2010 at 6:35 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> * this links "puts" mkspecs at the place where QTCreator search
> for it in order to detect a toolchain
> * thanks to this link QTCreator detects the toolchain generated using
> meta-toolchain-qte and can cross compile applications without any
> hack

This is somewhat off-topic, but could you outline the procedure you
use to create a Qt SDK?  How does this recipe fit in with
meta-toolchain-qte?

Also, have you done remote debugging with QtCreator -- just curious
how well that works.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com



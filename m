Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLs3E-0000M1-8V
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 07:44:56 +0100
Received: by iwn8 with SMTP id 8so600148iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 22:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XdlW/4AA0xKnlEMzHVStk2ZoUoTckGfaPGEtB0NflQc=;
	b=OU5iDZVWm2WoBsf/hJEhZDINK+pulHwSQCBOSgo21KftqVj41Kg1zzqRn9ulAcWc3F
	qDuvJuF/5PZF+7G2S1/TToRAK1etAmIJ2itMf4rlGz5iOAuh7SZrXyaXcDitQrW/45oZ
	sgaCcJtTTGO5VAdv+XpbUKrFFIjmtGk7S5AOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ipr1dBXZydu7rDUfsEjL9QDETq4UO9AcIHWmf1s/y/lv8JsAm9JS53IqKIn89BmAkr
	nV1+7ySrupEQmpQ5MvaPvgkcC7SKB+O+p8D2xCB6i7PULgHOBPWtyr1au4zTr8PLgMHX
	DFgXiNlACKQUDIB3d8G9R36djiBD096qhR3vc=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr1066524ibd.26.1290753817934; Thu,
	25 Nov 2010 22:43:37 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 25 Nov 2010 22:43:37 -0800 (PST)
In-Reply-To: <4CEEFC5F.9090703@cse.unsw.edu.au>
References: <1290664003-17257-1-git-send-email-jayen@cse.unsw.edu.au>
	<AANLkTinV+PWoPR9DuTHskOcLWCMU_h+suGQt1HNc4cMf@mail.gmail.com>
	<4CEEFC5F.9090703@cse.unsw.edu.au>
Date: Fri, 26 Nov 2010 07:43:37 +0100
Message-ID: <AANLkTimiyn3JBroLv13EZ5UTOzgDn6YQbPDTCGhJBL0A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] IceE: New program
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
X-List-Received-Date: Fri, 26 Nov 2010 06:44:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/26 Jayen Ashar <jayen@cse.unsw.edu.au>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi Maksym,
>
> Thank you for the feedback. =A0I'll remove the patch from patchwork when =
I
> see it there. =A0Could you send me your patch(es), and if I have time
> before you, I'll try and bring it to a committable state and [re]submit i=
t?
>
> Thanks,
> Jayen
>
> P.S. To any admins on this list: is there an ETA on patchwork? =A0I'm
> seeing the same issue that Paul Menzel mentioned a few days ago
> (Message-ID: <1290433364.3703.22.camel@mattotaupa>). =A0Thanks.
>

There are some issues with patchwork at the moment.
It does not seem to pick up patches any more.
The admins are aware of this.

Frans



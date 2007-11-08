Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1Iq41Y-0008Dc-Ou
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2007 10:50:08 +0100
Received: by fk-out-0910.google.com with SMTP id 18so104701fks
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2007 01:49:11 -0800 (PST)
Received: by 10.82.190.2 with SMTP id n2mr605248buf.1194505422778;
	Wed, 07 Nov 2007 23:03:42 -0800 (PST)
Received: by 10.82.118.8 with HTTP; Wed, 7 Nov 2007 23:03:37 -0800 (PST)
Message-ID: <74d0deb30711072303q2e5801fco35a05b5fe5b7bed3@mail.gmail.com>
Date: Thu, 8 Nov 2007 08:03:37 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4731B63E.6030806@student.utwente.nl>
MIME-Version: 1.0
References: <E1IpXlZ-0004u8-1Y@linuxtogo.org>
	<74d0deb30711070226u29479070te5f20880b1616aac@mail.gmail.com>
	<4731B63E.6030806@student.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: [oe-commits] org.oe.dev rm_work: only remove ${S}, leave temp and install alone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2007 09:50:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/7/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> pHilipp Zabel schreef:
> > On 11/7/07, koen commit <openembedded-commits@lists.openembedded.org> wrote:
> >> rm_work: only remove ${S}, leave temp and install alone
> >
> > Why? Leaving image/ and install/ alone seriously decreases rm_work's
> > space saving powers.
>
> It does, but it's needed for our new packaged-staging frameworks,

Heh, there you just pulled the auto-agreement card :)

> and I
> did mention this change two weeks ago (20071027) on oe-devel ml and
> noone objected[*].

I don't find that mail. Could you point me to it and/or reexplain how
this will work?

thanks
Philipp



Received: from mail-iw0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1O9pxV-0007iI-IF
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 03:33:02 +0200
Received: by iwn1 with SMTP id 1so6478719iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 18:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Y04873zAx0K7zjTsc0DysOJlemDVbXVQB0TeSZPvDec=;
	b=f6JFCADWnJt5lKIuuoZSoVpvvnRALI4DGqIIEY3aVSnehUaxwStLuSRGkzq66cce7e
	2b4DMb8QWp2sS3xdmnwDAPG9jIlwlnXRvI1MVIT7bhOknaGCRvYFH16DHFOxcAtuzg94
	Mu9MbagaAcqLyjGd3iWV4dOgNTCfPA33Kfsa4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=btVeGdgZY96RVoXfdP37rb109bAj6v4S3fzrQ001Pf6yJxjjlGrFoi5fwk5OmB+aAm
	XoQo4wocpw5Sb+6+DQdcyhPvMt4+Tx/DvIJK5H8pUNGL2Zvo6NQEGm63xXxsk4vRAPqf
	MudSgpjpqDyko+Pd39FvFTemD/1L8MPdstxio=
MIME-Version: 1.0
Received: by 10.231.150.195 with SMTP id z3mr1355096ibv.3.1273109352667; Wed, 
	05 May 2010 18:29:12 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Wed, 5 May 2010 18:29:12 -0700 (PDT)
In-Reply-To: <1273104883.457.56.camel@trini-m4400>
References: <1273102999.5743.49.camel@rex>
	<1273104883.457.56.camel@trini-m4400>
Date: Wed, 5 May 2010 18:29:12 -0700
Message-ID: <l2q19c1b8a91005051829k2a37750dh35462f2742c28f7b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.171
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Thu, 06 May 2010 01:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2010 at 5:14 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On Thu, 2010-05-06 at 00:43 +0100, Richard Purdie wrote:
>> I finally felt the time was right so I've merged the work-in-progress
>> branch I've been talking about to OE.dev. This contains various
>> architecture improvements and legacy staging cleanups that have been
>> used in Poky for a while with great benefit.
>
> I've started testing DISTRO=3Dminimal with the machines and images I said
> earlier. =A0Will report eventually (it's a lotta stuff).

I will testout various arches with uclibc
>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



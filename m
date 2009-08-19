Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mdqe2-00071J-D7
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 21:16:26 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1414994qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=xN54hmsQXkxG5azSR3bCEyWvz3jJoOmO0U7io+Bc5DY=;
	b=nMab+0rfsNyp2XNDGXlM4ISEfGlr9KR8GMdk2AYH+rPG9sYxbA51qrPOy3dkUPP1vf
	EG2BC5UkZK9tN7OP5mYCkNfXShDg9X+jEG4sHF05dwxJ/BawHb2Ony4JmsdykPFc8sAC
	KHv6fYF1v3994GCKsfJZe+sDURBJTiqbBwqJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=vhdRa+nhHxEmo1iZVgxSWtzU2lIHE590EmbwYdjI08607n5So24nhPGGm/L/n8GMtd
	8F0rVISJndLV/z7TZAP6p+Uqok33B+jlbw97/x72BR+CoiqIyajjzemiD7DMc7X1oqey
	l4ULiI8mcLiTxcZBiLCOt1/rr+iqpKlYJwISs=
MIME-Version: 1.0
Received: by 10.229.20.206 with SMTP id g14mr2954717qcb.32.1250708353954; Wed, 
	19 Aug 2009 11:59:13 -0700 (PDT)
In-Reply-To: <4580C4E7-8991-46E7-AC1A-1DEDEF9A9F65@kernel.crashing.org>
References: <4580C4E7-8991-46E7-AC1A-1DEDEF9A9F65@kernel.crashing.org>
Date: Wed, 19 Aug 2009 11:59:13 -0700
Message-ID: <19c1b8a90908191159m30f5ad49h7e7da478bef9c50c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: fedora 11 package list on wiki
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
X-List-Received-Date: Wed, 19 Aug 2009 19:16:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2009 at 11:32 AM, Kumar Gala<galak@kernel.crashing.org> wro=
te:
> The wiki page:
>
> http://wiki.openembedded.net/index.php/OEandYourDistro
>
> lists:
>
> python-psyco
>
> as one of the packages to install on fedora 11. =C2=A0however this packag=
e does
> not exist. =C2=A0I'm not sure exactly which of the following should repla=
ce it:
>
> python-psycopg.x86_64 : PostgreSQL database adapter for Python
> python-psycopg2.x86_64 : A PostgreSQL database adapter for Python
> python-psycopg2-doc.x86_64 : Documentation for psycopg python PostgreSQL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 : database adapter

psyco is not available for 64bit. So don't worry about it.

>
> - k
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



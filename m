Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnaIs-0001Vx-2L
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 18:27:38 +0100
Received: by yie16 with SMTP id 16so688985yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 09:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=RoMBeNUBMWQy2Sa9vr20PQeeaWj2pFezFHzvcY7qSOg=;
	b=mGFQ5Gd1DGaDr8AbhSN0D2xx4xR8xAqH6EZaiXbohqbJMzwqSzcLiXgq03mVFZGuHd
	qb1G9Fm3LR9DkKILOB9EKlfXLxrRDVeRSu9s2qq/VjVvUOZGFmIYAVR1v1pQNhuTf58m
	mOBaRJoVTc+FKnxwIDoqt/hNo3rP4ZkH8uhNU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nPGaNerIUgxgu9F5qOu7H2zRgIUsL0y+zoz9ErMVAxHGqvle6q+aPkw3V3L7DzQb7l
	+WOFv4kqBXntG1hWMOsORMhmde51G2TX0/Kclvvh2qd6ETiuPHIxizy8l6qOwaQX3B/o
	fUtCh86+VVj0X5mNXxVSGlrwVVSLFFhwSSp/c=
Received: by 10.90.73.4 with SMTP id v4mr3036443aga.88.1297358789638; Thu, 10
	Feb 2011 09:26:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 10 Feb 2011 09:25:48 -0800 (PST)
In-Reply-To: <4D53E971.5090109@dresearch.de>
References: <4D53E971.5090109@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Feb 2011 09:25:48 -0800
Message-ID: <AANLkTi=c9c_ctv03Oe9f_2KAJ-eV4qNSkfAvwDh+ek97@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: different access rights for oe branches?
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
X-List-Received-Date: Thu, 10 Feb 2011 17:27:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2011 at 5:34 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> We like to create a branch specific for our hipox machine.
>
> Is it possible to define access rights different to the dev-branch here?
>
> We would like to give write access to some of our developers which do not=
 have/need write access do dev. In opposite it would be nice to limit the w=
rite access to these maintainers.
>

well while its possible to give access to your developers I would
suggest that this branch use a pull based approach where
may be you maintain the branch and your devs submit the changes.

> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@DResearch.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



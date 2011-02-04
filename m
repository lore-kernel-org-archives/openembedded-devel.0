Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PlMWG-00049N-TL
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 15:20:17 +0100
Received: by pvd12 with SMTP id 12so406614pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=15Nq6nW+34ppx0JuHL9cMK/YZhwiT+s2vIjYJXp7g0A=;
	b=ltrWHAiVADoIEk1w4Ozei2TrxGEuHDypegDuISQS/iA8lS/WUXMdDirSjWahaXljZm
	OKTmQAtqWVli4+zrw8n0l6f8L3EHtXjd1sMRFhQZR+NMWqXHIcIaCp97eE3TSVzrZCcD
	wvA+dQEyb2j9htZnF1fNGV9TQR+yTBz/tkiuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r13W+JZKWqnCpPOF+qwOyJaM+jfvr58nlHtWyr6vQY0sBR6T19x1guHGXJe7xjmTG6
	8NOBTeEmMuoa46RU8vuw3qnWZjvDODaqw1d67XxjO3pNs8Vyu3CFfgrsdiTQEKBmF3sr
	OkOSFS+lydD/JFiJwy+XwCa9P2AhA9ghYlW9E=
MIME-Version: 1.0
Received: by 10.142.163.19 with SMTP id l19mr5508087wfe.202.1296829158208;
	Fri, 04 Feb 2011 06:19:18 -0800 (PST)
Received: by 10.142.155.8 with HTTP; Fri, 4 Feb 2011 06:19:18 -0800 (PST)
In-Reply-To: <AANLkTimvM1WzjtxR+P759r=Yk5yi-hNeEbrt_168_mvw@mail.gmail.com>
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
	<AANLkTi==esXejD-tuPpKQxk6dR2UmVGBSiHwtYV_5QtC@mail.gmail.com>
	<AANLkTinZgDRh9D6LRs4KSNufmBTqy5qjyQbgr6BfcO4R@mail.gmail.com>
	<AANLkTimvM1WzjtxR+P759r=Yk5yi-hNeEbrt_168_mvw@mail.gmail.com>
Date: Fri, 4 Feb 2011 09:19:18 -0500
Message-ID: <AANLkTinYC+ht+nBKdb+6DyC5B5+D+z9i3YQb=u3PQUgT@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 14:20:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/4 Anders T=F6rnqvist <a.tqvist@gmail.com>:
> So then the results mailed out weekly and attached are the manually gathe=
red
> results from the wiki page?

Yes, I copy the table into a OOo spreadsheet, sort, and copy-n-paste
the entries that have the right date.  Its not bad, but still fairly
painful.

Automated reporting would be nice (like tinderbox), but no one has
signed up to do the work yet.

> If so, then the build results are probably better since probably not all
> successful builds are manually entered into the wiki table.

Probably depends who you are.  The testing effort is designed to help
new users find a stable starting point without knowing too much about
OE.  It is also proving very useful at keeping lots of build
combinations going.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com



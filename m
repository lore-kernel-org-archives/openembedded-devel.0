Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.tqvist@gmail.com>) id 1PlMOM-0003xk-Ka
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 15:12:06 +0100
Received: by iwn8 with SMTP id 8so2213598iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 06:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Wa8Ys/sxeKaO9U364pBbOfRrj01KCK0lFpmxPRAWRa4=;
	b=CWD2am4tZDU0+V+j1RKrXZPcO2/i8BOm99GxyjzLeMiEcUJODFLe9mwNHVOmKVhq17
	IV2nxSMk4Ak7Ub8LWcoxdJ2jUQK21ncH33EMVxh7LkZO2+4gud3L4B9y30x5/XGozrMF
	PbCqaEWajLa9wq9AF09wLH5J1OKhUYSmJ3z6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lqv/MZ1Rkulz6LF/WPS8jan1H2MNyu7y+6KG3NGCczUHGc7o773Ec4+p7Tr8ZMlTIK
	sBDiNjo96ulh0xbxj0AUMlyHVKauqPNB33pwDbJwvPlxtfT3iUSJkFmZrDH6v5ol8yJ2
	v1iQT4CNtE8BSemtVJvIG5/fSb3B3IYN9USB4=
MIME-Version: 1.0
Received: by 10.231.34.9 with SMTP id j9mr13011457ibd.137.1296828668406; Fri,
	04 Feb 2011 06:11:08 -0800 (PST)
Received: by 10.231.30.135 with HTTP; Fri, 4 Feb 2011 06:11:08 -0800 (PST)
In-Reply-To: <AANLkTinZgDRh9D6LRs4KSNufmBTqy5qjyQbgr6BfcO4R@mail.gmail.com>
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
	<AANLkTi==esXejD-tuPpKQxk6dR2UmVGBSiHwtYV_5QtC@mail.gmail.com>
	<AANLkTinZgDRh9D6LRs4KSNufmBTqy5qjyQbgr6BfcO4R@mail.gmail.com>
Date: Fri, 4 Feb 2011 15:11:08 +0100
Message-ID: <AANLkTimvM1WzjtxR+P759r=Yk5yi-hNeEbrt_168_mvw@mail.gmail.com>
From: =?ISO-8859-1?Q?Anders_T=F6rnqvist?= <a.tqvist@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Fri, 04 Feb 2011 14:12:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

So then the results mailed out weekly and attached are the manually gathere=
d
results from the wiki page?
If so, then the build results are probably better since probably not all
successful builds are manually entered into the wiki table.

/Anders

2011/2/4 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> 2011/2/4 Anders T=F6rnqvist <a.tqvist@gmail.com>:
> > These nice testing results, what are they?
> > Results from the oestats server of all the successful builds?
>
> My (eFfeM) test results are from a run on our autobuilder (using Hudson).
> I manually go through the result log and update the wiki table accordingl=
y.
>
> http://wiki.openembedded.org/index.php/Testing#Overview
>
> Frans.
> >
> > /Anders
> >
> >
> > 2011/2/4 Cliff Brake <cliff.brake@gmail.com>
> >
> >> master has been merged to testing-next and is ready for clean builds.
> >>
> >> I realize I've been tardy in getting the testing-next going, so I'm
> >> going to create a cron job now that does that weekly.
> >>
> >> Last week's testing results:
> >>
> >>
> >>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2011-=
01-28
> >>
> >> For more information on OE testing, see:
> >>
> >> http://www.openembedded.org/index.php/Testing
> >>
> >> Thanks,
> >> Cliff
> >>
> >> --
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> http://bec-systems.com
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


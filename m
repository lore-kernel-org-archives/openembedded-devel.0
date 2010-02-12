Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcosmamorim@gmail.com>) id 1Nft2B-0003Z2-EJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 11:46:06 +0100
Received: by bwz26 with SMTP id 26so1840695bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=+zTtCCsPTIW89cR5pPiwBlXk5QDUrc2D0MMedBfv1QU=;
	b=eh2xFOaGEfvbGsClDgoWsiiMrkcKwneRIjnTdkA9DuK/7hrG5EBubVLI23at/+dxVM
	I4Vg5QzcbTMIWozhOnVM1GcGfVTnV25Sm5cq3+uo557GIS/g9O6X2jodS5YAuvxvnXNB
	LyTXX/YgFudFdMm+r2JuEx5mEbG+4E4o6FFuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gBcwrXNq88q7PD1MjikonXF9BORQiioieDNrxX0Cux8EspwQjIss3oPn5iFN8dIrCj
	KdT003MPeZTXEZB7jrsrvb3e8mrCtKlbpps6bsIbX0gmx4HBk3HO/7AV8YyCOCaSw1Tw
	d2l5Ryv5/Y0wI728SYw6aPF7lW0IcS3SlYwoU=
MIME-Version: 1.0
Received: by 10.204.25.83 with SMTP id y19mr274893bkb.112.1265971407598; Fri, 
	12 Feb 2010 02:43:27 -0800 (PST)
In-Reply-To: <ac9c93b11002120023mcdab5e1w2694d06e7f48368e@mail.gmail.com>
References: <b8e1ecc81002111744u4e9c2d84xc5cc1e3d2d1b3a0d@mail.gmail.com>
	<ac9c93b11002120023mcdab5e1w2694d06e7f48368e@mail.gmail.com>
Date: Fri, 12 Feb 2010 08:43:27 -0200
Message-ID: <b8e1ecc81002120243n76a45453q741dec37041909bf@mail.gmail.com>
From: Marcos Amorim <marcosmamorim@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: marcosmamorim@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: busybox* Fix URI
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
X-List-Received-Date: Fri, 12 Feb 2010 10:46:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Frans,

This patch fixes only SRC_URI, I'll test after the suggested change.

Marcos Amorim

2010/2/12 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> 2010/2/12 Marcos Amorim <marcosmamorim@gmail.com>:
> > Hi All,
> >
> > I suggest move SRC_URI from all busybox_${PV}.bb for busybox.inc, but i
> dont
> > really if is possible.
>
> Then I suggest you apply your own patch and test
>
> >
> >
> > Thanks,
> >
> >
> > Marcos Amorim
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnaFT-0001OG-4w
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 18:24:07 +0100
Received: by yie16 with SMTP id 16so687382yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 09:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=jfnPerkX5zER4MIFwYqiaq5rI3+mztwinA7Qw1Qbazc=;
	b=SwUGkSyE0Gv7N8zsUyl3QGOotE81I1kYdR9ilzpjgEFHiSC+lwD65X1i5B2V/yLOp9
	AuuQMTZGLEF9fTV4NsCMfTKmjD7oI3DY0bvUOKEvtBtQNiv63lp2uuB1PmZUF9OK029B
	ihs1vxva/XiGc+y8+viz5azzxKNpOgDgPltYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=QNM9TUVoBm6jqvdmfhFG1KVZbCTZGAU3e2QRVldBClfamHT0gkRU06uCtRLMk6iKmH
	BaE0r5JTlFupcm1yXq5PRBZeBDoyTNhAY96Xgn7jmiXvTbTPyfBhqy3nnFRbgM+In3A4
	mCWhgZ0t8j7jfBIaE+iD3bOBR6ZbILUmmQkEU=
Received: by 10.90.73.4 with SMTP id v4mr3032144aga.88.1297358580911; Thu, 10
	Feb 2011 09:23:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 10 Feb 2011 09:22:38 -0800 (PST)
In-Reply-To: <4D53EE67.3020705@dresearch.de>
References: <4D53E971.5090109@dresearch.de>
	<AANLkTimEYm1sDsLob7rwkZy8GshO2KxihZAQBm4azB5e@mail.gmail.com>
	<4D53EE67.3020705@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Feb 2011 09:22:38 -0800
Message-ID: <AANLkTikMYFbyza7Ma2d-N_GNpy+U=Gy3gKPx8BRE13eZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <clarson@kergoth.com>
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
X-List-Received-Date: Thu, 10 Feb 2011 17:24:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2011 at 5:55 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 10.02.2011 14:48, schrieb Chris Larson:
>> On Thu, Feb 10, 2011 at 6:34 AM, Steffen Sledz <sledz@dresearch.de> wrot=
e:
>>> We like to create a branch specific for our hipox machine.
>>>
>>> Is it possible to define access rights different to the dev-branch here=
?
>>>
>>> We would like to give write access to some of our developers which do n=
ot have/need write access do dev. In opposite it would be nice to limit the=
 write access to these maintainers.
>>
>> We use gitolite now, which can indeed exert control over branch access
>> for the users, afaik.
>
> Fine. :)
>
> Who can setup these rights?

the admins :) create the branch and what sort of access control is
required we can configure that

>
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



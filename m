Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1N7vg7-0002LT-23
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 19:42:58 +0100
Received: by bwz9 with SMTP id 9so315566bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 10:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kXoWcaJk2GewDxuxC9yOvN8X5dz3FMpLIYsHfYCiCEM=;
	b=a7sqHOesNb+QG25tCs9yEvItT10l9nZgP7z+7+m3pwMg8Q31lT04E/igK0Xr+DXDGr
	fmLb6kuLHIM9xjL5EYwniF91rKrAXYBwtj8pUTiPdayfGY58BHTV9Ii3oQHnV/ytzKaj
	sF7+aTkZxBOSM6Wl18Lt6mPRaLKyLJwvjQw9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OuuWmPZMm/my9npVQfzX4W9uPzwAWOgaNWHAjobCJrqOIop/MT1OzFpp6FY7guVixl
	7LcUL/cP3GdlLBJFIGVIHKGudpn2Ukoww+UtOn0yOT3BgunW9fEdQxfyEDQ2ZCISzNGe
	ybM3LE/zVvWHVUyVyUYHrXGmGQu8hVfJICq0o=
MIME-Version: 1.0
Received: by 10.239.195.196 with SMTP id s4mr38601hbi.209.1257878129735; Tue, 
	10 Nov 2009 10:35:29 -0800 (PST)
In-Reply-To: <be7a9f3d0911100919y1ef9f5c5yc70513581e1f816f@mail.gmail.com>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local>
	<1257864635.5228.17.camel@opal>
	<20091110151412.GF3998@excalibur.local> <1257868356.5472.1.camel@opal>
	<be7a9f3d0911100914o45d3526fufb4338966b9cdc33@mail.gmail.com>
	<be7a9f3d0911100919y1ef9f5c5yc70513581e1f816f@mail.gmail.com>
Date: Tue, 10 Nov 2009 19:35:29 +0100
Message-ID: <d2b9ea600911101035ydadda7eqdb3af1a5c6fc0472@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 18:42:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2009 at 6:19 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> On Tue, Nov 10, 2009 at 1:52 PM, Michael 'Mickey' Lauer
> <mickey@vanille-media.de> wrote:
>> Sorry, this might have been unclear on my part, it's just different
>> projects on the same repository, not different repositories. We'd like
>> to and recommend OE developers to host their branch in a 'contrib'
>> project on git.oe.org.
>
> I see no point in having a contrib tree with many users on it; I much
> prefer to have a by-user tree and then allowing them to do whatever
> they want on this tree.
>
> If someone needs to contribute on a tree, he can fork it and make it
> available for pulling. This is the easiest way of starting to =A0"train"
> people to get used to the pull-model.

Exactly.  It is quite hard to appreciate the pull-model before trying it
for some real work.

> A simple solution might be to use gitorious for oe as being done in
> qt; that avoids the admin hassle and provides more user friendly
> interface for it.

Good idea.  Git admin overhead could definitely be reduced/simplified
by switching to gitorious.  And it doesn't seem like OE is crowded
by people with system administration as their 2nd hobby...

/Esben



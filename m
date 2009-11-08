Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N79Ly-0001jq-6R
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 16:06:57 +0100
Received: by bwz9 with SMTP id 9so2497428bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 07:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=AA+r6wc9T9NQiCaNP9DCGX8fSY8AY6h1UzhgksIcsQM=;
	b=GtmeXtRsIxC8K1+NAp5I3D4MFOsB6IcoFd52Ip6C2uoR1dPR2Hw4+wiMmdODR6Mjwd
	pxKdIsqArveEs77xYShCksayDzVl6OFrpG5qsMiaEfAkf+NxLoNbQ7LWNKdhU+JxbXFB
	WvsScqCEXTYrNzaA013j5Ysl2vJgZaMQUtKZo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=XmaVJl3jWQ+ovM7+1PSjfTCoIqpjQc82kROtoQ3DZUB9oIAd1Kuk9cEKaUt8r3EI1z
	cslLrOCYoddfjzOGhvVCwIuuft2t8xKUVPGUn25a++FwOUFQjBGEsJLxAugypkgtYl12
	70UtjerHeNA0LWg3JrfaP0u1sd/yycBclXgNc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.145.165 with SMTP id s37mr769074hba.43.1257692372169; Sun, 
	08 Nov 2009 06:59:32 -0800 (PST)
In-Reply-To: <hd6k2l$7lv$1@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<hd4qpq$ee0$1@ger.gmane.org> <1257682982.26962.14.camel@opal>
	<hd6ggj$tf3$1@ger.gmane.org>
	<ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
	<hd6k2l$7lv$1@ger.gmane.org>
Date: Sun, 8 Nov 2009 12:59:32 -0200
X-Google-Sender-Auth: 76eb71d7c0c19813
Message-ID: <be7a9f3d0911080659v20adf3f9gc3fcbad3b815f967@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sun, 08 Nov 2009 15:06:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Sun, Nov 8, 2009 at 12:20 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 3.33 is a version. A version is a point, not a distance. If it's a snapshot
> than you should call is twig-snapshot, twig-3.33rc1 or whatever.
> Replacing a versioned tarball weekly is *bad*, since you (as upstream
> maintainer) don't know what the "3.33" is your users are complaining about.
> And note that *nowhere* on that page it is stated that the development
> version keeps getting updated. And for that matter it also doesn't say 3.32
> is any better.

If it is bad or not it is up to them (it is their project). If it is
stated that it is a development version in their website then we ought
not take it.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1Q9R3Y-00076c-Hi
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 02:02:08 +0200
Received: by wwb17 with SMTP id 17so6286983wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 16:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=JFuhEn6lEd2244Q6bZ6npcFklmcytlxvwhqNTcxheac=;
	b=vRO+6GDjQHgNVPBXE/huABXCTHKtBG4ldDUzyb3Gc9x/qQFu3q7kSwmseAIxml2jh4
	Q/w5UGFKik0+zXODQYNgf8/iEgjNJEdqg+PV1u4aipCzEbTSW/03OdL6CvMJSyUmZfZV
	4T9nRMdnD0llI1jmJ/0bMakomjr1i4DF4Lxao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SYNAw/txHd3lEfCXz4fijZnlTQgjevM939hvBuumLVvHCfLzveMunns2BqpsM3m1WA
	Men7eoaeWBRzt6WZbVPdOI+5sY3gpSYMh37aVdpT1DI58BLZWWpzaoC1YIGiUXj+tYBP
	JGpvxnNAJPi3RVsIop/85gCbXrh2P0rPGXIsE=
MIME-Version: 1.0
Received: by 10.227.207.196 with SMTP id fz4mr5874085wbb.42.1302566392427;
	Mon, 11 Apr 2011 16:59:52 -0700 (PDT)
Received: by 10.227.137.79 with HTTP; Mon, 11 Apr 2011 16:59:52 -0700 (PDT)
In-Reply-To: <4DA392CC.4010401@balister.org>
References: <4DA392CC.4010401@balister.org>
Date: Tue, 12 Apr 2011 09:29:52 +0930
Message-ID: <BANLkTimGgmPt2sp69FmDZutgOZoEqwsQzA@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Upstreaming patches
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
X-List-Received-Date: Tue, 12 Apr 2011 00:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 12 April 2011 09:16, Philip Balister <philip@balister.org> wrote:
> Saul Wold asked me about upstreaming some of the patches in OE. Apparently,
> Intel has some people who can look at submitting some of our patches
> upstream.
>
> The question is, what do we do about attribution? The problem is that is not
> simple for many cases working out who created the patch. Rather than spend
> time chasing through the revision history, it would be simpler to send the
> patches upstream mentioning the source as derived from OE.
>
> My thoughts are no reasonable OE contributor would object to someone else
> upstreaming their patches :), but I thought I should ask people what they
> thought.
>
> Obviously, if there is a complex patch the situation is different, but I
> suspect most of the easy patches do not fall into this category.
>
> Comments?
>
> Philip
>

Sounds good. I think omission of attribution if no original author can
be identified is fine. Its more important that the work not be lost.

Please note that many patches submitted upstream have already been
ignored by upstream.

-Graham



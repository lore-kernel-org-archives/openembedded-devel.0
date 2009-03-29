Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lntjn-0007bF-Mg
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Mar 2009 14:03:39 +0200
Received: by fxm20 with SMTP id 20so1515906fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3Rihbm5XGfxXvfqhy4KwqkUK6MLiJDeUP1i726iBodI=;
	b=cwMgCMjAty6ZD1+s1O6jU5K6cC8hJtRAMPhRrJiJd+0QIcGeqyDlRPH2L89RUurPRC
	Z63xadzltOR4JyM7wcXcahxsIXnWyhi244aUBln+nyhvDC5fGTSGDJ4ZypbTSYyBYAcj
	GKIygBPhX5kBd/tdDZv7NeMEzWH6+5j5Ozn/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QEklgFNHwfk/Ma/3lJW/BtgJnJNcQl0Um5kC3J7oja0ihzpKXbeeWPvDPcaUj3RrXI
	AMH4BHYTW29oiRCET87FwSZdupmKVTvrg6l0Cl8e81MCBWHqrufVu5ByidU5oRJA4Cva
	Qx04eKJPTribkqeGHsMEOm1EnSniYk5uSQ7/Q=
MIME-Version: 1.0
Received: by 10.223.105.72 with SMTP id s8mr3082934fao.9.1238328098192; Sun, 
	29 Mar 2009 05:01:38 -0700 (PDT)
In-Reply-To: <gqnesc$r8i$1@ger.gmane.org>
References: <d1b08f940903250314r18e16be0k7989e6d51cee2c@mail.gmail.com>
	<gqd33g$5vk$2@ger.gmane.org> <1237985376.8711.7.camel@opal>
	<f96d234e0903270719g1d0c2075lc440f8ddac0b4a94@mail.gmail.com>
	<gqnesc$r8i$1@ger.gmane.org>
Date: Sun, 29 Mar 2009 14:01:38 +0200
Message-ID: <ac9c93b10903290501i41fdac09i3838e00a652c8db9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Bugzilla Status (pitiful, penoso, penible, bedauerlich)
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
X-List-Received-Date: Sun, 29 Mar 2009 12:03:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/3/29 Rolf Leggewie <no2spam@nospam.arcornews.de>:
> Cliff Brake wrote:
>>
>> Somehow if we can get bugs
>> assigned to the right people (listed in the maintainers file), then
>> maybe it would work better.
>
> I agree, but it was heavily frowned upon when I assigned bugs to people.
> =A0The compromise was cc'ing them instead. =A0I agree a sense of responsi=
bility
> for certain parts would make it easier to slice and dice the tasks into m=
ore
> manageable pieces that people may feel an urge to actually do something
> about.

It is just a matter of policy and understanding.
For me if I were to get a bug assigned, I would interpreted it as:
"hey soneone found a bug and perhaps you are the right person to look
into it".
If it was not for me, or I cannot fix it, I'd just give it back (and
probably also if I don't have time or am not interested, however if
that last thing happens often, then maybe you should not be a
maintainer)

Frans.



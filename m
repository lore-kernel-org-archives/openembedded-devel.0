Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LncQD-0002ZB-8J
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Mar 2009 18:34:17 +0100
Received: by gxk18 with SMTP id 18so3041317gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Mar 2009 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DihAsyh2XkstfSWAbRstCh14Qlu1qTVEdvpnIAdP+Eg=;
	b=SC5Ad1xvQzhePd3n0DtyOiK2arWCkhh5Y5uSiZPcoP6BDwjM7FcR9DlDoGqUPOEmdu
	Y83x+pYbLN3F+c9OIHX1ZqI1tUYxSv//Ky7noCymkVePNEJ6ZcT28A/vnP+p2S5J0JIp
	SXFVpJkrF6au+dq10TLgoTWb0hyFxhZHGN2WU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=A9Rv50AHvqhucAwhZPHjpX/xtR/AugIz5Vdt6wgJBbrIGkflfSO6OMQIky6E/988QX
	/QHPP0ymh0os3/8kO+EjiGDDkajU39UvXvf1GjC0wkF7Fp1GFsnYj6HLWV2TRy6sgbeM
	Gn7mHyvD6YnzFqrCgwNc0UYKwzh5E/CQVftck=
MIME-Version: 1.0
Received: by 10.151.145.12 with SMTP id x12mr6536039ybn.215.1238261540250; 
	Sat, 28 Mar 2009 10:32:20 -0700 (PDT)
In-Reply-To: <49CD10F4.5050609@balister.org>
References: <d1b08f940903250314r18e16be0k7989e6d51cee2c@mail.gmail.com>
	<1237985376.8711.7.camel@opal>
	<f96d234e0903270719g1d0c2075lc440f8ddac0b4a94@mail.gmail.com>
	<200903271652.33801.mickey@vanille-media.de>
	<49CD10F4.5050609@balister.org>
Date: Sat, 28 Mar 2009 13:32:20 -0400
Message-ID: <f96d234e0903281032q4229891ek55712f162496697f@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
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
X-List-Received-Date: Sat, 28 Mar 2009 17:34:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/3/27 Philip Balister <philip@balister.org>:
>
> Bugzilla came up in the IRC stable branch meeting. Basically, who is the
> audience for the OE bugzilla? Distro users? Distro's should really set up
> their own bug reporting system.

It seems that we need to use fewer tools well, rather than create yet
more places for people to find information.  I would rather see all
(most) of the distro users agree on how to use one bug tracking
system, as they are are really part of the same project
(OpenEmbedded).

> I'm not sure what the real answer is here, but we should put some effort
> into deciding who the intended users of bugzilla are, and make sure we meet
> their needs.

Agreed.



-- 
=======================
Cliff Brake
http://bec-systems.com



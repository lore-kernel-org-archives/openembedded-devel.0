Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LnCw4-0000FO-TD
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 15:21:29 +0100
Received: by gxk18 with SMTP id 18so2092387gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9yTFGj/i4aNPMWQlvge+vOl9PXPmA9DTXOsjJcjeTZ0=;
	b=uZyL0QIyAgVbRQf/W6Yy5egkSLSZct9Wb5TtJV8xTkKobxa53cGpi4SvlX0evCXLo2
	LzPAaNypARMADpeCbodZDOmJW+Rh379nuLUOJ6gN2qIIFsGKIsKG5ZxeyRT1wP6sFzpz
	o9ykaMJ49JrYLRaw+3a+yMF2f+01JobP3qyWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=N4D7lPR6Vqoz8UPpWJMCaTV551kDkgtrMoVbZMwh/50GAVb63UuInmsRRJayGKOPl3
	evnvt8igh+fBaseIgRAyI94TvtMXLUHSWp52UL71iY/4hFnWz6oFzCn8VqqJ48/Wxo9y
	Ep9gP0RbQubm478Ce3WaoviwHghUTtJCxx9GM=
MIME-Version: 1.0
Received: by 10.151.102.16 with SMTP id e16mr3914754ybm.22.1238163579243; Fri, 
	27 Mar 2009 07:19:39 -0700 (PDT)
In-Reply-To: <1237985376.8711.7.camel@opal>
References: <d1b08f940903250314r18e16be0k7989e6d51cee2c@mail.gmail.com>
	<gqd33g$5vk$2@ger.gmane.org> <1237985376.8711.7.camel@opal>
Date: Fri, 27 Mar 2009 10:19:39 -0400
Message-ID: <f96d234e0903270719g1d0c2075lc440f8ddac0b4a94@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Mar 2009 14:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Mar 25, 2009 at 8:49 AM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> Am Mittwoch, den 25.03.2009, 12:04 +0100 schrieb Koen Kooi:
>> On 25-03-09 11:14, Andrea Adami wrote:
>> > Bump
>>
>> As I said, let's close it down.
>
> -1000. Lets continue cleaning it up.

Building on Chris's push for package maintainers -- perhaps we need to
insist on style guidelines for bugs as well where we prefix the bug
title with the component name (like repo commits), or create separate
components for every directory in recipes, machines, and perhaps a
catch-all for core files.  Then the maintainer for the component could
decide if the bug is valid, and close it if not.  If bugs collect for
a component, and nothing gets done, then we need to search for a
maintainer, or mark the recipe unmaintained.  I guess the difficult
part is all this needs active management.  Somehow if we can get bugs
assigned to the right people (listed in the maintainers file), then
maybe it would work better.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com



Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8FoP-0000Ai-Rd
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 19:17:23 +0200
Received: by iwn2 with SMTP id 2so2774118iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Z1uKNzFJ/aTNO/1x+JgEYBGgIQC59LM6va+8riqk4S4=;
	b=t/3rvRR+5wJOSWaMyK9lJNsuC7odk5UP9xpb01PqeM27wnZrZQrtT25JMdauRJ57yH
	ADO+8ASy3PSDAesfcazRP+YfqmnEF2dKTE8/FKz/TqQZ/2/BiximEiWg/mLHmUWZAopS
	rkfGBFd2W8cLlmrhYt2jjjtFemQ15Z7QY3hNY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UFBQ3p6g8NsHYozM564Lmrb0W0cHFMG8O/iR8lcrP5qG6u/FFIX84WRY1CmGwwzRqb
	y703eGLc/svPQ3qhw3wAAs8UDzh8uxC0AK3lNrzw+PBr/VFk5cgkfzSdzVsiVTbK1yOg
	IX4nx/XTd+5i2LnIveeGm6Nxe0Dn20CKJlnAo=
MIME-Version: 1.0
Received: by 10.231.35.200 with SMTP id q8mr5065512ibd.191.1287508608203; Tue,
	19 Oct 2010 10:16:48 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 10:16:47 -0700 (PDT)
In-Reply-To: <AANLkTi=fiMQULYAZsB+CKDeFFf9esmDRruER72F6QsvY@mail.gmail.com>
References: <AANLkTi=BRC8V5VRWuBKac750eoS79eeBtaiyDOYGwzgo@mail.gmail.com>
	<AANLkTi=fiMQULYAZsB+CKDeFFf9esmDRruER72F6QsvY@mail.gmail.com>
Date: Tue, 19 Oct 2010 19:16:47 +0200
Message-ID: <AANLkTi=Wwzx9ByWg3wa6voWEOaVRC6B0N78J6vDqoTtR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-gumstix-2.6.15 & gumstix_2.6.5-gnalm1: removed outdated recipes
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
X-List-Received-Date: Tue, 19 Oct 2010 17:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/19 Ash Charles <ashcharles@gmail.com>:
> On Tue, Oct 19, 2010 at 12:11 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Ash, do you have commit access, or does someone needs to push this for you?
> If someone could push this, that would be appreciated.
>
> Actually, I'm a little new to this: what is the life-cycle of patch
> once it lands on patchwork?
> Thanks,
>
> -Ash

Someone needs to pick it up and push the patch.
I can do that for your when I get a 2nd ack.

Frans.



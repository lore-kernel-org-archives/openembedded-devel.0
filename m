Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OUK7I-0007Tm-VG
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 15:47:49 +0200
Received: by fxm12 with SMTP id 12so1356617fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 06:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZFECNkr3DSDRsL5Ir1JRkGgdXJ6Y7mjoQecG+B/uubI=;
	b=sg0QiFz9lPFOF9K13PyNmjWPp6P30WVHkzkriYuK0o3KfmghLvIy+67bJDYB0sUjCN
	/n17ce4mpJMC2P1BcP9GfYcvzwAKYcXlRNoeK4bdFW9yUaRPfSK4/0uMDvclbJrZ0dLW
	07uyIYu5+Mk+GVy0buD716ReStlGu9SmVxwhA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=c+UPJVxRAWFz+XGrMTmcYj5XzYVUnXDt82T7lxQsLfEqoAZTB1Al2BukdsE/NFDWeO
	8A5wwuJ815sFligLWf7kXrJryty7hPEjN4vczOzRsX33TQnQ+kjIOAaxKoeZxP/clPJF
	kn3QfcG8LWL8dd2yz3DHiT1LPyBaffYYdMoDI=
MIME-Version: 1.0
Received: by 10.204.162.202 with SMTP id w10mr4535005bkx.115.1277991783202; 
	Thu, 01 Jul 2010 06:43:03 -0700 (PDT)
Received: by 10.204.73.81 with HTTP; Thu, 1 Jul 2010 06:43:02 -0700 (PDT)
In-Reply-To: <20100701130724.25b3c926@xora-desktop.xora.org.uk>
References: <4C0F9119.3000909@freyther.de> <4C2B1BC4.2030808@freyther.de>
	<i0f8ct$acp$1@dough.gmane.org> <4C2B446A.5040301@freyther.de>
	<i0hl7b$8uu$1@dough.gmane.org>
	<AANLkTimkcS9sUwgwykKcksbWMJvo1jolGpB-oaznT2bg@mail.gmail.com>
	<20100701130724.25b3c926@xora-desktop.xora.org.uk>
Date: Thu, 1 Jul 2010 15:43:02 +0200
Message-ID: <AANLkTiktVbJSGCHWuEbhkjGObQR_9pbzgPyhkhR7tOrT@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Thu, 01 Jul 2010 13:47:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/1 Graeme Gregory <dp@xora.org.uk>:
> On Thu, 1 Jul 2010 13:52:26 +0200
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> Net effect: either older versions are not updated, or the versions are
>> updated but not tested. In both cases IMHO quality-wise a less
>> desirable situation.
>>
>> Then again, I tried to fight the version diarrhea, and I lost.So be
>> it. But don't come and ask me to improve the quality of recipes that
>> IMHO should have been discarded long time ago.
>>
> Aaaaargh how many times do I have to say this, removing a recipe just
> because it is old is not acceptable to me. Removing a recipe because
> its discovered old versions are broken and no DISTRO is interested in
> that old version is perfectly acceptable (as long as a strong
> maintainer is kept in the loop if exists).
>
> Graeme

Graeme, I am aware of your position on this, and I am pretty sure you
are aware of mine.

However, for the rest of the world, I'd like to clarify things.

Koen calls for action to move to new staging, BBCLASSEXTEND, nativesdk
etc, which IMHO is a good action.
However, if you want to keep older recipes this means that:
- they need to be converted too
- if they are converted one also need to test them if you are serious on quality
if you want to, be my guest. I'm just saying that I'm not going to
waste my time on this.

Personally I feel that if we want to focus on quality we better remove
the versions no one is interested in and focus our efforts, limited as
they are, on the remaining recipes.
And note that the old versions are still available in git. That is
what revision control systems are for.

Have fun! Frans



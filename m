Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PWyGJ-0002lr-2F
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Dec 2010 22:36:24 +0100
Received: by iwn8 with SMTP id 8so8550193iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Dec 2010 13:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=yiK8D5C2jz7vxPn3KBcLcrqDZu6iPyoLsVCyhvF9z9k=;
	b=USlBuSX6rz59zW82ORyazJkmDuXJaLJ+I9AYU8/Kg5itMqBg0TyJ2ganx3vB4sTCPG
	28jwMrfA2qAsH56o+WZYQLHD9+VrIG+WcVM6XqsFgaXqwOR1ERFXTXvtY5vdmr/7uPor
	3IHgfQkempHec6G9D9xxzyMOecpFO2w/4b1k0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wVzXhLjfU1n2NMrqbHP/IMc7rFOmZ/B45WRfQyc4510j7COa8AbtY/PQW7qbnqHOp2
	zmlh0hxB2j8O6FdICmK72eGeImnCptSowm/fGZnaT9pAZ22ddK6HKsAOU+xRKdUgIywX
	S2fcSqHcjs5wha5GQTovsvY0N+KC1dRW6aQmw=
MIME-Version: 1.0
Received: by 10.231.206.7 with SMTP id fs7mr4951437ibb.82.1293398960606; Sun,
	26 Dec 2010 13:29:20 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sun, 26 Dec 2010 13:29:20 -0800 (PST)
In-Reply-To: <1293394627-21453-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1293394627-21453-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Sun, 26 Dec 2010 22:29:20 +0100
Message-ID: <AANLkTikGHRK5=YnbhkVNwcwEm_=X_eg-Yg5bvrYfReon@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Sun, 26 Dec 2010 21:36:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oops, made a mistake with the patch, will resubmit

Frans



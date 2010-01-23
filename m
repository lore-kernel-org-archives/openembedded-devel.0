Received: from mail-iw0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYpd8-0003I2-9O
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 00:43:05 +0100
Received: by iwn5 with SMTP id 5so762315iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 15:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=fNZCPCZ9JDmE13FxYDQAcE+sVJyghzGVnnI0ufV2uKs=;
	b=F7WMXL3Ei+5ZOgDeUvJwXtQmq/AO4YPRy2L5ITfwn4WeHTmMmClXh1EkfW4NrDxCvz
	wYzYg2k9r6bTPS+z7eULEnB10wZ6A2hC83mb0scplNftFn83G+gKzR2BjCaVUsrtCXFD
	IMkG7X282r83ndpcXqgQHqoPr+I84ojxi1Zs8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZgKlBBbT316mDWB/Hqc3YgT1EBd11r7VjgNEvy6jtJ7xnNpUNn2WG87UQUVq+8msyl
	asaNbxmPg0uc/OuY0wmKOT1IUXsn7hKxv+qp6H+qPCwU51YXhpUz0T9x9Axl9f2wLD0x
	Lce0A6R/GSbtpmERp6Cv1DjMNbM856f/FAXGo=
MIME-Version: 1.0
Received: by 10.231.146.134 with SMTP id h6mr6162851ibv.16.1264290042778; Sat, 
	23 Jan 2010 15:40:42 -0800 (PST)
In-Reply-To: <201001231356.29728.holger+oe@freyther.de>
References: <201001230943.24210.holger+oe@freyther.de>
	<hjejrf$m65$1@ger.gmane.org>
	<201001231356.29728.holger+oe@freyther.de>
Date: Sat, 23 Jan 2010 15:40:42 -0800
Message-ID: <19c1b8a91001231540i7c8573aah13e5ccfbfa7dd290@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 23:43:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 23, 2010 at 4:56 AM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Saturday 23 January 2010 11:42:56 Koen Kooi wrote:
>
>> > 1.) Cherry pick from the branch
>> > 2.) Send updated patches, close the reports on patchwork...
>>
>> I think people that apply those patches to oe.dev should fix up the
>> commit message as well. The stack Khem pushed this week is just awfull.
>
yeah rebasing bit me in foot. my ammended commit messages did not make
it to repo because I did'nt  finish rebasing (git rebase --continue)
and pushed it. It would have been nice if git warned me about being in
the middle of rebase before pushing.



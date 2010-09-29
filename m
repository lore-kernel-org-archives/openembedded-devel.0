Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P13nf-0004jT-6z
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 23:02:51 +0200
Received: by iwn2 with SMTP id 2so1529892iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=bFHza32R8YZcADX28u1ulTnUiJ1REYNfDrywzVGykJk=;
	b=l4eHBJGZOz7weikw9fRMIE9t9k36roOaI9CdNmL3nUXQQUDk5304kSru0soHyqz0VG
	XWSoJJRSH+rWog1+QkmuuJXXD4whsKJaPI4+xKlQBBVNryF6adUbKLFf7BBXMgBlNIAs
	UO2KEzrWu3ESrRELekr1QXpfObKAIwrl16P1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=x4SI3BXfI4mH80mOgOdWaxkU09EFuIt2nnF+AUe7ar6fCwNh1RXT5joXnvt2HecdwF
	FGVT68MMbKOSTspgl4ipytG4FmsCYmLxrkTPDr3QYi9eSLeI5X2UlZqtdCZ+gibZarwc
	OhC23fE8QcsiZTFul4ZK4A0BfVhqpV4cmtPkA=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr2422635ibb.51.1285794155698; Wed,
	29 Sep 2010 14:02:35 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 14:02:35 -0700 (PDT)
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
Date: Wed, 29 Sep 2010 23:02:35 +0200
Message-ID: <AANLkTi=V7m+A0J37hu5DFZUKKBG9FzE9WYO13RPmrA9e@mail.gmail.com>
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
Subject: Re: [PATCH 00/18] Patches from opendreambox.org
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
X-List-Received-Date: Wed, 29 Sep 2010 21:02:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/29 Andreas Oberritter <obi@opendreambox.org>:
> Hello,
>
> in order to synchronize our work with upstream, I've prepared some
> patches. More patches will follow. You can cherry-pick or pull them
> from git, if you like:
>
> git://git.opendreambox.org/git/obi/openembedded.git for-upstream
>
> I'm submitting patches to OE for the first time, so please be patient
> if I've missed some guideline or the like.
>
> Best regards,
> Andreas

Thanks for your patches.
I've peeked into a few of them (mainly the cd and python related
ones). They look good. Will test them tomorrow (time permitting) and
if they are ok I'll ack & push them.
I hope someone else will pick up the patches I am not familiar with.

Frans.



Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>)
	id 1PEmYA-00016a-Mc; Sat, 06 Nov 2010 18:27:35 +0100
Received: by wwb13 with SMTP id 13so2364886wwb.24
	for <multiple recipients>; Sat, 06 Nov 2010 10:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LJA0//edSNSWPDRCUF4h+vyA7TN8Ro7wExbq62JLsiU=;
	b=MZew3g7/+4HsOpfRvaX6jGyFv7zwb1cr700r6zGh0us9QzrW7WZ7P9iGz668MVTts4
	hlcj/khZOk1jpnl/1bD6o1GQmwY0iXOJTlmUIyhcbMtI52zCyVy8Fpji1SKHbkNPjDs6
	KTbBAz9qd1BvrYh3uqEz0pA5DQenmDpAndfVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=StTgqjcRzsKRVVGnNezkVoAgDbWVW3zEBxOxopA3aj2YVMYtf70Pk9l0KYIWZ4EQfO
	2YsieIxogdzGQeQpKtFf85Z95aOUmr2IMhLSZRWdnKYUCxa9srQk27gB9cYVYBFsRJI/
	IxZ7F7lC0vOqfw6SBubvY7iSdcN/nEtl1dExs=
MIME-Version: 1.0
Received: by 10.216.132.131 with SMTP id o3mr3513598wei.19.1289064399189; Sat,
	06 Nov 2010 10:26:39 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Sat, 6 Nov 2010 10:26:39 -0700 (PDT)
In-Reply-To: <1288973274.28481.15978.camel@rex>
References: <1288973274.28481.15978.camel@rex>
Date: Sat, 6 Nov 2010 13:26:39 -0400
Message-ID: <AANLkTi=9baSJYxwULah-FNS50gaK9bhF=aBG-4-ChrrP@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-members@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Sat, 06 Nov 2010 17:27:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2010 at 12:07 PM, Richard Purdie <rpurdie@rpsys.net> wrote:

> So what do I mean by hard? First there are the conversations with your
> legal department where some questions arise:
>
> * How do you ensure license compliance?
> * When someone makes a change, how do you know the license is still
> =A0correct?
> * You've mixing GPLv2 and v3? How are you ensuring no contamination?
> <cue a long discussion which I'd bet most companies have>

Is GPLv3 the issue here with patent, DMC, and Tivoization issues?  Is
the solution to simply not have GPLv3 software in a device?

Are there other license issues that companies are worried about?

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com



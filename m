Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OdeOn-0000Ib-Pg
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:16:28 +0200
Received: by bwz10 with SMTP id 10so3346676bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0Wo3JesvXzkG1cPUcKS5UAjFju+KcPkLgQSUzIq9/Hs=;
	b=Qx/qn5Rbe0j4L+6JJE9eM7oITH5rE4GYf/3M9hQGCkbinlvYSzSRADIHS+li8U6liv
	3XRsEOEsCaKwdXbduwVCucZia9ckg7ly99DUbdKGwi0DtpbDdhjN6iBd+FqzUutkIWG0
	kF+CTzrTkQqq6oUzznA+89QW/F46O+Oq69/XM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Red9AbgyADIxRRE+eklyYyzKiCnIMepFEje4K+m+SqbmZxUQc9gRuHp/B5A57z564v
	qgGKYC1j2g4avFJaATbVF2ExEml73yAI4lDv80SAroTfQTRT7GTqIdFQ5ZTaf3T/wSGw
	Rhf2cU5ryhQu9fDmctcTVsR6aC2w3r9R2uVe0=
MIME-Version: 1.0
Received: by 10.204.115.203 with SMTP id j11mr6281491bkq.147.1280214963120; 
	Tue, 27 Jul 2010 00:16:03 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 27 Jul 2010 00:16:03 -0700 (PDT)
In-Reply-To: <4C4E52BD.1080108@mlbassoc.com>
References: <4C4E4DB2.9090606@mlbassoc.com>
	<AANLkTikRqVrJ6uS9njZm9CWW8FkVJZyZ6MbbOQ=BQuCQ@mail.gmail.com>
	<4C4E52BD.1080108@mlbassoc.com>
Date: Tue, 27 Jul 2010 09:16:03 +0200
Message-ID: <AANLkTi=7Yb6QobZXkC+FbGr8yiya=8ubsr2iyZoUJaiM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Checkin policy??
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
X-List-Received-Date: Tue, 27 Jul 2010 07:16:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/27 Gary Thomas <gary@mlbassoc.com>

> On 07/26/2010 09:17 PM, Chris Larson wrote:
>
>> On Mon, Jul 26, 2010 at 8:08 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>>
>>  Surely, there must not be any or else simple compile errors wouldn't get
>>> through :-(
>>>
>>>
>> It's a trunk/master branch, shit happens, and it's not reasonable to test
>> every recipe for every target for each commit.  In addition, in this
>> particular case, it's highly unlikely a review would have caught this
>> error
>> anyway.  Fix incoming.
>>
>
> Fair enough, but it shows the need for something in between the
> "stable" angstrom/2009 tree which is incredibly stale and the
> absolute bleeding edge which changes hourly and is often too
> unstable to use.
>

Do I hear a volunteer here ????

>
> Thanks for the quick fix (testing now)
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


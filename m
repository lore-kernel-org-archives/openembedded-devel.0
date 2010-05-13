Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OCcir-0003u3-LQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 20:01:27 +0200
Received: by pxi14 with SMTP id 14so814407pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OidpKKICe7aNWeW/T7QqFkwI/15T/P4rmLpGkVxIB4o=;
	b=DEy6c2vhMNF60AXseL89/dq1vuNkE6ola3aKQBSrNr16oNwWVcD2c4ymeC7tKceAi+
	kgEvKTwcBsFy9GBdC6aiC3orXVdXB9wrjwdLScDkr5s5PQLpTnVqAcJA9uY0cmSkgdCy
	LjVrnV0HMA/orcv0G+biu17KfGnTyP/pj61ZY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PhE9o9PGsgtx+5y+8KgInxWBGGNBf00i729FFB7OMi7ZgwFyBcLpOMOdh9mPtXNsSy
	uEi70PRqGNI5wix3J9YyfY1j1lxjiQXazwaF5Cn9ECwoix6wJeyWDfEsgp6N1NT5KkCl
	7rASK251VCp5B9dB64n7EJM3j7vetcbCjLPcs=
MIME-Version: 1.0
Received: by 10.143.26.21 with SMTP id d21mr6607423wfj.225.1273773449310; Thu, 
	13 May 2010 10:57:29 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Thu, 13 May 2010 10:57:28 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1005131212200.11789@lynx>
References: <alpine.DEB.2.00.1005131147350.2007@lynx>
	<4BEC241A.2090802@eukrea.com>
	<alpine.DEB.2.00.1005131212200.11789@lynx>
Date: Thu, 13 May 2010 10:57:28 -0700
Message-ID: <AANLkTikmU6fbniORwgp86_hFk9khRLDsG5BllWGVtYm8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: chance to document entire OE setup on ubuntu 10.04
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
X-List-Received-Date: Thu, 13 May 2010 18:01:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2010 at 9:13 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> On Thu, 13 May 2010, Eric B=E9nard wrote:
>
>> Le 13/05/2010 17:53, Robert P. J. Day a =E9crit :
>> >
>> > =A0 =A0while this sounds decidedly unsexy, given that i'm just getting
>> > into ubuntu 10.04, i have the chance to document every step it
>> > takes to setup OE on a fresh, default 10.04 install, including
>> > what packages are *actually* required since i suspect some of the
>> > ones currently listed aren't technically necessary.
>> >
>> I tested yesterday on a 10.04 and vs the actual wiki, I think chrpath is
>> missing from the list of what is required.

this is a newly created dependency probably hasn't made into documents yet
but sanity should complain about it if its missing.

Thx
-Khem



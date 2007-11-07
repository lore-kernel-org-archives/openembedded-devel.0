Received: from [66.249.82.237] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ipy2G-0003ir-SY
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2007 04:26:29 +0100
Received: by wx-out-0506.google.com with SMTP id h27so30994wxd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2007 19:25:33 -0800 (PST)
Received: by 10.90.104.14 with SMTP id b14mr5615782agc.1194472237044;
	Wed, 07 Nov 2007 13:50:37 -0800 (PST)
Received: by 10.90.66.15 with HTTP; Wed, 7 Nov 2007 13:50:36 -0800 (PST)
Message-ID: <c384c5ea0711071350i5533901cuf22da42e78b25dfb@mail.gmail.com>
Date: Wed, 7 Nov 2007 22:50:36 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4731B63E.6030806@student.utwente.nl>
MIME-Version: 1.0
References: <E1IpXlZ-0004u8-1Y@linuxtogo.org>
	<74d0deb30711070226u29479070te5f20880b1616aac@mail.gmail.com>
	<4731B63E.6030806@student.utwente.nl>
Subject: Re: [oe-commits] org.oe.dev rm_work: only remove ${S}, leave temp and install alone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2007 03:26:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

On 11/7/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> pHilipp Zabel schreef:
> > On 11/7/07, koen commit <openembedded-commits@lists.openembedded.org> wrote:
> >> rm_work: only remove ${S}, leave temp and install alone
> > Why? Leaving image/ and install/ alone seriously decreases rm_work's
> > space saving powers.
> It does, but it's needed for our new packaged-staging frameworks, and I
> did mention this change two weeks ago (20071027) on oe-devel ml and
> noone objected[*].
> Koen
>
> [*] read: "no response at all", which I have started interpreting as
> "You rock! Go ahead!".
>
You rock! Go ahead!

Disk space: $1/GB
Packaged staging: priceless :-)

Regards,

Leon.



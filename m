Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OWorN-0001vm-I2
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 13:01:42 +0200
Received: by iwn34 with SMTP id 34so766201iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 03:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=N4lwu4n61TJ9+9hMiZOcnUhpSYT+qghYdWLRxiubocE=;
	b=Bm2oucZX25s7YQoaQAOfzOZYHdAfJWXPCXjj1e39nqi+0EDXW3YAvc7r6U2qb/fHDe
	Xer/xU6OSwZUMx1SryLNyV7N2sDa7VP+lM7JDnekjo5lLf/WurkLTQayc8Qus1YsMiZZ
	dENYbxqCNUdIU5/hugDBbo/jQaUfbGCXSDxLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=I11Y9E2tXhsLbgXHLk4/WugaaMwNMKJmDD9ZHi6uM8h57PPods0OkcSSl7gZs6yrtW
	mYSkggl2OfZKoN6soEHdqOmTAjgmxHQAvosPe4SDIvKHVikjWfp2y3wK5CEd8n//l0H1
	M/M0V6XDy6FGJGqN025Ll9aP4F3QL84Y5Ke9A=
MIME-Version: 1.0
Received: by 10.231.166.9 with SMTP id k9mr5423690iby.127.1278586610679; Thu, 
	08 Jul 2010 03:56:50 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Thu, 8 Jul 2010 03:56:50 -0700 (PDT)
In-Reply-To: <i147lg$nh3$1@dough.gmane.org>
References: <4C356475.2060208@gmail.com>
	<i147lg$nh3$1@dough.gmane.org>
Date: Thu, 8 Jul 2010 20:26:50 +0930
Message-ID: <AANLkTik3s07aFzoyv-eJ99d9Wdezdn-iWEBRiuHlfnU2@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Badness with -ibad, a replacement for 	zecke-no-host-includes.patch.
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
X-List-Received-Date: Thu, 08 Jul 2010 11:01:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 July 2010 19:31, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08-07-10 07:39, Graham Gower wrote:
>> This patch introduces a new command line parameter to gcc (at
>> Zecke's suggestion), -ibad
>
> It gets bonus point for being an obscure Dune reference :)

I think I lose the bonus points, as I don't understand the reference :(



Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1HXwqs-00056Z-PK
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Apr 2007 11:59:58 +0200
Received: from [192.168.1.23] (44.84-48-58.nextgentel.com [84.48.58.44])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id D793B1BF267
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Apr 2007 12:00:00 +0200 (CEST)
From: =?iso-8859-1?q?=D8yvind_Repvik?= <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 1 Apr 2007 11:59:51 +0200
User-Agent: KMail/1.9.5
References: <E1HXnn8-0007Dx-JK@linuxtogo.org>
	<460F5F87.3060403@dominion.kabel.utwente.nl>
In-Reply-To: <460F5F87.3060403@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200704011159.52186.repvik@kynisk.com>
Subject: Re: [oe-commits] org.oe.dev prismstumbler: add 0.7.4pre1
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
X-List-Received-Date: Sun, 01 Apr 2007 09:59:58 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 01 April 2007 09:30, Koen Kooi wrote:
> florian commit schreef:
> > prismstumbler: add 0.7.4pre1
> >
> >
> > packages/prismstumbler/prismstumbler_0.7.4pre1.bb
>
> That is against our versioning policy, this way you can't upgrade to 0.7.4
> when it gets released[1]. Use _0.7.3+0.7.4pre1 instead.

A semi-related question. Where is this policy? There is apparently a bunch =
of=20
policies that I am unaware of, and I'd like a pointer to them.

=D8yvind



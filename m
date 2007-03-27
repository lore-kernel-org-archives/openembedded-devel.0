Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1HW9co-00089r-HC
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2007 13:14:02 +0200
Received: from [192.168.1.23] (54.84-48-194.nextgentel.com [84.48.194.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id 4ADBA1BF29C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 13:14:04 +0200 (CEST)
From: =?utf-8?q?=C3=98yvind_Repvik?= <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2007 13:13:57 +0200
User-Agent: KMail/1.9.5
References: <4608D065.3060205@whitby.id.au>
	<200703271300.59292.openembedded@hrw.one.pl>
In-Reply-To: <200703271300.59292.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200703271313.57267.repvik@kynisk.com>
Subject: Re: Alternatives handling for cpio (cpio vs busybox)
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
X-List-Received-Date: Tue, 27 Mar 2007 11:14:03 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 27 March 2007 13:00, Marcin Juszkiewicz wrote:
> Dnia wtorek, 27 marca 2007, Rod Whitby napisa=C5=82:
> > I propose to change the cpio package such that it installs cpio in /bin
> > instead of /usr/bin, and then uses update-alternatives to select it
> > ahead of busybox.
>
> +1 from me - Debian store cpio in /bin/

Go from me too.

=C3=98yvind



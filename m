Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk3ny-00074O-5Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 00:04:42 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk3lH-0002XL-Mc from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 15:01:51 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 15:01:51 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 23:01:50 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 16:01:50 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1266965542.2555.14.camel@andromeda>
References: <1266951776.18176.47.camel@trini-m4400>
	<1266965542.2555.14.camel@andromeda>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 16:01:50 -0700
Message-ID: <1266966110.18176.222.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 23:01:51.0434 (UTC)
	FILETIME=[2F6392A0:01CAB4DC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Tue, 23 Feb 2010 23:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 23:52 +0100, Michael 'Mickey' Lauer wrote:

> Ah, finally someone does something about it. Next step would be to dump
> tinylogin which is known broken and use busyboxes login utilities
> instead.

Not wanting to open that can of worms up just yet, yes, this will let
distros opt in to that kind of thing (I hit this because of 'su' the
other day..).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation



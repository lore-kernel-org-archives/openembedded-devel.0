Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nu4Z7-0006sH-Pd
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 14:54:42 +0100
Received: from keemun.localnet (unknown [192.168.1.125])
	by mail.altell.local (Postfix) with ESMTPS id 2F49F687B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 16:51:19 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 16:51:15 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003182212.31873.roman@khimov.ru>
	<201003190023.36525.roman@khimov.ru>
	<201003200005.35468.roman@khimov.ru>
In-Reply-To: <201003200005.35468.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <201003231651.15210.khimov@altell.ru>
X-Altell-MailScanner-ID: 2F49F687B0.C4786
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Tue, 23 Mar 2010 13:54:42 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 20 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 00:05:35 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> I think I need some ACK's for dusty old Perl versions removal and then
> Richard's Perl staging update could be merged better on top of that (CC'i=
ng
> Richard) and than I'll update 5.10.1 to new staging and push the series. =
At
> least, that's how I think it should be. If there are any problems with
>  staging update and it's not ready to be pushed in OE.dev, I think we can
>  merge 5.10.1 as it is now.

OK, I think I'm pushing 5.10.1 as is some hours later and Richard could por=
t=20
his staging changes when ready.



Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1NtfXM-0002sB-PL
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:13 +0100
Received: from keemun.localnet (unknown [192.168.1.125])
	by mail.altell.local (Postfix) with ESMTPS id 5DEBD68778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:42:56 +0300 (MSK)
From: Roman Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 14:07:48 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100224171832.GA20737@mx.loc> <20100305205357.GE7868@mx.loc>
In-Reply-To: <20100305205357.GE7868@mx.loc>
MIME-Version: 1.0
Message-Id: <201003221407.48841.khimov@altell.ru>
X-Altell-MailScanner-ID: 5DEBD68778.3E9FF
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:13 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 05 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 23:53:57 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard Reutner-Fischer=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Wed, Feb 24, 2010 at 06:18:32PM +0100, Bernhard Reutner-Fischer wrote:
> >On Mon, Feb 22, 2010 at 11:45:43PM +0100, Bernhard Reutner-Fischer wrote:
> >>On Mon, Feb 22, 2010 at 05:06:21PM -0500, Denys Dmytriyenko wrote:
> >>>> Not using "archive" as Martin likes as default, but uri%d, but
> >>>
> >>>For multiple SRC_URIs, using uri1/uri2 can be more confusing and may be
> >>> not much better than looking up real names in .inc file...
> >>
> >>ok, so let's drop that superfluous .note and the url%d handling.
> >>Other opinions?
> >
> >I'm using this now, fwiw.
>=20
> ping?

Acked-by: Roman I Khimov <khimov@altell.ru>



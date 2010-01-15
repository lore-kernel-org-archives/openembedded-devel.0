Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <christian.rueb@gmx.net>) id 1NVk04-0001hA-1d
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 12:05:59 +0100
Received: (qmail invoked by alias); 15 Jan 2010 11:03:43 -0000
Received: from p4FD61FB1.dip0.t-ipconnect.de (EHLO krusty.localnet)
	[79.214.31.177]
	by mail.gmx.net (mp020) with SMTP; 15 Jan 2010 12:03:43 +0100
X-Authenticated: #19296456
X-Provags-ID: V01U2FsdGVkX18Z9/58+pcZQ61AOXOEyXcIP6Yt5CpXDmqa6xyG+O
	DaYHq6/Noz9r1U
From: Christian =?utf-8?q?R=C3=BCb?= <christian.rueb@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 12:03:38 +0100
User-Agent: KMail/1.11.4 (Linux/2.6.28-11-generic; KDE/4.2.4; i686; ; )
References: <1263504944-19914-1-git-send-email-christian.rueb@gmx.net>
	<201001150930.06815.christian.rueb@gmx.net>
	<hipb02$a6m$1@ger.gmane.org>
In-Reply-To: <hipb02$a6m$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001151203.38856.christian.rueb@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.60999999999999999
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: christian.rueb@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wpa-gui: add version 0.6.9 (Qt4 based)
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
X-List-Received-Date: Fri, 15 Jan 2010 11:05:59 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday, 15. January 2010 10:02:59 Koen Kooi wrote:
> On 15-01-10 09:30, Christian R=C3=BCb wrote:
> > On Friday, 15. January 2010 09:22:28 Koen Kooi wrote:
> >> On 14-01-10 22:35, Christian R=C3=BCb wrote:
> >>> This is version 0.6.9 of wpa-gui (Qt4), not the old one. If you think=
 the package should be named qpa-gui-qt4, please tell me.
> >>> The stylesheet is made for SHR only as the application does not fit t=
he screen otherwise (font way to big).
> >>
> >> Why is the icons.patch shr specific? It seems to fix a generic problem.
> >>
> >> regards,
> >>
> >> Koen
> >
> > You are right - I will send a new patch tonight. Is it OK otherwise?
>=20
> Apart from it not being in git-format-patch format, yes.

Actually I used git format-patch (with option -p to not generate stats - do=
 you want stats) to create the patch...



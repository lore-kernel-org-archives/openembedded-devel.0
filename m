Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Jbcur-0004ps-1n
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 15:35:54 +0100
Received: (qmail 26022 invoked by uid 813007); 18 Mar 2008 14:35:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 18 Mar 2008 14:35:45 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Mar 2008 15:35:38 +0100
User-Agent: KMail/1.9.9
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<200803180849.21108.geoffrey@pager.net>
In-Reply-To: <200803180849.21108.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200803181535.40639.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 14:35:55 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Tuesday 18 of March 2008, Geoffrey Wossum napisa=B3:

> I understand that opkg is a fork of ipkg, since ipkg was unmaintained.=20
> But could someone explain what, if anything, this means to me as
> someone currently building a product using OpenEmbedded for the
> underpinning?

Two things comes to my mind:

=2D "opkg" instead of "ipkg" command=20
=2D few libraries more (gpgme + pth) as opkg require them (can be disabled)


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

              there are actually only 10 web sites out there,
              all the others are rearranged copies





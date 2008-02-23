Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JT2O7-00011m-Qt
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Feb 2008 22:58:33 +0100
Received: by an-out-0708.google.com with SMTP id b33so203708ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2008 13:58:13 -0800 (PST)
Received: by 10.100.131.3 with SMTP id e3mr2245205and.49.1203803893158;
	Sat, 23 Feb 2008 13:58:13 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id 2sm572207nfv.5.2008.02.23.13.57.53
	(version=SSLv3 cipher=OTHER); Sat, 23 Feb 2008 13:58:01 -0800 (PST)
Date: Sun, 24 Feb 2008 00:00:31 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080224000031.363e2031@widy.localdomain>
In-Reply-To: <200802232241.01317.openembedded@haerwu.biz>
References: <1203793457.8255.5.camel@dax.rpnet.com>
	<fppt2j$thh$1@ger.gmane.org>
	<20080223223439.528c6997@widy.localdomain>
	<200802232241.01317.openembedded@haerwu.biz>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.242
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Uppercase overrides and parsing speed
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
X-List-Received-Date: Sat, 23 Feb 2008 21:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, 23 Feb 2008 22:40:59 +0100
Marcin Juszkiewicz <openembedded@haerwu.biz> wrote:

> Dnia Saturday, 23 of February 2008, Paul Sokolovsky napisa=C5=82:
> > Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>=20
> > > Didn't we also agree that variable names shouldn't include '_' at
> > > all?
> >
> > How is that achievable? LETSUSEITLIKETHIS? Maybe exclude 'A'
> > too? ;-)
>=20
> LETS-USE-IT-LIKE-THIS was one of suggestions.

And still, rethinking the override marker is another choice, with a dot
being obvious candidate. Both syntaxes can be made coexist in
bitbake for some time, and transition made gradual.

>=20
> --=20
> JID: hrw-jabber.org
> OpenEmbedded developer/consultant
>=20
[]

--=20
Best regards,
 Paul                          mailto:pmiscml@gmail.com



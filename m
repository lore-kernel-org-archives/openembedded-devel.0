Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtIW5-0008Dq-M0
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 14:13:09 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	14:08:32 +0200
Date: Tue, 16 Aug 2011 14:08:43 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110816120843.GG22184@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1313486613.git.anders@chargestorm.se>
	<e0ebd62ce3368f4005276160fca96c5059c94f75.1313486613.git.anders@chargestorm.se>
	<1313490197.3496.29.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1313490197.3496.29.camel@mattotaupa>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH 2/2] ckermit: update to version 9.0
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
X-List-Received-Date: Tue, 16 Aug 2011 12:13:09 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Paul Menzel <paulepanter@users.sourceforge.net> [110816 12:23]:
> Am Dienstag, den 16.08.2011, 11:24 +0200 schrieb Anders Darander:
> > ---
> >  meta-oe/recipes-support/ckermit/ckermit_211.bb |   98 ----------------=
--------
> >  meta-oe/recipes-support/ckermit/ckermit_301.bb |   58 ++++++++++++++
> >  2 files changed, 58 insertions(+), 98 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/ckermit/ckermit_211.bb
> >  create mode 100644 meta-oe/recipes-support/ckermit/ckermit_301.bb

> Please pass `-M -M -C -C -C`(?) to `git format-patch` to make reviews
> easier.

-M40 seemed to do it this time. The main question is where to put that
threshold between seeing a rename or an add/delete-pair. I might make a
suggestion in a patch for the create-pull-request script in oe-core.

> > diff --git a/meta-oe/recipes-support/ckermit/ckermit_301.bb b/meta-oe/r=
ecipes-support/ckermit/ckermit_301.bb

> The version numbers seem quite confusing. Why is this 9.0? But that is
> an upstream problem.

I agree that they are using a really confusing version numbering
scheme... Unfortunately, that's something we'll have to live with.

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Laxholmstorget 3	Email: anders@chargestorm.se
602 21 Norrk=F6ping	Web: www.chargestorm.se



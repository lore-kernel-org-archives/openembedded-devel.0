Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LpL5J-0002cZ-Qg
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 13:28:10 +0200
Received: (qmail 15241 invoked by uid 813007); 2 Apr 2009 11:25:24 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Apr 2009 11:25:24 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Apr 2009 13:25:11 +0200
User-Agent: KMail/1.11.0 (Linux/2.6.29; KDE/4.2.1; x86_64; ; )
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
	<d2b9ea600904020352v79eda72fk2fde69139ac29e10@mail.gmail.com>
In-Reply-To: <d2b9ea600904020352v79eda72fk2fde69139ac29e10@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904021325.22988.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Thu, 02 Apr 2009 11:28:19 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 2 kwietnia 2009 o 12:52:51 Esben Haabendal napisa=C5=82(a):
> On Tue, Mar 31, 2009 at 6:37 PM, Marcin Juszkiewicz
>
> <marcin@juszkiewicz.com.pl> wrote:
> > I also imported BitBake 1.8.12 (last release) into "stable/2009"
> > branch as this is minimal stable version which works with this
> > repository.
>
> Is this the new strategy for handling depedency on specific versions
> of BitBake?

No, but we require minimal versions of BitBake to be used with OE=20
metadata so I prefer to have version which is granted to work. Imagine=20
situation when OE.dev will require BitBake 1.8.22 which will not work=20
with 'stable/2009' branch.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz





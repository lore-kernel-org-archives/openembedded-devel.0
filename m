Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H4daa-00054n-19
	for openembedded-devel@openembedded.org; Wed, 10 Jan 2007 14:34:00 +0100
Received: (qmail 26936 invoked by uid 813007); 10 Jan 2007 13:32:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 10 Jan 2007 13:32:08 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2007 14:32:06 +0100
User-Agent: KMail/1.9.5
References: <200701081618.46665.openembedded@hrw.one.pl>
	<200701092322.34825.openembedded@hrw.one.pl>
	<eo2o1a$9v4$1@sea.gmane.org>
In-Reply-To: <eo2o1a$9v4$1@sea.gmane.org>
MIME-Version: 1.0
Message-Id: <200701101432.06542.openembedded@hrw.one.pl>
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Wed, 10 Jan 2007 13:34:00 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 10 stycznia 2007 14:00, Rolf Leggewie napisa=B3:
> Marcin Juszkiewicz wrote:
> >> Do I see signs of collie being supported in angstrom?
> >
> > If collie will meet common rules then yes.
> >
> > Common rules:
> >
> > - 2.6 kernel
>
> but still no SD, right?

What does rule 'Machine must have working 2.6 kernel' has to do with SD?=20
There are machines which run Angstrom which does not have SD slot.

> > - atleast 2 machine mentors in Angstrom
> > - usable for users
> >
> > Currently collie meet only first...

> What is the status on the last two? =20

> What is necessary to become machine mentor?=20

Contact Angstrom maintainers, test machine images, help fixing bugs and=20
improve machine support.

> What is not usable for users in collie angstrom?=20

There is no MMC/SD support, few other things are not finished in 2.6 port=20
too. Before those get fixed collie is unusable for users.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           Despair is just another word for 'not enough coffee'=20
           		Wally





Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JZZml-0006FC-Ke
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 23:51:02 +0100
Received: from localhost ([127.0.0.1]) by mx01.dls.net with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JZZkh-0002n6-Li
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 17:48:51 -0500
MIME-Version: 1.0
X-Mailer: AtMail PHP 5.2
Message-ID: <1718.1205362131@dls.net>
To: <openembedded-devel@lists.openembedded.org>
X-Origin: 209.242.5.110
Date: Wed, 12 Mar 2008 17:48:51 -0500
From: Mike Westerhof <mwester@dls.net>
X-SA-Exim-Connect-IP: 216.145.245.197
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 22:51:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

 On Wed 12/03/08  5:32 PM , Paul Sokolovsky pmiscml@gmail.com sent:
> Hello,
>=20
> On Wed, 12 Mar 2008 23:07:03 +0100
> "Leon Woestenberg" le
> on.woestenberg@gmail.com> wrote:
> > Hello Paul,
> >=20
> > On Wed, Mar 12, 2008 at 10:40 PM, Paul Sokolovsky pmiscml@gma
> il.com>> wrote:
> > >  mirroring, but Monotone with its super-cool concept
> of unbelievably> >  cheap branches (so-called heads), make it just well
> robust - even> > if
> > >
> > Multiple heads and lightweight branches are two
> different things.
> Probably also because of different numbers of hexadecimal digits?
>=20
> >=20
> > A branch has a name/tag that tells me what is happening
> in that branch> or who is making it happen.
>=20
> And heads have head revision and change logs too!
>=20
> >=20
> > In contrast, multiple heads does not help me in any way
> as a tool for> branching, nor can I easily track someone else's work
> in his "head".
> That's because you've stuck with that old and boring concept of
> "lightweight branches". People who grasped heads novelty enjoy it very
> much. Well, the same can be said about the people who didn't drop
> everything to endeavor into those "lightweight branches" - they enjoy
> classy branches with not the lesser passion than the other two groups.
>=20
>=20
> Well, but the talk was about mirroring and syncing potentially
> incompatible changes. Do lightweight branches help with this?
>=20
> >=20
> > Regards,
> > --=20
> > Leon
>=20
> []
>=20
>=20
> --=20
> Best regards,
> Paul                          pmiscml@gma
> il.com

I think this has gotten to the point where the arguments is for the sake of=
 arguing, and little else.  I'm surprised that it hasn't been mentioned tha=
t "hg" has the advantage that its name is only two characters, a 33% saving=
s in overhead compared to most other scm tools we've discussed.


So, who makes this decision, and what's the timeframe?

Mike  (mwester)

Oh - btw, lightweight branching implies working, reliable tools to identify=
 diffs and merge them, that's the part that really needs to be considered r=
ather than how easy it is to just create a branch.





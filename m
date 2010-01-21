Received: from wam.ukma.de ([188.40.105.250])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mattheis@ukma.de>) id 1NXzIM-0007kj-Op
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 16:50:09 +0100
Received: from wam.ukma.de (localhost [127.0.0.1])
	by wam.ukma.de (Postfix) with ESMTP id D365649D44
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 16:47:06 +0100 (CET)
Received: from ws.ukma.de (ws.ukma.local [172.16.20.10])
	by wam.ukma.de (Postfix) with ESMTP id BEACE49D43
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 16:47:06 +0100 (CET)
Received: from ws.ukma.de ([172.16.20.10]) by ws ([172.16.20.10]) with mapi;
	Thu, 21 Jan 2010 16:49:35 +0100
From: Konrad Mattheis <mattheis@ukma.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Jan 2010 16:49:34 +0100
Thread-Topic: [oe] Getting patches committed
Thread-Index: Acqalqlq/Ks0I1bERmK3TBqH5niZWAAFmttQ
Message-ID: <F32E8C2599F37641BB4E3F3AC4A3C412016E27723992@ws>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<4B584559.1090704@balister.org> <201001211336.27857.ml@vdm-design.de>
In-Reply-To: <201001211336.27857.ml@vdm-design.de>
Accept-Language: de-DE, de-LU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE, de-LU
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 188.40.105.250
X-SA-Exim-Mail-From: mattheis@ukma.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 15:50:09 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> On 01/21/2010 05:20 AM, Dr. Michael Lauer wrote:
> > Am 21.01.2010 um 11:02 schrieb Holger Hans Peter Freyther:
> >>> 2. Is there a way to have a staging branch where all patches are
> >>> committed to, which have not been reviewed for let us say one week, t=
o
> >>> get more testing and before they go into the dev branch? Maybe it is
> >>> easier for people to at least test build such a branch?
> >>
> >> Would you be interested in creating such a branch for us? I assume it =
is
> >> certainly easier to git cherry-pick a patch than to download the mbox
> >> and use git am..
> >
> > I fully agree. I'm neither using patchwork nor do I find patches on the
> > list a good idea. I'd welcome for-oe-upstream trees that would contain
> > patches that -- if good -- we could just pull from.
>=20
> I actually like patches on the list, because it makes me aware of how is
> doing work and keeps me aware of the kinds of things people without
> commit access are interested in. Also, it gives people with commit
> access a forum for changes they would like reviewed.
>=20
> I am not opposed to someone creating a git branch or branches created
> from list patches, but do not want to see the patches disappear from the
> list.
>=20
> If the patch that was sent to the list comes from git-send-patch (I hope
> I hve that correct) there is a script contrib/patchwork/git-am.sh that
> makes it really easy to apply the patch.
>=20
> Philip

>I'm one of those without commit rights :)
>And i think the problem is, that nobody feels responsible for the patches =
on=20
>patchwork. I know this situation from SHR patchwork, when you don't ask=20
>someone directly to commit a patch from patchwork, nobody will do it.
>That's the only way it really works currently.
>I have 4 people with commit rights i can ask, so i have no problems but ot=
hers=20
>probably doesn't know someone...

I'm in the same situation. Till now I only changed things in my own copy
of the tree, because I don't understand how the patching is working. For ex=
ample
I read a lot of patches which are send to the mailing list, but no
discussion, no NACK or ACK.=20
I also working on u-boot and this development mailing list is complete
different. If I send a patch to the list I get in less than 2 days an
answer. And then the patch is discussed it always ends with a ACK or NACK.

> I think a sort of moderator for patchwork is needed,
> that associates patches to the maintainer.
yes ! and also more discussions about

Konrad



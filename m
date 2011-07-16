Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>)
	id 1Qi5sl-0004mB-6b; Sat, 16 Jul 2011 16:30:15 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LOF0050PHAVWSA0@vms173005.mailsrvcs.net>; Sat,
	16 Jul 2011 08:25:45 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 16FE58; Sat, 16 Jul 2011 08:25:40 -0500
Received: from [192.168.1.13] by rkmorris.us with HTTP; Sat,
	16 Jul 2011 08:25:38 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Sat, 16 Jul 2011 08:25:38 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1310822738895594500@rkmorris.us>
In-reply-to: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
References: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 2
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Populating meta-oe with new patches on oe.dev
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
X-List-Received-Date: Sat, 16 Jul 2011 14:30:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

My apologies for the dumb question, but I admit that I don't know the answ=
er, so ...

=20

Can someone explain the differences between oe-core and OpenEmbedded, and =
in particular the various git repositories? I ask because I'm struggling to=
 get OE running on my h1940 (using openembedded), but I have a feeling that=
 this may be the wrong repository to use ... but I just don't know ... :-(.=
 I'm also not sure which ones are being worked on going forward (as I would=
 like to submit changes once I get things working, but again don't know whi=
ch repository is the right one).

=20

Thanks in advance for your help!

=20

... Russell

=20



On Fri, 07/15/2011 04:42 PM, Khem Raj <raj.khem@gmail.com> wrote:


>=20
Hello
>=20
> As we all know that next release of OpenEmbedded is slated based on
> oe-core, I would like to request submitters and committers of
> the patches for oe.dev to port the patches to meta-oe or any other
> layer that is suitable for a given patch. Any new recipes
> being added to oe.dev should definitely go into the new layered structur=
e
>=20
> Please follow the commit guidelines for meta-oe/oe-core and submit the
> appropriate pull requests so that when we cut out the next release we
> don't miss any of those patches.
>=20
> Thanks for your cooperation and help
>=20
> -Khem
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From openembedded@rkmorris.us Sat Jul 16 16:30:15 2011
Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>)
	id 1Qi5sl-0004mB-6b; Sat, 16 Jul 2011 16:30:15 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173005.mailsrvcs.n=
et
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LOF0050PHAVWSA0@vms173005.mailsrvcs.net>; Sat,
	16 Jul 2011 08:25:45 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 16FE58; Sat, 16 Jul 2011 08:25:40 -0500
Received: from [192.168.1.13] by rkmorris.us with HTTP; Sat,
	16 Jul 2011 08:25:38 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Sat, 16 Jul 2011 08:25:38 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1310822738895594500@rkmorris.us>
In-reply-to: <CAMKF1spOJJP

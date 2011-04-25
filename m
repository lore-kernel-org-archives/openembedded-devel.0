Received: from mx03.stofanet.dk ([212.10.10.13])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QERlD-0005RK-Dq for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:47:55 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx01.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QERYR-0006cm-1W
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:34:43 +0200
Received: from phoenix.localnet (unknown [192.168.0.226])
	by asrock (Postfix) with ESMTPS id 133B781DEF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 21:34:43 +0200 (CEST)
From: =?iso-8859-15?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 21:34:42 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <1303725452-1908-1-git-send-email-sgh@sgh.dk>
	<201104251229.57261.sgh@sgh.dk>
	<1303743329.15311.29.camel@mattotaupa>
In-Reply-To: <1303743329.15311.29.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201104252134.42402.sgh@sgh.dk>
Subject: Re: [PATCH] wvstreams: Added recipe for wxstreams 4.6.1.
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
X-List-Received-Date: Mon, 25 Apr 2011 19:47:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Is there a document describing the workflow around patchwork?
I'm a bit lost as to how it is supposed to work.

Mandag den 25. april 2011 16:55:29 skrev Paul Menzel:
> Am Montag, den 25.04.2011, 12:29 +0200 schrieb S=F8ren Holm:
> > I will edit the recipe a bit. It is just a copy of the 4.6.0 recipe.
>=20
> Please pass `-M -C -C` to `git format-patch` next time, so that copies
> or renames are detected.
>=20
> Please also add what build configurations you used for testing next
> time. I have build 4.6.1 successfully in several configurations and I
> pushed your patch [1].
>=20
> Please update the patch queue [2] using the Web interface or the
> following command.
>=20
> 	$ pwclient update -s Accepted -c aaf30cc3e147816c63e694ef65951b3cd2dc48c=
5 2815
>=20
> Your earlier message was also recorded, so you could do something like
> the following.
>=20
> 	$ pwclient update -s Superseded 2813
>=20
> Please post a follow up patch (in a new thread) addressing the things
> Koen pointed out.
>=20



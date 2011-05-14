Received: from mx03.stofanet.dk ([212.10.10.13])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QL2tA-00043O-1K for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 02:39:24 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx03.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QL2qS-00052L-2D
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 02:36:36 +0200
Received: from phoenix.localnet (unknown [192.168.0.226])
	by asrock (Postfix) with ESMTPS id 79DF1809B0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 02:36:36 +0200 (CEST)
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 May 2011 02:36:34 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <201105131210.17952.sgh@sgh.dk> <4DCD526E.2080706@eukrea.com>
	<4DCD881C.3080103@eukrea.com>
In-Reply-To: <4DCD881C.3080103@eukrea.com>
MIME-Version: 1.0
Message-Id: <201105140236.35242.sgh@sgh.dk>
Subject: Re: qt-x11-free_7.7.2 fail configure missing qmake
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
X-List-Received-Date: Sat, 14 May 2011 00:39:24 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'll test with a clean bui too adn report back.

=46redag den 13. maj 2011 21:35:56 skrev Eric B=E9nard:
> problem reproduced with a clean tmp.
> this patch restore a part that 5a6efd58cdc85d08ab9e106c84bbac5110b5aecd=20
> removed in do_install which seems to be the root of the problem.
>=20
> I'm testing and will send a clean patch if that works.
>=20



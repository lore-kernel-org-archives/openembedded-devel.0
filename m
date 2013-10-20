Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-2.int.stofa.net (mx-aarh-2.stofanet.dk [212.10.10.12])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5EA6D014
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2013 21:20:21 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-2.int.stofa.net (envelope-from <sgh@sgh.dk>)
	with esmtp id 1VY0QA-000594-0t
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Oct 2013 23:20:22 +0200
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id D7D417EE1F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2013 23:20:21 +0200 (CEST)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Oct 2013 23:20:21 +0200
Message-ID: <2478778.XBk41EpSZr@koontz>
User-Agent: KMail/4.11.2 (Linux/3.11.0-11-lowlatency; KDE/4.11.2; i686; ; )
MIME-Version: 1.0
Subject: Regarding layers and their versioning.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Oct 2013 21:20:21 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello

What is the best way to manage a private repo with recipes as well as m=
eta-oe,=20
meta-core and meta-angstrom.

Currently I have a private repo that has the layers attached as submodu=
les. Is=20
that a crazy setup or what? ...... and while  I'm at it - which revisio=
n of=20
all those layers are ment to match together? does master og meta-oe mat=
ch=20
master of meta-core or do they have simmilar tags/branches.

Thanks in advance.

--=20
S=F8ren Holm


Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QGz7T-0005qh-SB
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 21:49:23 +0200
Received: (qmail invoked by alias); 02 May 2011 19:46:46 -0000
Received: from p5B0A1227.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.18.39]
	by mail.gmx.net (mp048) with SMTP; 02 May 2011 21:46:46 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18Yez1tvTwY31qZGmqNnF/hSNMELLnygqc4JN4VB7
	Ir5V8QCkFwga+f
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 May 2011 21:47:22 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.35.12-90.fc14.x86_64; KDE/4.6.2; x86_64; ;
	)
References: <1304282399-2932-1-git-send-email-schnitzeltony@gmx.de>
	<1304319501.3949.4.camel@mattotaupa>
In-Reply-To: <1304319501.3949.4.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201105022147.22763.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH v2] libgpsbt: add dbus-glib to DEPENDS
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
X-List-Received-Date: Mon, 02 May 2011 19:49:24 -0000
X-Groupsio-MsgNum: 31573
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_KpwvNsnx06at3Pj"

--Boundary-00=_KpwvNsnx06at3Pj
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, May 02, 2011 08:58:21 AM Paul Menzel wrote:
> Just for the future. How do you want to spell your last name? Mueller or
> M=FCller? There are commits with both spellings.
This is what I do not understand for a while now. I think I have all settin=
gs

=2D email client
=2D .gitconfig

made up for Mueller (to prevent trouble - on other repos I saw problem with=
=20
german Umlaut). I think the '=FC' is created by some *intelligence* within=
=20
patchwork (see email [1] of this patch vs. patchwork [2]).=20

I guess if you use the automatic way (contrib/patchwork/pw-am.sh) you will =
find=20
automatic Umlaut '=FC' (you did not use automatic way so we see 'ue').

To check this I did:

wget -nv http://patches.openembedded.org/patch/3059/mbox/ -O pw-am-3059.pat=
ch

and attached the result here.

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
April/032272.html
[2] http://patches.openembedded.org/patch/3059/
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D54c90c53b=
d4f
> 0b02869de057407f0f5610ece260 [2]
> http://openembedded.org/index.php/Patchwork

--Boundary-00=_KpwvNsnx06at3Pj
Content-Type: application/x-compressed-tar;
  name="patchwork.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="patchwork.tar.gz"

H4sIADYJv00AA+2VbW/bNhDH85qf4pC96AqHiiQ7TqPVTVLHyYLVqTFnw4BhMGjxLLOWSZWknHjo
h99Jbpu2a5FXxTCAPxiW+XT39z1Q1R0Xa96Nj06iSvh8ufcdiIl+v9c+j794EuS8t5ckR0fH/bjb
7fb34qSXHiV7EH8PMV9SOy8swN60rtAKLbff2PfY+v+US2vW0Gb+ztgVTGsNY7EFSCCNs+5JdnRC
P5KEDY32qD2/3VaYgcd7f1iVQumfIF8K69AP9mu/4M/22fh6POK/o3XK6AySKH44S/FzC7R8pHMj
lS4yOJ4rz6b1/A3mPoM/N+lfUKp5Ubk5DYWUIOe14wXNgTdwMZqMbi6m7EJ4EjE2+gDitNXbaIS4
914xb8qKNX8tg8Fpq+v07em5lhaFm40Hw+7g5bAs0c4G3aHLl1r5v7H0Rm8HvbhY3w/SkcRBd3Q6
YH/wyYfg8GuZQdMpbIzOiQLbiedJN+6lz9LuyQlPT7opT3ihPHeoJce1UCX/zMEZmY8kvmC3JgNT
ocb1HKVEySVusDwrlfMu+nQhMrZgbGStsbDeOQZZWwof5EYvVFFbhDvh2DtKBearZmFBe69eXb+M
ogi2+K+li5e/TZulj+czwMZ+BhORrxoHFt/WyuKa0ubgx4cs8AReDCCO0i48hTskz9p4kuUz9o68
3BiqpZ2FJ5+ceUJeay3bLVQMTkm0lN031HuNJL9EmPxyNRu+vrm8vppNzm9/BtQbZY1uBMBGWCXm
JYJawNbUZERp6lpKoARnFv5OkA6lQZAYzWlFS2ElVBYX6j5qvZ6XHq0WXlGMtweNFVhT2VDdtt6/
5s21YZoNL1+dX03JBFndzVBcp001io1Rsj2ukZTQTE6aoFoVfBdYcg1TxHbLwyw51hQlClGTirUh
7RI9FYprpN68vh1lH4P4oRd4HCXcptR4wq1AmtknmbukoygZm6pCUxmZxYLPtxm8r3YY19hUOjz/
ehme5ys61ByYiLqEMWraAc8rGmAlqG/tWe2omSNnapsjSS4w0uhfMMY5ZxZzVaE7XAtcm97hB70z
0hvN5/AOiBQ6nNGFslBNUOm60AXKA5qgLKL1dE24HztPmwmJJe7G/CljUi0WwJtuAnH4iKP5IxuY
0hLvIe/nfRT9KBK95ChOEBJ6M/V6zV951AfrdDqP+zk7A54eHEOn+aLBq+vh6GY6ggHsa7NSYp8B
g8mvzdimzYC/v9SamZ2xdWHbhttnnW+uPXRka/AHuF0qB/SprKmsonqy2896Y7hU2pjVAU1S38JS
bLCpWGqWLdwpv2yLtBTOU+uXVDdUUWR1Yal8N7u7PGL/9bsqEAgEAoFAIBAIBAKBQCAQCAQCgUAg
EAgEAoHA1/kHpd+mjgAoAAA=

--Boundary-00=_KpwvNsnx06at3Pj--

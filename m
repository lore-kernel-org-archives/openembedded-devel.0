Received: from [207.97.245.231] (helo=smtp231.iad.emailsrvr.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpl@xiphos.ca>) id 1LAdqW-0001Gf-SC
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 06:12:21 +0100
Received: from relay13.relay.iad.mlsrvr.com (localhost [127.0.0.1])
	by relay13.relay.iad.mlsrvr.com (SMTP Server) with ESMTP id 6685D1D48D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 00:08:15 -0500 (EST)
Received: from xiphos.com (webmail10.webmail.iad.mlsrvr.com [192.168.1.107])
	by relay13.relay.iad.mlsrvr.com (SMTP Server) with ESMTP id 559C01D48D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 00:08:15 -0500 (EST)
Received: by webmail.mailtrust.com
	(Authenticated sender: jpl@xiphos.com, from: jpl@xiphos.ca) 
	with HTTP; Thu, 11 Dec 2008 00:08:15 -0500 (EST)
Date: Thu, 11 Dec 2008 00:08:15 -0500 (EST)
From: "Joshua Lamorie" <jpl@xiphos.ca>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
In-Reply-To: <f96d234e0812101427r4afef700t6e8ea5ae77e71a40@mail.gmail.com>
References: <f96d234e0812101427r4afef700t6e8ea5ae77e71a40@mail.gmail.com>
Message-ID: <1228972095.332522828@192.168.1.70>
X-Mailer: webmail6.8
Subject: Re: Building minimal-image with kernel24
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
X-List-Received-Date: Thu, 11 Dec 2008 05:12:22 -0000
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Gidday there,=0A=0ASorry for this simple question, but I've been using subv=
ersion up to now, and I can't figure out how to use git to checkout/pull/cl=
one the documentation.  I can see the results of ...=0A=0Agit-ls-remote  --=
heads git://git.openembedded.net/openembedded.git refs/heads/org.openembedd=
ed.documentation=0A=0AThen, inside the openembedded repository that I clone=
d with=0A=0Agit clone git://git.openemebbeded.net/openembedded.git=0A=0AI c=
an see the other branches with=0A=0A[jpl@megatron openembedded]$ git branch=
 -r=0A=0AHowever, as suggested in http://www.kernel.org/pub/software/scm/gi=
t/docs/user-manual.html#examining-remote-branches, I do a checkout and I ge=
t the following.=0A=0A[jpl@megatron openembedded]$ git checkout -b document=
ation origin/org.openembedded.documentation=0Afatal: Entry 'packages/tinylo=
gin/tinylogin_1.4.bb' not uptodate. Cannot merge.=0A=0AThere is an error in=
 that .bb file (I just added a patch to bugzilla) but shouldn't I be able t=
o get this branch without dealing with the uncommited changes to that file?=
=0A=0A=0AThanks=0A=0AJoshua=0A=0AOn Wednesday, 10 December, 2008 17:27, "Cl=
iff Brake" <cliff.brake@gmail.com> said:=0A=0A> On Wed, Dec 10, 2008 at 4:4=
0 PM, Joshua Lamorie <jpl@xiphos.ca> wrote:=0A> =0A>> p.s. Where is it poss=
ible to contribute to the OE manual?=0A> =0A> Check the following branch ou=
t of git, and then post patch to bugzilla.=0A> =0A> http://git.openembedded=
.net/?p=3Dopenembedded.git;a=3Dshortlog;h=3Drefs/heads/org.openembedded.doc=
umentation=0A> =0A> Thanks,=0A> Cliff=0A> =0A> --=0A> =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A> Cliff Brake=0A> http:/=
/bec-systems.com=0A> =0A> _______________________________________________=
=0A> Openembedded-devel mailing list=0A> Openembedded-devel@lists.openembed=
ded.org=0A> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-devel=0A> =0A=0A=0A-- =0AXiphos Technologies=0A(514) 847-9474 x227=0A(514=
) 848-9644 fax=0A=0Awww.xiphos.com=0A______________________________________=
_________=0AThe information transmitted is intended only for the=0Aperson o=
r entity to which it is addressed and may contain=0Aconfidential and/or pri=
vileged material.  If you have=0Areceived this in error, please contact the=
 sender and delete=0Athis communication and any copy immediately. Thank you=
.=0A=0A=0A




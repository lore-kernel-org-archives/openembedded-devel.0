Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Ppdp9-0003xo-8t for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 10:37:27 +0100
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p1G9PmDO026932
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 10:25:49 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.132]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 16 Feb 2011 10:25:42 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 16 Feb 2011 10:25:42 +0100
Message-ID: <01DC65355775654EB4BECCE3C4522F0D08155631@GSX300A.mxchg.m.corp>
In-Reply-To: <AANLkTik8Wpc9ejLHmYoe4q6QD0K9Wot9REeGXW=g2eOS@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] OpenEmbedded 2011.3 Release: Request for targets!
Thread-Index: AcvNUrfzACTn7pDzT0WhVhoeAr8sKgAaBYeA
References: <4D51566B.9060603@mentor.com>
	<4D516F8B.4090703@gmail.com><4D5953C5.3080605@mentor.com>
	<AANLkTik8Wpc9ejLHmYoe4q6QD0K9Wot9REeGXW=g2eOS@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 16 Feb 2011 09:25:42.0088 (UTC)
	FILETIME=[7B44DC80:01CBCDBB]
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Wed, 16 Feb 2011 09:37:27 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

yes we need qt 4.6.x especialy qt4-embedded-gles_4.6.x, the qt-4.7.1 =
doesn't provide a gles Version yet, we want to use powervr drivers on =
OMAP3, so we need supported versions providing OPENGL access.

Regards
Wolfgang
 =20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Cliff Brake
Gesendet: Dienstag, 15. Februar 2011 21:50
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] OpenEmbedded 2011.3 Release: Request for targets!

On Mon, Feb 14, 2011 at 11:09 AM, Tom Rini <tom_rini@mentor.com> wrote:
> qt4e-demo-image fails in both cases due to the image not being happy =
with
> qt4-4.6.x and only 4.7.x (see my emails to the list the other week).

qt 4.7.1 demo images built fine for me on the release branch.  Does
angstrom want to consider using 4.7.1 for the release?  Does anyone
still require 4.6.x?

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



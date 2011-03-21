Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q1fyO-0002w8-Rp for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 15:20:44 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 9B40813005B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 15:18:55 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2011 15:18:54 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103211333.17729.pgsellmann@portner-elektronik.at>
	<1300715915.2228.68.camel@phil-desktop>
In-Reply-To: <1300715915.2228.68.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201103211518.54372.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 14:20:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Montag, 21. M=E4rz 2011, 14:58:35 schrieb Phil Blundell:
> On Mon, 2011-03-21 at 13:33 +0100, Peter Gsellmann wrote:
> > Would this work for you?
> > CONFFILES_${PN}_micro =3D "${sysconfdir}/hostname ${sysconfdir}/nsswitc=
h.conf"
> >=20
> > Even if nothing on your target is honoring the configness of these file=
s at least it is documented.
>=20
> Yes, that sounds OK to me.
Is this acked-by? See [patch v2] in another branch of this thread.


Peter



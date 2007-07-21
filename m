Received: from [65.254.253.34] (helo=mailout04.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.67) (envelope-from
	<SRS0=Zb8VCi=MT=thegnar.org=markgross@yourhostingaccount.com>)
	id 1ICEQS-00058Z-CA for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2007 14:51:17 +0200
Received: from mailscan06.yourhostingaccount.com ([10.1.15.6]
	helo=mailscan06.yourhostingaccount.com)
	by mailout04.yourhostingaccount.com with esmtp (Exim)
	id 1ICEPc-0005L8-Vw for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2007 08:50:21 -0400
Received: from impout03.yourhostingaccount.com ([10.1.55.3] ident=exim)
	by mailscan06.yourhostingaccount.com with spamscanlookuphost (Exim)
	id 1ICEPc-0007Ec-LX for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2007 08:50:20 -0400
Received: from impout03.yourhostingaccount.com ([10.1.55.3]
	helo=impout03.yourhostingaccount.com)
	by mailscan06.yourhostingaccount.com with esmtp (Exim)
	id 1ICEPc-0001Z9-7Q for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2007 08:50:20 -0400
Received: from authsmtp10.yourhostingaccount.com ([10.1.18.10])
	by impout03.yourhostingaccount.com with NO UCE
	id SCqL1X0010D2B7u0000000; Sat, 21 Jul 2007 08:50:20 -0400
X-EN-OrigOutIP: 10.1.18.10
X-EN-IMPSID: SCqL1X0010D2B7u0000000
Received: from pool-71-245-108-184.ptldor.fios.verizon.net ([71.245.108.184]
	helo=mgross-desktop)
	by authsmtp10.yourhostingaccount.com with esmtpa (Exim)
	id 1ICEPb-0000Kg-VS for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2007 08:50:20 -0400
Received: by mgross-desktop (Postfix, from userid 1000)
	id 11426C2E59; Sat, 21 Jul 2007 05:50:37 -0700 (PDT)
Date: Sat, 21 Jul 2007 05:50:36 -0700
From: Mark Gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070721125036.GA31700@thegnar.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.11
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: Mark Gross <markgross@thegnar.org>
X-EN-OrigIP: 71.245.108.184
X-EN-OrigHost: pool-71-245-108-184.ptldor.fios.verizon.net
Subject: pdb for oe-python?
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
X-List-Received-Date: Sat, 21 Jul 2007 12:51:20 -0000
X-Groupsio-MsgNum: 2467
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm building a slugos-image deriviative that includes python, and I
would like to use the python debugger PDB.=20

I'm having a trouble figuring out how to enable the pdb module within
the python OE bb file's.

Any thoughts?

thanks,

--mgross


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGogEchK5OsmQOmSARAtggAJ0d1WMiY4is1O/KXUZiepBndbZLRACeNlQH
fFGOq9S5oVJED3DXXcJWhZk=
=H+vc
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

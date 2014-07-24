Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 74FFA6FECD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 15:29:19 +0000 (UTC)
Received: (qmail 30511 invoked by uid 1003); 24 Jul 2014 15:29:20 -0000
Received: from unknown (HELO ?172.20.2.132?) (philip@opensdr.com@173.197.103.2)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Jul 2014 15:29:20 -0000
Message-ID: <53D12649.3020000@balister.org>
Date: Thu, 24 Jul 2014 05:29:13 -1000
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20140724141403.GL2492@jama>
In-Reply-To: <20140724141403.GL2492@jama>
X-Enigmail-Version: 1.6
Subject: Re: Patchwork almost clean
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
X-List-Received-Date: Thu, 24 Jul 2014 15:29:20 -0000
X-Groupsio-MsgNum: 51236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="XbDvxfEq3gCdgEi2w7ABhoTVvbx6tAJ9T"

--XbDvxfEq3gCdgEi2w7ABhoTVvbx6tAJ9T
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks Martin!

Philip

On 07/24/2014 04:14 AM, Martin Jansa wrote:
> There are still 30 changes in master-next bundle:
> http://patchwork.openembedded.org/bundle/jama/master-next/?archive=3Dbo=
th
>=20
> Some are new, some are old WIPs I haven't finished, some are still also=

> in master-next branch on way to master (after review comments are
> addressed)
>=20
> 63b95b7 ipsec-tools: several fixes
> efba173 snort: do not hardcode the libdir
> 135879a openvpn: not use the hardcoded libdir
> 2c137e4 syslog-ng: Improved initscript VERBOSE handling.
> caa7815 xterm: disable-rpath-hack to avoid QA issue
> e8203c9 meta-python: rename recipes-python to recipes-devtools
> d5ee15e wireshark: Add missing pkgconfig dependency
> f444b38 libxml-filter-buffertext-perl: add recipe
> 17da3f6 libxml-sax-writer-perl: add recipe
> d9c9bd1 wireshark: fix build for arm
> 67c9ab3 wireshark: Add recipe 1.12.0-rc2
> 1b0361a packagegroups: Remove deprecated "task" backward compatibility
> 36e9829 monkey: new v1.5.1 release.
> dc95fd1 usb-modeswitch: Upgrade to latest version
> dd6e944 tcpslice: add recipe under tcpdump
> ee0b865 opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
> 8e8a40f opencv: Disable 'gtk' backend if X11 is not available
> 19f1992 php 5.4.14: use pkg-config for libxml2 detection
> ddddaa7 mplayer2: Inherit python3native
>=20
> Please check if you've submitted one of these commits and please update=
 its state.
>=20
>=20
>=20


--XbDvxfEq3gCdgEi2w7ABhoTVvbx6tAJ9T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJT0SZOAAoJEMDJd4rr0mervO8IAK9XsLhpmhdw0L2Ua6XdwQSm
E+ZxNfwKcxqZVx9///mf9w5onQIibqc7K9Us15VglqxSFkOQ7lIaRTS/lBOy+iVu
fqS/wb04bhw+f7twOslpoHyX/DJ0EHfUPl7FIgGEzePIzwOBgH4ncSnjmy4d/C7c
6xdNaCPLuyewxoIOd3Ekb49qVh6Ad9w26vgh7o10IXEwKKdg1KWhwQHCHk/WhSkf
0U1HTOV5SWKo91IC/CTBPnqurQJ+zNwD2Wt6Qbs0N/nEYXtCDQ3hUVfhYJrWnpIX
nZAI3x76BRgwTYbYEuyWUEQeVjWBB3Nz4mZe13g6rVxt0QO22mUy8lBzjhQ4VHY=
=lgIW
-----END PGP SIGNATURE-----

--XbDvxfEq3gCdgEi2w7ABhoTVvbx6tAJ9T--

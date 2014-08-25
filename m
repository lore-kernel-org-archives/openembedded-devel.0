Return-Path: <ZhenCong.Tee@VERIFONE.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0211.outbound.protection.outlook.com [207.46.163.211])
	by mail.openembedded.org (Postfix) with ESMTP id C86426FE64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 01:07:01 +0000 (UTC)
Received: from BN1PR08CA0031.namprd08.prod.outlook.com (10.242.217.159) by
	DM2PR0801MB0925.namprd08.prod.outlook.com (25.160.131.20) with
	Microsoft SMTP
	Server (TLS) id 15.0.1015.17; Mon, 25 Aug 2014 01:06:54 +0000
Received: from BL2FFO11FD019.protection.gbl (2a01:111:f400:7c09::161) by
	BN1PR08CA0031.outlook.office365.com (2a01:111:e400:16::31) with
	Microsoft SMTP Server (TLS) id 15.0.1015.19 via Frontend Transport;
	Mon, 25 Aug 2014 01:06:53 +0000
Received: from vf2lvpgp1.verifone.com (209.198.197.17) by
	BL2FFO11FD019.mail.protection.outlook.com (10.173.161.37) with
	Microsoft SMTP
	Server (TLS) id 15.0.1010.11 via Frontend Transport; Mon, 25 Aug 2014
	01:06:53 +0000
Received: from VF2WVEXET2.verifone.com ([10.71.128.101])
	by vf2lvpgp1.verifone.com (PGP Universal service);
	Sun, 24 Aug 2014 21:07:34 -0400
X-PGP-Universal: processed;
	by vf2lvpgp1.verifone.com on Sun, 24 Aug 2014 21:07:34 -0400
Received: from VF2WDEXCAHT1.verifone.com (10.71.199.101) by
	VF2WVEXET2.verifone.com (10.71.128.101) with Microsoft SMTP Server
	(TLS) id 14.3.181.6; Sun, 24 Aug 2014 21:07:07 -0400
Received: from VF2WDEXMB3.verifone.com ([fe80::2d79:a18b:1d3d:af0c]) by
	VF2WDEXCAHT1.verifone.com ([::1]) with mapi id 14.03.0181.006;
	Sun, 24 Aug 2014 21:06:51 -0400
From: Zhen Cong Tee <ZhenCong.Tee@VERIFONE.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: i.MX6 VPU in yocto firefox
Thread-Index: Ac/AANcoE4OTWlBiSB20jjow402mjQ==
Date: Mon, 25 Aug 2014 01:06:50 +0000
Message-ID: <2195C6BD93BBD44C90E2840DC15E289B6307EE3E@VF2WDEXMB3.verifone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.71.196.102]
MIME-Version: 1.0
X-PGP-Encoding-Format: MIME
X-PGP-Encoding-Version: 2.0.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:209.198.197.17; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(428002)(189002)(374574003)(199003)(81342001)(90102001)(50986999)(86362001)(19617315012)(83072002)(4396001)(85852003)(92726001)(99396002)(77096002)(16236675004)(85306004)(19300405004)(19625735002)(46102001)(21056001)(54356999)(19580395003)(79102001)(107046002)(15202345003)(84326002)(83322001)(44976005)(15975445006)(512954002)(2656002)(64706001)(95666004)(110136001)(101416001)(105586002)(107886001)(20776003)(106466001)(87936001)(568964001)(53416004)(77982001)(33656002)(74662001)(76482001)(74502001)(6806004)(71186001)(19625215002)(2351001)(80022001)(81542001)(229853001);
	DIR:OUT; SFP:; SCL:1; SRVR:DM2PR0801MB0925;
	H:vf2lvpgp1.verifone.com; FPR:; MLV:sfv;
	PTR:vf2lvpgp1.verifone.com; MX:1; A:1; LANG:en; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;
X-Forefront-PRVS: 03142412E2
Received-SPF: None (protection.outlook.com: VERIFONE.com does not designate
	permitted sender hosts)
Authentication-Results: spf=none (sender IP is 209.198.197.17)
	smtp.mailfrom=ZhenCong.Tee@VERIFONE.com; 
X-OriginatorOrg: verifone.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: i.MX6 VPU in yocto firefox
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
X-List-Received-Date: Mon, 25 Aug 2014 01:07:04 -0000
X-Groupsio-MsgNum: 51841
Content-Type: multipart/signed;
	boundary="PGP_Universal_A91F8C30_DFECF0F0_C5BFB9CC_54A0F44A";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--PGP_Universal_A91F8C30_DFECF0F0_C5BFB9CC_54A0F44A
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings,

May I know how can I integrate the VPU decoder of i.MX6 MPU into the firefo=
x brower in yocto?

I manage to integrate the firefox browser in the image. But when I wanted t=
o run some video in the browser, it is not supported.

When I run the below page:

http://www.youtube.com/html5

The h.264 and VP8 is not ticked.



I am able to run h.264 and VP8 video in gstreamer and I did a little backgr=
ound survey on firefox. From page below:

http://en.wikipedia.org/wiki/History_of_Firefox

I found out that firefox only support gstreamer starting version 14.

From the meta-browser, the firefox version that is available in yocto is 10=
.0.11esr.

May i know how can i upgrade the yocto firefox to version 14 or later to te=
st out the gstreamer? May I know what is the latest firefox version availab=
le for Yocto?



Thank you.

Regards,

Zhen Cong Tee

________________________________
This electronic message, including attachments, is intended only for the us=
e of the individual or company named above or to which it is addressed. The=
 information contained in this message shall be considered confidential and=
 proprietary, and may include confidential work product. If you are not the=
 intended recipient, please be aware that any unauthorized use, disseminati=
on, distribution or copying of this message is strictly prohibited. If you =
have received this email in error, please notify the sender by replying to =
this message and deleting this email immediately.

--PGP_Universal_A91F8C30_DFECF0F0_C5BFB9CC_54A0F44A
Content-Type: application/pgp-signature; x-mac-type=70674453; name="PGP.sig"
Content-Disposition: attachment; filename="PGP.sig"

-----BEGIN PGP SIGNATURE-----
Version: PGP Universal 3.2.0 (Build 2599)

iQIVAwUBU/qMVX1oNYuCztfgAQqctQ/+NWvu4mEL7SpPsN0CXc6OtnaJtQOvyJj7
kEIlkfiq479YIexLGGGGqp2kGowojueDSH0D9CRsdv8tYV+P/vwn2Gg15ePIkFw9
rbfNJfSv6vol4zMGwU4QfKJMJGYLauY5K1XjmaDeusgb7zjhUIM6Z8ZuEmtbNLZ0
J8AC3i+GhWQfakcRw2j2OVnl1/EJq2tuMDXuNO59/j6iKSlVKMmPbPJ35M63K/qL
y2UK8kIUi2Dy4ExxGwIKprJlDZL1veD1FxOeMyZuytjt32Y7Ep1oDHghk5GcP/U8
pebbwBi8U9MApZaDosxRmSGaZDQpHhwHDnCDKvUVn5fcXP7Kl+YXsfDUzD96rR3C
3Xds7AGj9vJsX+9LD9/fflqQPRyCSFX1HJkHz9rgmwMwPfJZhvvjuXTmzs5cy973
NjozhAgMBH5/QJ60oGF2O0c9ULTyDHwbwoax8iKepg9wy6qHbwp3MCL47PNU/1oz
P4pXF4Z3LxlHZvRPR/jB06vzpLPZU2IEeUuB1WcKg4FvSlmSMS/KpWpZGON9qSvi
n05O3vj2QU4Y6fdh2lknlF1A0JAgUvFxEE5UGf7mwRk96PGbNo3mYVNa4PAYaYQH
WMCQISkJ+emQXO+Oe+C/vX/hlI0R6krmHAIvw0AYV1P6428+L0xE/L1Zl2XbYgCA
G8BDjecIqlA=
=X6uF
-----END PGP SIGNATURE-----

--PGP_Universal_A91F8C30_DFECF0F0_C5BFB9CC_54A0F44A--

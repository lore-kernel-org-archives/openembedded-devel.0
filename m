Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8406011F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 11:02:32 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aTSXY-0007ki-Mz from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2016 03:02:33 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0224.002; Wed, 10 Feb 2016 11:02:31 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: mplayer2 : focus deficiency?
Thread-Index: AdFj8gxvGSkTjz9IQQGYVRHINI7WYQ==
Date: Wed, 10 Feb 2016 11:02:30 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB867B8@EU-MBX-02.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: mplayer2 : focus deficiency?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2016 11:02:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

The version of mplayer2 available in meta-oe is almost 2.5 years old while =
there seems to be active development around it. Is there a reason OE never =
moved to a newer version?

The mplayer team officially releases tarballs from its website https://www.=
mplayerhq.hu/design7/dload.html while they also provide svn access through =
svn://svn.mplayerhq.hu/mplayer/trunk. I believe it would be a good idea to =
move to one of these sources (I would prefer tar downloads myself) and use =
a newer more robust (probably) version of mplayer2.

I will be working on a new recipe to cater this if there are no objections =
but I would really like to have some feedback before I do so.

BR,
Awais


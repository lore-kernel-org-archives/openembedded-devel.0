Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 82E01731F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:51:45 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aXmDZ-0000JE-Fn from Awais_Belal@mentor.com ;
	Mon, 22 Feb 2016 00:51:45 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Mon, 22 Feb 2016 08:51:44 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "gary@mlbassoc.com" <gary@mlbassoc.com>
Thread-Topic: [oe] mplayer2 : focus deficiency?
Thread-Index: AdFj8gxvGSkTjz9IQQGYVRHINI7WYQAEBmEAAlMCGqs=
Date: Mon, 22 Feb 2016 08:51:44 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB8A894@EU-MBX-02.mgc.mentorg.com>
References: <2021B186DC632746BD5A3CE32F12BD28011FB867B8@EU-MBX-02.mgc.mentorg.com>,
	<56BB32F8.5000201@mlbassoc.com>
In-Reply-To: <56BB32F8.5000201@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: mplayer2 : focus deficiency?
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
X-List-Received-Date: Mon, 22 Feb 2016 08:51:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Gary,=0A=
=0A=
Anything here?=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Gary Thomas []=0A=
Sent: Wednesday, February 10, 2016 5:54 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] mplayer2 : focus deficiency?=0A=
=0A=
On 2016-02-10 12:02, Belal, Awais wrote:=0A=
> Hi,=0A=
>=0A=
> The version of mplayer2 available in meta-oe is almost 2.5 years old whil=
e there seems to be active development around it. Is there a reason OE neve=
r moved to a newer version?=0A=
>=0A=
> The mplayer team officially releases tarballs from its website https://ww=
w.mplayerhq.hu/design7/dload.html while they also provide svn access throug=
h svn://svn.mplayerhq.hu/mplayer/trunk. I believe it would be a good idea t=
o move to one of these sources (I would prefer tar downloads myself) and us=
e a newer more robust (probably) version of mplayer2.=0A=
>=0A=
=0A=
I didn't think to look anywhere other than their git tree which seems=0A=
to be abandoned (the version we are using is the latest out there)=0A=
=0A=
> I will be working on a new recipe to cater this if there are no objection=
s but I would really like to have some feedback before I do so.=0A=
=0A=
I've been trying to fix up what we have now that OE-core has=0A=
abandoned libav, replacing it with a newer ffmpeg.  Maybe I'll=0A=
give this a go myself if you'd like to wait a short while (perhaps=0A=
by tomorrow)?=0A=
=0A=
--=0A=
------------------------------------------------------------=0A=
Gary Thomas                 |  Consulting for the=0A=
MLB Associates              |    Embedded world=0A=
------------------------------------------------------------=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=


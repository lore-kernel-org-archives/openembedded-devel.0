Return-Path: <dales773@hotmail.com>
Received: from snt0-omc4-s26.snt0.hotmail.com (snt0-omc4-s26.snt0.hotmail.com
	[65.55.90.229])
	by mail.openembedded.org (Postfix) with ESMTP id 1B27A6B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:07:19 +0000 (UTC)
Received: from SNT146-W68 ([65.55.90.199]) by snt0-omc4-s26.snt0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 29 Aug 2013 08:07:19 -0700
X-TMN: [OiUki7PX595+i68hrDLJPqZa3VFCd8rH]
X-Originating-Email: [dales773@hotmail.com]
Message-ID: <SNT146-W6864849A2A4EBFC6A267A683340@phx.gbl>
From: Dale Schaafsma <dales773@hotmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Aug 2013 10:07:19 -0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 29 Aug 2013 15:07:19.0982 (UTC)
	FILETIME=[751204E0:01CEA4C9]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe]recipes-devtools/cloud9/cloud9_0.6.bb, do_fetch fails
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
X-List-Received-Date: Thu, 29 Aug 2013 15:07:19 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All=2C My apologies if this is not the correct place to send this...please =
let me know where it should be sent.
 The cloud9 image for the BeagleBoneBlack doesn't currently build for me as=
 the sass.js git repo no longer seems to exist. The following is the offend=
ing line in recipes-devtools/cloud9/cloud9_0.6.bb: git://github.com/visionm=
edia/sass.js.git=3Bdestsuffix=3Dgit/support/connect/support/sass=3Bname=3Ds=
ass \
 Searching github found this repository=2C but I'm not sure if this is an a=
ppropriate replacement (I'm not familiar with sass).  https://github.com/st=
unti/sass.js
Thanks=2CDale 		 	   		  =


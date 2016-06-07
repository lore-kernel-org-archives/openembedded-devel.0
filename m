Return-Path: <praveenreddy.p@hcl.com>
X-Greylist: delayed 609 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Jun 2016 14:13:58 UTC
Received: from GWS08.hcl.com (gws08.hcl.com [192.8.186.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7728673198
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 14:13:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.26,433,1459794600"; d="scan'208,217";a="51829164"
Received: from unknown (HELO CHN-CORP-HT01.CORP.HCL.IN) ([10.249.2.33])
	by GWS08.hcl.com with ESMTP/TLS/AES128-SHA; 07 Jun 2016 19:33:48 +0530
Received: from CHN-HCLT-CSHT05.HCLT.CORP.HCL.IN (10.150.12.30) by
	CHN-CORP-HT01.CORP.HCL.IN (10.249.2.33) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Tue, 7 Jun 2016 19:33:23 +0530
Received: from CHN-HCLT-MBS08.HCLT.CORP.HCL.IN ([10.150.12.23]) by
	CHN-HCLT-CSHT05.HCLT.CORP.HCL.IN ([::1]) with mapi id 14.03.0235.001;
	Tue, 7 Jun 2016 19:33:23 +0530
From: Praveenreddy Padamati <praveenreddy.p@hcl.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Reg: Yocto build error( gcc_4.8)
Thread-Index: AdHAxSJ9pKlPffvASgSwdBL23xQSuQ==
Date: Tue, 7 Jun 2016 14:03:21 +0000
Message-ID: <09856974BCEE6F48AB378E52E4CAA73C230E93B3@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.5.114]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: KARA Phanikiran -EXT <phanikiran.kara@alstom.com>
Subject: Reg: Yocto build error( gcc_4.8)
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
X-List-Received-Date: Tue, 07 Jun 2016 14:14:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

We are compiling the yocto build system with "bitbake core-image-sato" comm=
and. We are facing one problem. It is not compiling, it is showing "gcc_4.8=
.bb, > do_compile failed with exit code".
Please do the needful.

Thanks and Regards,
Praveen Reddy P
HCL Technologies Ltd | Lead Engineer | Alstom ODC| ERS-SS-SCS-Embedded Plat=
form Lab
Phone: +914443935173 | Mobile: +919989642159 | E-mail: praveenreddy.p@hcl.c=
om<mailto:praveenreddy.p@hcl.com>
Company address: HCL Technologies Ltd ,73-74, South Phase,Ambattur Industri=
al Estate (AMB-5), Chennai - 600 058,India
Switchboard: +91-44-4393-5000  WebSite: www.hclt.com<http://www.hclt.com/>



::DISCLAIMER::
---------------------------------------------------------------------------=
-------------------------------------------------------------------------

The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only.
E-mail transmission is not guaranteed to be secure or error-free as informa=
tion could be intercepted, corrupted,
lost, destroyed, arrive late or incomplete, or may contain viruses in trans=
mission. The e mail and its contents
(with or without referred errors) shall therefore not attach any liability =
on the originator or HCL or its affiliates.
Views or opinions, if any, presented in this email are solely those of the =
author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction, disse=
mination, copying, disclosure, modification,
distribution and / or publication of this message without the prior written=
 consent of authorized representative of
HCL is strictly prohibited. If you have received this email in error please=
 delete it and notify the sender immediately.
Before opening any email and/or attachments, please check them for viruses =
and other defects.

---------------------------------------------------------------------------=
-------------------------------------------------------------------------


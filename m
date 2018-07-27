Return-Path: <Aditya.Tayade@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-bo1ind01on0076.outbound.protection.outlook.com [104.47.101.76])
	by mail.openembedded.org (Postfix) with ESMTP id 5483278CFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q8GDZrRLn6TOTq+vZt4w9hjxgRKTgv5TbVhXqkBNqQE=;
	b=Q3SBN0zMnBOthVCSKVKH887exW1/+l5XmzdPvXztEyQm1ErYemqlIYxogNbWxVKGMTr1qfzaaOrhRBjO+wDd9Xtk8sFlRpOqxzDPYXwYvjQ1dK9xQb+2F6pVHdbw7tv/EJLAloJa9IEE1K62MvDhZ0aXVIl1HIj9ZIvQiKHRskA=
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM (10.164.150.144) by
	MAXPR01MB0123.INDPRD01.PROD.OUTLOOK.COM (10.164.149.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.21; Fri, 27 Jul 2018 10:34:29 +0000
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0]) by
	MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0%2]) with mapi id 15.20.0973.022;
	Fri, 27 Jul 2018 10:34:29 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-issues@lists.openembedded.org"
	<openembedded-issues@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-openembedded] Original ltrace_git.bb SRCREV  commit used
	is now unavailable in git tarball from ltrace.org
Thread-Index: AQHUIzoV3BiBKx3WjkiwsHOhpDxktaSi40ep
Date: Fri, 27 Jul 2018 10:34:28 +0000
Message-ID: <MAXPR01MB034862B6CB3CFEF598A3BA47912A0@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB053655685322C5FE49975DADEE550@MA1PR01MB0536.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA1PR01MB053655685322C5FE49975DADEE550@MA1PR01MB0536.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-originating-ip: [115.112.39.238]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MAXPR01MB0123;
	6:MEdCQ5KTlqd1Cn2xa/UWIf0gheaW7JM9NNPKawOzbaMDccH0kXLqu80kdwa9eDVuy819v3pJVb5pj0AxRg3SrLAgj/nsPxxd+cfswylW/e5aCp8Hy/boDL90LKc2wDUKmtxkqY6UD9Qs3hek1Fsmlh0SzIQvzn70c7PwCVSohUVslLej92bE6fAtob2CFx43Cv1nbxoUAKHWU9X7Dbn8RFlfwztTpjp20AE/1Erh0oIu7nYwTcTLuKliDjZgqCFUrV4Y+QLcvHKTvDLC102ZvorMm1089NGtyjfJvHNtE1a8F44ScC5YE2pHQHlTlfkn4fSMgEf+tOu33jfJNcHaL+elylYLchC+Gbvruy3y42MhhVLcti6mWjPYWZmj7hUhsz0NVTXgoSJGqmZfu22OxROHyH7AQdlLfDnhDksbu2r72QoDyiqzoCrDutVwF9tnNVa8u2MQ073r7EqABXbDYQ==;
	5:1vGPSH0EFndjN6/c0bniYzkHOCIr0ZN3HcmpKf146kzIpFWfKZCP4536D7zr6q1pD+gNmWa/MYfshFaowJTtR4ieD+eSzqoTX9Lg2m3rOg1nhjl/cPWPBAS+qClucWrxFNlpuWMRX36z5IXDIGOSxGFZ+9H53LVBt8vDcH694i0=;
	7:5dmteJ62jNijEFYSSAS3FuqKt5yNPBfMOb2yf8WlfWxltxnUL2JGLmyCP3rVDswatbcGK1sMFN18IfVpifm37UEfEdROqGyxILlNritR24DmiA/fgCC+b2whWe1jwXQxaOnmB75jJQsYEK4et8sFRyhg1Z+4OQGwcKt5s16bkNwljpfCTz8UgdDx80VyFzkAVCRrG8c/tdRw7M5aRm3jkU5291X6bvfReKYA3vEApiPNMyovDORLMnAIxJK0K04A
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e6172cc0-9ce7-4a72-2d7a-08d5f3ac8879
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4618075)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:MAXPR01MB0123; 
x-ms-traffictypediagnostic: MAXPR01MB0123:
x-microsoft-antispam-prvs: <MAXPR01MB01236C8E77CB604D6E61ED46912A0@MAXPR01MB0123.INDPRD01.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(223705240517415)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MAXPR01MB0123; BCL:0; PCL:0; RULEID:; SRVR:MAXPR01MB0123; 
x-forefront-prvs: 07467C4D33
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(366004)(53754006)(199004)(189003)(106356001)(14454004)(9686003)(54896002)(478600001)(316002)(72206003)(54906003)(110136005)(55016002)(7696005)(76176011)(6436002)(107886003)(33656002)(99286004)(105586002)(6246003)(68736007)(26005)(53936002)(39060400002)(19627405001)(4326008)(2900100001)(5250100002)(53546011)(25786009)(2501003)(476003)(55236004)(97736004)(102836004)(7736002)(74316002)(446003)(11346002)(486006)(6506007)(6606003)(186003)(66066001)(229853002)(81156014)(86362001)(81166006)(5660300001)(3846002)(6116002)(8676002)(256004)(8936002)(14444005)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB0123;
	H:MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: QclHBT5SnmvFat5D81eWqy7AkQQO4Kpx/fIrT8SgMF1JCyBw/igaGPmcwESRviZvYfCF24eF6c/PvYC/DvqMDlvX/N+yc2E/U6wYApuZqgLTYbINhou5QR4OXt0C7ylUz7fD7R/cOQydCxxtsUCUnN8QJAOtEAjGW5aKU2IWyN5OiOjqjPBCTOOqO6L8prA00NTyb7WgIIcdhshXICtjLbvuQXGcbmtC+NsSc3506j8V8fvpJva+5M1KDlYQxc86XjcrUTEIGqrgAGXCe3EKhYCR1x8xWPTvR96wLJRWSZDyWq3yOYyziRU9WIEBknebTtAg9JaYBgYy47Rvhvd4dKlJulErBgmM05GaFMnpV6M=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6172cc0-9ce7-4a72-2d7a-08d5f3ac8879
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2018 10:34:28.7047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB0123
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-openembedded] Original ltrace_git.bb SRCREV commit used is now unavailable in git tarball from ltrace.org
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
X-List-Received-Date: Fri, 27 Jul 2018 10:34:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


Me too facing same issue. Any advice on this.



Regards,

Aditya Tayade

________________________________
From: Nisha Parrakat
Sent: Tuesday, July 24, 2018 4:08:12 PM
To: openembedded-issues@lists.openembedded.org; openembedded-devel@lists.op=
enembedded.org
Cc: yocto@yoctoproject.org
Subject: [meta-openembedded] Original ltrace_git.bb SRCREV commit used is n=
ow unavailable in git tarball from ltrace.org


Hi all,


ltrace recipe is pointing to a fetch url (git://anonscm.debian.org/collab-m=
aint/ltrace.git;branch=3Dmaster) that is discontinued now.

No ltrace found in alternate salsa.debian.org.

Tarball for ltrace is present in ltrace.org but the SRCREV in the mentioned=
 in the original recipe is not found any more but we do see the same commit=
 with another sha but a different git history.


Please advice if we should modify the SRCREV to reflect the new git source =
from ltrace.org?


original SRCREV in recipe c22d3594...

corresponding SRCREV coming from the git tarball is ea8928da...


Please advice .




Regards,
Ms Nisha Parrakat
KPIT Technologies Ltd, Pune, INDIA


This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.


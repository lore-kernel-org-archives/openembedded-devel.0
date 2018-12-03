Return-Path: <dbuchwald@protedyne.com>
Received: from EXCHSVR3.protedyne.protedyne.com (mail.protedyne.com
	[12.236.142.71])
	by mail.openembedded.org (Postfix) with ESMTP id D4C0B65D48
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 21:38:09 +0000 (UTC)
Received: from EXCHSVR3.protedyne.protedyne.com ([fe80::89a6:638b:4998:7ad1])
	by EXCHSVR3.protedyne.protedyne.com ([fe80::89a6:638b:4998:7ad1%14])
	with mapi id 14.03.0415.000; Mon, 3 Dec 2018 16:37:37 -0500
From: Dave Buchwald <dbuchwald@protedyne.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Yocto and OpenJDK
Thread-Index: AdSLRzHsTiFiaWyOT7+cXpDAs+Lr8QACNCjQAAAWrfA=
Date: Mon, 3 Dec 2018 21:37:36 +0000
Message-ID: <18DB423D160957498153A71956CACF8222223254@EXCHSVR3.protedyne.protedyne.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.23]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Yocto and OpenJDK
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
X-List-Received-Date: Mon, 03 Dec 2018 21:38:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a question about Java versions for Yocto. As we know, starting in Ja=
nuary 2019, Oracle will
basically start crapping on the open source licensing availability for the =
JDK and will start charging for
updates starting with JDK11.  I build software and hardware using Yocto-bui=
lt images for the imx7 using
Java and various Java-based technologies.


-        Will the Yocto project go to newer versions of OpenJDK? 9, 10, 11?

-        How will the Yocto project and meta-java go forward due to Oracle'=
s actions?

-        Will newer versions be tied to newer BSP's?




thanks,
Dave Buchwald
Protedyne Corp.
Windsor, CT


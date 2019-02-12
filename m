Return-Path: <santhosh.nadig@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1E96C487
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 07:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8BD801833F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:58:18 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id R20iJF7_VvX7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:58:18 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0213F1831E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:58:18 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0C651A0B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:58:17 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C58C21A0B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:58:17 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:58:17 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id B99DC2BFF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:58:17 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 12 Feb 2019 08:58:17 +0100
Received: from XBOX01.axis.com (10.0.5.15) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 12 Feb 2019 08:58:17 +0100
Received: from XBOX01.axis.com ([fe80::29b8:9a78:62b3:f680]) by
	XBOX01.axis.com ([fe80::29b8:9a78:62b3:f680%22]) with mapi id
	15.00.1365.000; Tue, 12 Feb 2019 08:58:17 +0100
From: Santhosh Nadig <santhosh.nadig@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: libgfortran license
Thread-Index: AQHUwqi2lqWmRKT8hUW7G1JuCG1QSQ==
Date: Tue, 12 Feb 2019 07:58:17 +0000
Message-ID: <2d621cbdb1134320a6218f37871269c0@XBOX01.axis.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Santhosh Nadig <santhosn@axis.com>
Subject: libgfortran license
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
X-List-Received-Date: Tue, 12 Feb 2019 07:58:18 -0000
Content-Language: sv-SE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello!

It appears that libgfortran.inc does not have the license set to"GPL-3.0-wi=
th-GCC-exception", whereas libgcc.inc has it
(http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
gcc/libgcc.inc#n24).

Is there any particular reason?
Can an exception be added to libgfortran too?

Thank you.

Kind regards,
Santhosh



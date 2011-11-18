Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RRLht-0003Qr-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 11:30:05 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pAIANWVK018140
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 11:23:37 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Fri, 18 Nov 2011 11:23:32 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Replacing a config file from other package
Thread-Index: Acyl23zFCvB1EWmvSJuyUS3UWAaf9wAAGtF8
Date: Fri, 18 Nov 2011 10:23:31 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4019E837@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4019E820@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4019E820@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Replacing a config file from other package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2011 10:30:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!=0A=
=0A=
My image contains the ppp package.=0A=
Now I want to install my own package with configuration files related to pp=
p.=0A=
=0A=
A problem occurs when i try to install the "config-ppp" package because I w=
ant to replace some files already provided by the ppp package, e.g. "pap-se=
crets"; the image build and/or installation fails and refuses to overwrite =
an existing file.=0A=
=0A=
Is there an elegant way to accomplish this without modifying the ppp packag=
e, e.g. to tell OE that it's really OK to overwrite this or that file?=0A=
=0A=
Thanks & BR,=0A=
Mats=0A=



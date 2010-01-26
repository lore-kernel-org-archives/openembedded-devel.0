Received: from bay0-omc4-s16.bay0.hotmail.com ([65.54.190.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NZm4b-0001i8-9C
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 15:07:20 +0100
Received: from BAY127-W11 ([65.54.190.199]) by bay0-omc4-s16.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 26 Jan 2010 06:03:52 -0800
Message-ID: <BAY127-W110508746AEAFBE1D276CAD85E0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jan 2010 19:03:51 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Jan 2010 14:03:52.0025 (UTC)
	FILETIME=[63CBA490:01CA9E90]
X-SA-Exim-Connect-IP: 65.54.190.218
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbaking ossie-image
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
X-List-Received-Date: Tue, 26 Jan 2010 14:07:20 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=20
I am trying  bitbake ossie-image but it is showing error of missing some de=
pendency.How to solve this problem where to find this dependency?

Terminal window is looking like this.=20

[saleh@localhost ~]$ bitbake ossie-image
NOTE: Handling BitBake files: \ (1324/7634) [17 %]
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv re=
placement is used
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv re=
placement is used
NOTE: Handling BitBake files: | (2305/7634) [30 %]
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been =
replaced by bluez4
NOTE: Handling BitBake files: / (2307/7634) [30 %]
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been =
replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has bee=
n replaced by bluez4
NOTE: Handling BitBake files: - (2320/7634) [30 %]
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been =
replaced by bluez4
NOTE: Handling BitBake files: / (2325/7634) [30 %]
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has bee=
n replaced by bluez4
NOTE: Handling BitBake files: / (7634/7634) [100 %]
NOTE: Parsing finished. 0 cached=2C 7327 parsed=2C 307 skipped=2C 0 masked.
NOTE: Resolving any missing task queue dependencies
ERROR: Required build target 'ossie-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['ossie-image'=2C 'task-ossie'=
]

Saleh

 		 	   		 =20
_________________________________________________________________
Windows Live: Friends get your Flickr=2C Yelp=2C and Digg updates when they=
 e-mail you.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_3:092=
010=


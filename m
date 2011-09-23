Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1R70jh-0007bH-Fn
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 10:03:53 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p8N7m5wC031374
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2011 09:48:10 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Fri, 23 Sep 2011 09:48:06 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: How to track custom packages during development?
Thread-Index: Acx5xJktpO6UYXyJTAmSVuV3TjLD1Q==
Date: Fri, 23 Sep 2011 07:48:06 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C40134FF1@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to track custom packages during development?
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
X-List-Received-Date: Fri, 23 Sep 2011 08:03:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

I'm using OE classic for a product I'm developing. Included in the product =
are some proprietary software applications that I build using OE recipes. I=
n an Agile development spirit :) these applications are frequently updated =
and distributed to the customer using .ipk's. Now to the question:

How do I best manage versions of these packages without having to create a =
new recipe for each?

E.g. can I have a recipe xxxx-1.0 that has a variable that is included in t=
he ipk filename and version?

All suggestions are welcome!

Thanks,
Mats


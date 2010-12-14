Received: from smtp.fchosted.com ([205.234.75.10] helo=mail.fchosted.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1PSahx-0001NL-W8
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 20:38:47 +0100
Received: from MBXCLUS01.fchosted.com ([10.10.2.22]) by hubex01.fchosted.com
	([10.10.1.51]) with mapi; Tue, 14 Dec 2010 11:40:08 -0800
From: John Faith <jfaith@soundmetrics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Dec 2010 11:36:56 -0800
Thread-Topic: [oe] i2c-tools_3.0.2.bb  recipe question
Thread-Index: AcubxrYEl4SuwOTET7KTEqLSXXSybA==
Message-ID: <F176A515-C19A-4734-81B8-039CC1FD13E6@soundmetrics.com>
References: <4D07AB03.6030408@comcast.net>
In-Reply-To: <4D07AB03.6030408@comcast.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 205.234.75.10
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: i2c-tools_3.0.2.bb recipe question
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
X-List-Received-Date: Tue, 14 Dec 2010 19:38:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Dec 14, 2010, at 9:36 AM, Ed Nelson wrote:

> Sorry if this is a lame question.
> In the do_install_append() section
> install -d ${D}{$includedir}/linux
>=20
> Is there a difference between
> ${includedir}
> and
> {$includedir}
>=20
>=20
> Thanks
> Ed
>=20

Hi Ed,
Not sure where the 2nd one came from, but the ${var} format is as shown her=
e:
http://docs.openembedded.org/usermanual/usermanual.html#directories_install=
ation

,
John=



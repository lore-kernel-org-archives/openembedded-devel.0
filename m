Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OysBO-00043Q-C3
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 22:14:20 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8NKEBEK029012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 15:14:11 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8NKEAv9009358
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 15:14:11 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8NKEAY1025055
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 15:14:10 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 23 Sep 2010 15:14:11 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Sep 2010 15:14:09 -0500
Thread-Topic: Question about automake licensing in recipe
Thread-Index: ActbW+GPIRlq1KGDQXO6/CJSWPqWdA==
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310E154E8@dlee06.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Question about automake licensing in recipe
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
X-List-Received-Date: Thu, 23 Sep 2010 20:14:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,

I was digging around in the automake sources and I noticed that there is a =
top-level COPYING file that says automake is licensed under GPLv2.  However=
, in the lib directory there is another COPYING file that says GPLv3.  I wa=
s trying to figure out what LICENSE should be set to for automake when the =
sources contain both GPLv2 and GPLv3 code.  Should it be set to something l=
ike GPLv2/GPLv3?  I've read that GPLv2 and GPLv3 are incompatible (http://g=
plv3.fsf.org/wiki/index.php/Compatible_licenses#GPLv3-incompatible_licenses=
) so can a recipe even be marked as being both GPLv2 and GPLv3?

Any input would be appreciated here.

Sincerely,
Chase Maupin
Software Applications
Catalog DSP Products
e-mail: chase.maupin@ti.com
phone: (281) 274-3285

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/




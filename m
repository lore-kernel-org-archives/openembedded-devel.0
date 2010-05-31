Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OJDq0-0007VM-D6
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 00:52:06 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o4VMlqec019042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 17:47:52 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o4VMlpcw009776
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 17:47:51 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o4VMlpDA011106
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 17:47:51 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 31 May 2010 17:47:51 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 31 May 2010 17:47:39 -0500
Thread-Topic: [oe] Examples of srctree and gitver
Thread-Index: AcsAMXJFPAPnj3S+RP+AeADqGdA5eQA3XPjQ
Message-ID: <A24693684029E5489D1D202277BE894455A0F458@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
	<AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com>
	<A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com>
	<AANLkTinA1ZTsklvgjWbc87f9a5CgSXpbCth47yVKiPq-@mail.gmail.com>
In-Reply-To: <AANLkTinA1ZTsklvgjWbc87f9a5CgSXpbCth47yVKiPq-@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {86DF2BFB-7C29-44FF-A4EC-4F92DEEAB141}
x-cr-hashedpuzzle: AIv+ AR7o AkSc A4HC Bnri B/7j C4mw Ei9l Fani HQdz I4xk
	JZ2l J35F J7Mu KF0j KWYZ; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {86DF2BFB-7C29-44FF-A4EC-4F92DEEAB141};
	bQBhAHIAdABpAG4AQAB0AGkALgBjAG8AbQA=; Mon,
	31 May 2010 22:47:40 GMT;
	UgBFADoAIABbAG8AZQBdACAARQB4AGEAbQBwAGwAZQBzACAAbwBmACAAcwByAGMAdAByAGUAZQAgAGEAbgBkACAAZwBpAHQAdgBlAHIA
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Mon, 31 May 2010 22:52:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2010 at 14:49:32, Chris Larson wrote:

> On Sun, May 30, 2010 at 12:26 PM, Ambrose, Martin <martin@ti.com> wrote:
> > On Sun, May 30, 2010 at 11:16:16, Chris Larson wrote:
> > > On Sun, May 30, 2010 at 8:07 AM, Ambrose, Martin <martin@ti.com> wrot=
e:

...

> > Ack. I now think of the class as providing a 'skip' to the
> > fetch+unpack+patch steps but everything afterwards is then vanilla OE.
>=20
> Yeah, that's the idea, and is the only reason the class needs to exist --
> otherwise you could just point S to a local directory in the recipe and n=
ot
> need it.  Aside: the way it does so is quite the hack, we need to figure =
out
> a better way to manipulate the task graph like this.

Maybe that explains the problem I'm seeing with the dependency graph when u=
sing srctree.
Specifically if my recipe has
	inherit qt4e

Then it doesn't try to run the do_configure before the qt native tools are =
present.
This of course being expected/desired. However if I have
	inherit srctree qt4e

Then it goes straight to the configure phase without ensuring the dependenc=
ies are present.
	bitbake blah
	...
	/home/user/oe/arago-tmp/staging/i686-linux/usr/bin/qmake2: No such file or=
 directory

Is this known behavior? Maybe even a workaround exists?

Regards,=20
Martin



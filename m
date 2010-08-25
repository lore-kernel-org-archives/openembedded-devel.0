Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1Oo4qL-0003E2-JG
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 03:32:19 +0200
Received: by pxi11 with SMTP id 11so7268pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 18:31:29 -0700 (PDT)
Received: by 10.142.136.1 with SMTP id j1mr6522603wfd.26.1282699889734;
	Tue, 24 Aug 2010 18:31:29 -0700 (PDT)
Received: from [192.168.1.13] (bb121-7-86-104.singnet.com.sg [121.7.86.104])
	by mx.google.com with ESMTPS id 23sm815094wfa.10.2010.08.24.18.31.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Aug 2010 18:31:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <20100819224603.GB26112@denix.org>
Date: Wed, 25 Aug 2010 09:31:21 +0800
Message-Id: <C1A8A762-21AC-40E0-AE5E-D4E8DDB048DB@chumby.com>
References: <04B05A09-EB4A-4EE3-9DC9-6843A7173EDD@chumby.com>
	<20100819224603.GB26112@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Add chumby falconwing support
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
X-List-Received-Date: Wed, 25 Aug 2010 01:32:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 20, 2010, at 6:46 AM, Denys Dmytriyenko wrote:

> On Wed, Aug 18, 2010 at 04:03:16PM -0700, Sean Cross wrote:
>> The following patches add support for chumby Falconwing-based boards, =
such=20
>> as the chumby One.  This is distinct from the current "chumby" =
machine,=20
>> which appears to be support for the Chumy Classic, Ironforge-based =
devices.
>=20
> Sean,
>=20
> I guess I should have replied to this message instead of to one of the =
actual=20
> patches... Anyway, I wanted to ask:
>=20
> Do you have corresponding configs for a Silvermoon machine as well? :) =
I
> wouldn't mind playing with that... :)

Silvermoon is my next goal.  I'm experimenting with using OE as a build =
system, and Falconwing seemed like a good first candidate :)=



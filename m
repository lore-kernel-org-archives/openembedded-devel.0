Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ULFVr-0004lk-LE
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 17:17:16 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so4591295dad.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=2Oajd6RQScHhtrfIMSzPjGHSlFA3urS3jrpbka+cF/c=;
	b=AsyrtlEUrbMbAvvqiYf+Bs9sVPRiRui3rha/9kAWzYVo9HuJ5er3iOowj9fv/Md3Ba
	6oSkepLJWfPhxnK/GClJVoKM/ZufeYmlXedchfEuN/jWoZpxzdboIV9KRJYfJthy92E4
	dF8Rx8k1Z2ajBdEsTC2IK9NGa+aszV7mQgRVAhSpUIywWMguBrJacje2KQwxaiekyHt7
	PYKa6alxNKIe7/eaeE16r1Ks6bsHXOLzGrt3Sc1Z4XfvMwEdfo2pXmRXSCtCpO+DcUhF
	g91v/2pPSDGyPQ/8yWR3AvYcW3bO/Oa89JwnSmbgPL6Bfk9/S9wYsm+5MJRyOsU9mko3
	970A==
X-Received: by 10.68.189.163 with SMTP id gj3mr37293537pbc.4.1364486412317;
	Thu, 28 Mar 2013 09:00:12 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id fc8sm28186003pad.21.2013.03.28.09.00.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 09:00:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <11972732.k3n4Vx4bzS@helios>
Date: Thu, 28 Mar 2013 09:00:12 -0700
Message-Id: <748453ED-9798-48BC-9C60-158A22EA82BE@gmail.com>
References: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
	<11972732.k3n4Vx4bzS@helios>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Cc: Tom King <ka6sox@gmail.com>
Subject: Re: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 16:17:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 28, 2013, at 6:34 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Thursday 28 March 2013 11:16:10 Paul Barker wrote:
>> This is just a temporary patch to change the SRC_URI for gd as the =
upstream
>> source libgd.org has been down for a week or so now. The MD5 and =
SHA256 sums
>> match so this should be the exact same archive. It is not intended to =
go in
>> the main repository but may be useful to some of you until libgd.org =
is
>> back up.
>=20
> This is what we have MIRRORS for - perhaps we could add an entry to =
MIRRORS to=20
> handle this?
>=20

exactly, send the tar ball to Tom he will populate the oe mirror.

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




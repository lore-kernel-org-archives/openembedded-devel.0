Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNlqn-0006Zi-8f
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 17:13:20 +0200
Received: by mail-pb0-f45.google.com with SMTP id ro12so1189064pbb.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=N1HkBdy0QYiTj6G4aI2GMf8WanaLqafGc4xLIyfHpEI=;
	b=BCx+i+LXeZqogBbFsLy0IAub73xvmboTScQ9WiBroZTlYqvcvhB9izn44jM/lNFKqH
	3IkrMz3YHmsJW8LQAsLBSuc6ut8LJLLn/v5mJocOe+gIUQWV2kz3E/lL/SAomOY+GKOG
	Kyvq69oCaJF3ZTO1pwpKkitNhLVJ67JvcSdXoBUORdAHiJ54575HlgOd+7e7pcAlZwti
	gwvUws49rmCyDE6ut5V/SL5o1UmxOcK82A6XxtrcqHuA6l10IMgXNfmekpbEyKHRK2je
	P0LUz/FZ2Ogy31rnMpHFk4ZCggEyCutTAA2tNexKdQPoZdSohRVFSE+HK3Tu7ULjcUS0
	Cy9w==
X-Received: by 10.66.170.176 with SMTP id an16mr10046792pac.24.1365087362854; 
	Thu, 04 Apr 2013 07:56:02 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id fk1sm10470660pbd.36.2013.04.04.07.56.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 07:56:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <F81A0AC1-9DA1-4A74-949D-94FA709BFD43@gmail.com>
Date: Thu, 4 Apr 2013 07:55:57 -0700
Message-Id: <FF983BDD-B955-4657-A711-56457453F64D@gmail.com>
References: <1364545389-20291-1-git-send-email-elvis.dowson@gmail.com>
	<B42120AF-E508-4363-8249-E94E10A2957D@gmail.com>
	<F81A0AC1-9DA1-4A74-949D-94FA709BFD43@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [v2] gcc-4.8: Refactor gcc-4.8.0 patch files.
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
X-List-Received-Date: Thu, 04 Apr 2013 15:13:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Elvis


On Apr 4, 2013, at 2:16 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:

>=20
> On Apr 4, 2013, at 11:41 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> I have staged this patch in =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4.=
8
>=20
> Thanks, Khem!
>=20
> Could we do the same for the gcc-4.7 patches, as well, as those =
recipes are updated for 4.7.3 and newer, and subsequently retired to the =
meta-openembedded/toolchain layer?
>=20


I am reluctant to change 4.7 at this stage of release.

> Elvis Dowson




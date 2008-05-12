Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JvfOy-0002ZC-Mo
	for openembedded-devel@openembedded.org; Mon, 12 May 2008 23:17:44 +0200
Received: (qmail 685 invoked by uid 813007); 12 May 2008 21:16:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2008 21:16:26 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2008 23:15:41 +0200
User-Agent: KMail/1.9.9
References: <g049dg$2ks$1@ger.gmane.org>
	<1210576761.4981.1.camel@dax.rpnet.com>
	<c384c5ea0805120625m4176d6eay57e08304d6e76923@mail.gmail.com>
In-Reply-To: <c384c5ea0805120625m4176d6eay57e08304d6e76923@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200805122315.41830.openembedded@haerwu.biz>
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 12 May 2008 21:17:44 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Monday, 12 of May 2008, Leon Woestenberg napisa=B3:

> Agreed, so I would like to propose the stable branch should not need
> to support floating SCM versions.
>
> Only full lock-down (and tarball mirrors) will make our stable trees
> useful in the long term.

What define which recipe in stable is supported? For example -=20
does "asleap 2.1" supported? It is not listed in conf/checksums.ini so I=20
suppose that it is not maintained by anyone and that no one tried to=20
build it.

Keeping sources mirrored is one thing - but what use if of mirroring if=20
there is no way to check does files are proper ones? Who will tell does=20
asleap-2.1.tgz has md5 starting with "1234" or with "f38b" if it is not=20
fetchable from other place then 3 random mirrors?

I think that for stable branch someone whould at least fetch all sources=20
to generate checksums so it will be known that asleap-2.1.tgz md5sum=20
really starts with "1234".

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

   Programming consists of 50% planning, 50% coding and 30% mathematics





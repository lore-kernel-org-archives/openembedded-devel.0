Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1Ln93h-0008Il-2Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 11:13:05 +0100
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 24328547D3; Fri, 27 Mar 2009 11:11:17 +0100 (CET)
Date: Fri, 27 Mar 2009 11:11:17 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090327101117.GB9490@fh-wedel.de>
References: <20090327095751.GA8994@fh-wedel.de>
MIME-Version: 1.0
In-Reply-To: <20090327095751.GA8994@fh-wedel.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Link error: host instead of target libc
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
X-List-Received-Date: Fri, 27 Mar 2009 10:13:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, March 27, 2009, Martin Dietze wrote:

> Having asked google I found that people had this kind of problem
> before, but I could not extract any hint on how to solve this
> there. My checkout of OE dates back to this commit:
>=20
> | commit 8ff9eac82736ab3adc5ffd223a39d9eafd2409be
> | Author: Dmitry 'MAD' Artamonow <mad_soft@inbox.ru>
> | Date:   Tue Feb 24 21:38:10 2009 -0800

Correction, that was the wrong one, my last checkout was this:

| commit b4b4c8664e53f15a436e17151c7c8cef33b766cd
| Author: woglinde <heinold@inf.fu-berlin.de>
| Date:   Tue Mar 24 12:08:58 2009 +0100

Sorry,

Martin

--=20
----------- / http://herbert.the-little-red-haired-girl.org / -----------=
--
=3D+=3D=20
Doch sie, die mich am meisten gequ=E4lt, ge=E4rgert, betr=FCbt,
Die hat mich nie gehasset, und hat mich nie geliebt.  --  H. Heine



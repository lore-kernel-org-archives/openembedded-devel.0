Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RdS1l-0000Kf-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 20:40:37 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 06718110018A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 20:33:34 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4A46A1100182
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 20:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225004171.adsl.alicedsl.de
	[92.225.4.171]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 20:33:32 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 44EDB3C4A3; Wed, 21 Dec 2011 20:33:32 +0100 (CET)
Date: Wed, 21 Dec 2011 20:33:32 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111221193331.GC26064@mail.adw-basketball.de>
References: <4EF1C1A4.9060504@zafena.se>
MIME-Version: 1.0
In-Reply-To: <4EF1C1A4.9060504@zafena.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java] Fixed upstream source URL's and match oe-core license files.
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
X-List-Received-Date: Wed, 21 Dec 2011 19:40:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2011 at 12:23:16PM +0100, Xerxes R=E5nby wrote:
> Hi I have prepared a pull request to fix upstream source URL's and matc=
h oe-core license files.
> https://github.com/woglinde/meta-java/pull/2
>=20
> While testing the meta-java layer i noticed that some of the upstream s=
ource URL's have changed.
> A special note on jdepend: here the upstream source file of 2.9 have be=
en removed and been replaced by version 2.9.1.
> License fix of libecj-bootstrap: oe-core have removed the EPL-1 license=
 file, i have correct the license in libecj-bootstrap to use EPL-1.0 inst=
ead.
> License fix of llvm: oe-core use the name NCSA for the University of Il=
linois/NCSA Open Source License license file.
>=20
> Signed-off-by: Xerxes R=E5nby xerxes@zafena.se

Hi,

I have pushed the whole series.

Bye Henning



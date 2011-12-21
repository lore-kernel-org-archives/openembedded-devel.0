Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <xerxes@zafena.se>) id 1RdKUn-0006N1-5A
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 12:38:05 +0100
Received: from [192.168.1.106] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id 4F7C05FDB01
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 12:22:55 +0100 (CET)
Message-ID: <4EF1C1A4.9060504@zafena.se>
Date: Wed, 21 Dec 2011 12:23:16 +0100
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java] Fixed upstream source URL's and match oe-core license files.
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
X-List-Received-Date: Wed, 21 Dec 2011 11:38:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi I have prepared a pull request to fix upstream source URL's and match =
oe-core license files.
https://github.com/woglinde/meta-java/pull/2

While testing the meta-java layer i noticed that some of the upstream sou=
rce URL's have changed.
A special note on jdepend: here the upstream source file of 2.9 have been=
 removed and been replaced by version 2.9.1.
License fix of libecj-bootstrap: oe-core have removed the EPL-1 license f=
ile, i have correct the license in libecj-bootstrap to use EPL-1.0 instea=
d.
License fix of llvm: oe-core use the name NCSA for the University of Illi=
nois/NCSA Open Source License license file.

Signed-off-by: Xerxes R=E5nby xerxes@zafena.se



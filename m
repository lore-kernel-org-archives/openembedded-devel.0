Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1Gqqeo-0002iC-OH
	for openembedded-devel@openembedded.org; Sun, 03 Dec 2006 13:41:22 +0100
Received: by nf-out-0910.google.com with SMTP id p77so4402279nfc
	for <openembedded-devel@openembedded.org>;
	Sun, 03 Dec 2006 04:40:41 -0800 (PST)
Received: by 10.78.146.11 with SMTP id t11mr6709680hud.1165149640964;
	Sun, 03 Dec 2006 04:40:40 -0800 (PST)
Received: by 10.78.160.8 with HTTP; Sun, 3 Dec 2006 04:40:40 -0800 (PST)
Message-ID: <b9481e140612030440q4cd679e2l9c5ae7b3f2e7f423@mail.gmail.com>
Date: Sun, 3 Dec 2006 13:40:40 +0100
From: "Nicolas FR" <nicolasfr@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: libqte-sharprom in OE (attn Mickey)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Dec 2006 12:41:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Mickey,

I came accross an old post of yours on OESF:

"I have just commited a necessary glue package to use a 2.95.3
toolchain in OE. This glue package has been sitting in my tree for a
while and I'm using it to build my python distribution for the
SharpROM without needing any additional hacks.

To make OE build SharpROM compatible QtE applications, just add two or
three dedicated packages, i.e. qte-sharprom and libqpe-sharprom - that
should be all."

As I am fighting with some qte apps compiling for sharprom under OE
(in fact they compile but then on the Zaurus complains about missing
exports), I wanted to know what you meant in the last sentence "add
two or three dedicated packages, i.e. qte-sharprom and
libqpe-sharprom". Did you mean copy the libs from the Zaurus and put
it in the OE tree?

Regards,
Nicolas.



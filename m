Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KzzMZ-0001JJ-AG
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Nov 2008 20:57:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 77E59140533D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2008 20:53:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yyiDo-KL2beH
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2008 20:53:49 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 43A9B1422AA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2008 20:53:49 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2008 20:55:27 +0100
Message-Id: <1226433327.4417.10.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: openmoko OE devs: update claws-mail and libetpan?
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
X-List-Received-Date: Tue, 11 Nov 2008 19:57:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hallo Openmoko OE developers.

I am just working on an update of claws-mail (the version in repo does
not start in some locales). New version of of claws-mail requires an
update of libetpan.

The update could actually break claws-mail build in OM. Please let me
know, what is your preferred solution:
1) Add old claws-mail version to preferred-om-2008-versions.inc
2) Remove preferred libetpan version.
3) Add new versions to preferred-om-2008-versions.inc

In case of no reply I will apply 1) keeping OM build exactly as is: with
claws-mail =EF=BB=BFbroken in some locales.

I will test both package on my spitz before push (well, with IMAPs
only), so OM build will probably will have the same test result.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




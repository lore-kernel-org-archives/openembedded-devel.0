Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JfYcD-0000ND-1h
	for openembedded-devel@openembedded.org; Sat, 29 Mar 2008 11:48:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JfYc8-0003Lx-9u
	for openembedded-devel@openembedded.org; Sat, 29 Mar 2008 10:48:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 29 Mar 2008 10:48:44 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 29 Mar 2008 10:48:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sat, 29 Mar 2008 11:48:37 +0100
Message-ID: <fsl6q5$gt0$1@ger.gmane.org>
References: <022890FE-5E72-489F-B64C-03593101E508@student.utwente.nl>	<47E83808.5060501@balister.org>	<c384c5ea0803271304i4739ea3bpee3ace5854384f4c@mail.gmail.com>	<fsgvoq$545$1@ger.gmane.org>	<c384c5ea0803271622i59f5e3bai2a9606e749a0611b@mail.gmail.com>	<fsjbi5$hak$1@ger.gmane.org>
	<c384c5ea0803281342j3f836b8cibbf1b9030a5d2859@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803281342j3f836b8cibbf1b9030a5d2859@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Changing stable branch commit policy
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
X-List-Received-Date: Sat, 29 Mar 2008 10:48:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello all,
|
|> Do you want to write a short blurb on this we can stick on the oe and
angstrom websites? regards, Koen
|
| Sure, a first shot at that (and sorry for cross-posting, but this
| really is OE related :-)
|
| ---
| The OpenEmbedded project has started to maintain a stable branch, next
| to its development branch, on March 28th 2007. Besides
| "org.openembedded.dev" there now is the "org.openembedded.stable"
| branch.
|
| The plumbing work on the development branch (long-term improvements
| such as packaged staging, creating stand-alone SDK toolchains and a
| new package manager) colides with the goal of offering a stable base
| for OpenEmbedded-derived distributions. Some projects, most notably
| the Angstrom distribution, already maintained a stable branch for this
| reason.
|
| The effort of maintaining a stable branch is now centralized back into
| the OpenEmbedded project. The main goal of the stable branch is to
| provide a branch that progresses in time with a minimum of disruptive
| changes, especially to the framework, which include classes,
| configuration namespace, package management, and tooling such as the
| bitbake tool. Changes to the stable branch are selected and reviewed
| according to an agreed upon policy before being committed to the
| stable branch. This will require extra effort from the OpenEmbedded
| developer community.
|
| The stable branch is not intended to keep up with the pace of
| development on the development branch. Planned is to create new stable
| branches every year; the next stable branch is scheduled to branch of
| the development tree during 2008.12. Old stable branches will go in
| unmaintained mode 3 months after a new stable branch is created; the
| current stable will retire 2009.2.
|
| OpenEmbedded projects and distributions now have the choice of at
| least a .dev and .stable branch and the OpenEmbedded developers can
| keep on plumbing.
| ---

The mailinglist:

http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-stablebranch

And viewmtn:

http://amethyst.openembedded.net/oe/viewmtn/viewmtn.py/branch/changes/org.openembedded.stable

The commit policy (currently under RFC at the above mailinstlist):

http://linuxtogo.org/gowiki/Angstrom/Backport_from_dev_to_stable

regards,

Koen



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH7h6FMkyGM64RGpERAslYAJ9m9k3kwSiTfbPN8jLFxfIx5HAhugCfZfQx
/eUCqwLdgYJv3pQdkYBX/S8=
=FVoH
-----END PGP SIGNATURE-----




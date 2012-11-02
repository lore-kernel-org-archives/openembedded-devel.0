Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TUF23-0004im-Cd for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 12:03:23 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TUEoz-0003pp-Pq for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 11:49:53 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 11:49:53 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 11:49:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 Nov 2012 11:49:44 +0100
Message-ID: <k708fu$3tt$1@ger.gmane.org>
References: <CAP9ODKqaFOHjP0RR5xTPi4WP4dX+22uUQW1sdbGS3twD0Bpz=w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <CAP9ODKqaFOHjP0RR5xTPi4WP4dX+22uUQW1sdbGS3twD0Bpz=w@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: Use of meta-systemd and have images using only udev
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
X-List-Received-Date: Fri, 02 Nov 2012 11:03:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-10-12 20:26, Otavio Salvador schreef:
> Hello,
> 
> I'd like to share the distro among some images; some will use systemd
> and others only udev.
> 
> I noticed systemd package builds a udev package but it seems not
> supported to run standalone. Did someone try it?

You only need to add an initscript, udev will run fine without systemd as init.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQk6VIMkyGM64RGpERAvrQAJ0ZgjPaf2/0Y8szbVmOQA/GHrgklwCfRfMj
PXsGS6LGXc2kByDO1rNNsUc=
=xldk
-----END PGP SIGNATURE-----




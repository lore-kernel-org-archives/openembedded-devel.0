Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PMHuF-0003Nh-HP for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 11:21:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PMHsz-0006ci-23 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 11:20:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 11:20:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 11:20:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 27 Nov 2010 11:18:05 +0100
Message-ID: <icqlst$p90$3@dough.gmane.org>
References: <1290816813-20648-1-git-send-email-jayen@cse.unsw.edu.au>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1290816813-20648-1-git-send-email-jayen@cse.unsw.edu.au>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libQGLViewer: New program
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
X-List-Received-Date: Sat, 27 Nov 2010 10:21:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-11-10 01:13, Jayen Ashar wrote:
> * Starting with libQGLViewer 2.3.8
> * libqglviewer (also known as libQGLViewer) is a free C++ library based on
> *  Qt that enables the quick creation of OpenGL 3D viewers. It features a
> *  powerful camera trackball and simple applications simply require an
> *  implementation of the draw() function. It is a tool of choice for OpenGL
> *  beginners and assignements. It provides screenshot saving, mouse
> *  manipulated frames, stereo display, interpolated keyFrames, object
> *  selection, and much more. It is fully customizable and easy to extend to
> *  create complex applications, with a possible Qt GUI.
> 
> Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>


> +SECTION = "libdevel"

AFAIK that's not an existing section

> +PRIORITY = "optional"

Default, remove

> +LICENSE = "GPL"

Which gpl version?

> +DEPENDS = ""

Default, remove.

Apart from the minor things above, it looks pretty good.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM8NrdMkyGM64RGpERAlGCAKCSjoqdcyTfH9aB9ntt2V0ysnW4dACgn2kB
VAngXLW0dukxNtecFZ0oFeY=
=oivl
-----END PGP SIGNATURE-----




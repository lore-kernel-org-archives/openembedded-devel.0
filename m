Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 336D16E81B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 12:53:30 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WVgTx-0000To-Ph for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2014 14:10:57 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 14:10:57 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 14:10:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 02 Apr 2014 13:41:48 +0200
Message-ID: <lhgt1t$sfb$1@ger.gmane.org>
References: <1396388953-25506-1-git-send-email-stephen.arnold42@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <1396388953-25506-1-git-send-email-stephen.arnold42@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [oe-core][PATCH] added upstream license files for gd and gnuplot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Apr 2014 12:53:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stephen Arnold schreef op 01-04-14 23:49:

> Subject: [PATCH] added upstream license files for gd and gnuplot

The general rule is that the first line says what the patch does, not what
you did, so:

[PATCH] Add upstream license files for gd and gnuplot

would be better, but another rule is to prefix the area of interest:

[PATCH] Common-licenses: add upstream license files for gd and gnuplot



> Fixes QA warnings about missing license files and supports gnuplot recipe
>  change in license classification.
> 
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> 
> --- meta/files/common-licenses/GD      | 53
> ++++++++++++++++++++++++++++++++++++++ meta/files/common-licenses/gnuplot
> | 29 +++++++++++++++++++++ 2 files changed, 82 insertions(+) create mode
> 100644 meta/files/common-licenses/GD create mode 100644
> meta/files/common-licenses/gnuplot
> 
> diff --git a/meta/files/common-licenses/GD
> b/meta/files/common-licenses/GD new file mode 100644 index
> 0000000..5e17d03 --- /dev/null +++ b/meta/files/common-licenses/GD @@
> -0,0 +1,53 @@ + +     Portions copyright 1994, 1995, 1996, 1997, 1998,
> 1999, 2000, 2001, +     2002 by Cold Spring Harbor Laboratory. Funded
> under Grant +     P41-RR02188 by the National Institutes of Health. + +
> Portions copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002 by +
> Boutell.Com, Inc. + +     Portions relating to GD2 format copyright 1999,
> 2000, 2001, 2002 +     Philip Warner. + +     Portions relating to PNG
> copyright 1999, 2000, 2001, 2002 Greg +     Roelofs. + +     Portions
> relating to gdttf.c copyright 1999, 2000, 2001, 2002 John +     Ellson
> (ellson@lucent.com). + +     Portions relating to gdft.c copyright 2001,
> 2002 John Ellson +     (ellson@lucent.com). + +     Portions copyright
> 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 +		 Pierre-Alain Joye
> (pierre@libgd.org). + +     Portions relating to JPEG and to color
> quantization copyright 2000, +     2001, 2002, Doug Becker and copyright
> (C) 1994, 1995, 1996, 1997, +     1998, 1999, 2000, 2001, 2002, Thomas G.
> Lane. This software is +     based in part on the work of the Independent
> JPEG Group. See the +     file README-JPEG.TXT for more information. + +
> Portions relating to WBMP copyright 2000, 2001, 2002 Maurice +
> Szmurlo and Johan Van den Brande. + +     Permission has been granted to
> copy, distribute and modify gd in +     any context without fee,
> including a commercial application, +     provided that this notice is
> present in user-accessible supporting +     documentation. + +     This
> does not affect your ownership of the derived work itself, and +     the
> intent is to assure proper credit for the authors of gd, not to +
> interfere with your productive use of gd. If you have questions, +
> ask. "Derived works" includes all programs that utilize the +
> library. Credit must be given in user-accessible documentation. + +
> This software is provided "AS IS." The copyright holders disclaim +
> all warranties, either express or implied, including but not +
> limited to implied warranties of merchantability and fitness for a +
> particular purpose, with respect to this code and accompanying +
> documentation. + +     Although their code does not appear in gd, the
> authors wish to thank +     David Koblas, David Rowley, and Hutchison
> Avenue Software Corporation +     for their prior contributions. + diff
> --git a/meta/files/common-licenses/gnuplot
> b/meta/files/common-licenses/gnuplot new file mode 100644 index
> 0000000..ff6fe23 --- /dev/null +++ b/meta/files/common-licenses/gnuplot 
> @@ -0,0 +1,29 @@ +/*[ + * Copyright 1986 - 1993, 1998, 2004   Thomas
> Williams, Colin Kelley + * + * Permission to use, copy, and distribute
> this software and its + * documentation for any purpose with or without
> fee is hereby granted, + * provided that the above copyright notice
> appear in all copies and + * that both that copyright notice and this
> permission notice appear + * in supporting documentation. + * + *
> Permission to modify the software is granted, but not the right to + *
> distribute the complete modified source code.  Modifications are to + *
> be distributed as patches to the released version.  Permission to + *
> distribute binaries produced by compiling modified sources is granted, +
> * provided you + *   1. distribute the corresponding source modifications
> from the + *    released version in the form of a patch file along with
> the binaries, + *   2. add special version identification to distinguish
> your version + *    in addition to the base release version number, + *
> 3. provide your name and address as the primary contact for the + *
> support of your modified version, and + *   4. retain our contact
> information in regard to use of the base + *    software. + * Permission
> to distribute the released version of the source code along + * with
> corresponding source modifications in the form of a patch file is + *
> granted with same provisions 2 through 4 for binary distributions. + * +
> * This software is provided "as is" without express or implied warranty +
> * to the extent permitted by applicable law. +]*/
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTO/d8MkyGM64RGpERAtZ9AJ4l4antJVdWXUhF7WmVRHcCdQcWLQCbBiOz
HKOfboYT/6mclZX90mCIQ70=
=iz3/
-----END PGP SIGNATURE-----



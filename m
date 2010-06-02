Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OJsKw-00068M-Rw
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 20:06:43 +0200
Received: by wwb34 with SMTP id 34so3891341wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Xa9vEqDYvvmUOyJKr75aaY0/wJG5O3a4D5+sx8S+ohY=;
	b=acK9NMc+reD4nV0nKkemYB4zElDAKiNNk1gi/N5IhlWJE8na+FXuibXLvI11hUnIWG
	6C4TPMaoHonZzr2B6uOVUOzfijiu2ybDfkD4lUF2FXEsX4oEJz4EtEaOXH74ZxsGkmyd
	TmWHwNQ2yoKWECKq404Ex4aia0EY7aBdmHnOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cclTDhjhA1yU4KSOj4fVS/BuWnMJD0VRj+eRdDKhJe1uW+8OXpX3Y46c2OUpQZpGHM
	0NDLexYg82xm1hECZ562+NjMjNSrgsU+6JLm2GXXCU3nWs9vny8BcVj0eFmllHH+CylY
	LIPzwgBPG/OZQIiZBzov14XbJCm+mG0eXfMs0=
MIME-Version: 1.0
Received: by 10.216.156.193 with SMTP id m43mr311170wek.11.1275501746995; Wed, 
	02 Jun 2010 11:02:26 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Wed, 2 Jun 2010 11:02:26 -0700 (PDT)
In-Reply-To: <AANLkTimPv-7u55qWP5du8HZIbYOGWA1s9yyNO1FSzVnC@mail.gmail.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
	<AANLkTilCZJoRhGKzBokT9TuZwbh0mzyzsBQ2J3NsIpwJ@mail.gmail.com>
	<AANLkTinUqQ16GPijhEAJof0uwAfrokQroib56xX2IutT@mail.gmail.com>
	<hu2a9n$bb5$1@dough.gmane.org>
	<AANLkTim75oyfx6Gt5W84j5G7x_zXAiEmK5vISeoTQSfZ@mail.gmail.com>
	<AANLkTimPv-7u55qWP5du8HZIbYOGWA1s9yyNO1FSzVnC@mail.gmail.com>
Date: Wed, 2 Jun 2010 14:02:26 -0400
Message-ID: <AANLkTikRaCCCyoKTUnk3h_0--TFqmolYQXU_j-vwMK3x@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Wed, 02 Jun 2010 18:06:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 12:36 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

>> ERROR: Logfile of failure stored in:
>> /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-=
linux-gnueabi/autotools-demo-1.0-3-gd30ab94-r0/temp/log.staging_packager.25=
337
>> Log data follows:
>> | *** Error: CONTROL/control is missing field Source
>> | The Source field contain the URL's or filenames of the source code
>> and any patches
>> | used to build this package. =A0Either gnu-style tarballs or Debian
>> source packages
>> | are acceptable. =A0Relative filenames may be used if they are
>> distributed in the same
>> | directory as the .ipk file.
>> |
>> | ipkg-build: Please fix the above errors and try again.
>> | ERROR: Function staging_packager failed

This patch fixes this issue:

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bb=
class
index 83f3578..6413afb 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -374,7 +374,7 @@ staging_packager () {
        if [ "$srcuri" =3D=3D "" ]; then
                srcuri=3D"OpenEmbedded"
        fi
-       echo "Source: ${SRC_URI}"               >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
+       echo "Source: ${srcuri}"               >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control

        # Deal with libtool not supporting sysroots
        # Need to remove hardcoded paths and fix these when we install the

I'll post the patch in a separate email for review.

The control file in the ipk file then contains:
Package: autotools-demo
Version: 1.0-28-g3a96627-r0.5
Description: Version 1.0-28-g3a96627-r0 of package autotools-demo
Section: base
Priority: optional
Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
License: unknown
Architecture: armv5te
OE: autotools-demo
Homepage: unknown
Depends: libc6, libstdc++6, libgcc1
Source: /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/=
autotools-demo.bb

Which seems sane, but at some point it might be nice to be able to
specify a URI here without confusing bitbake.

Cliff



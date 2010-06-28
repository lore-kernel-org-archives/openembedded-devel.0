Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1OTD2h-0004qg-Vz
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 14:02:43 +0200
Received: by gyc15 with SMTP id 15so295759gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Ci8z120Cs2HIcTqgNaTa6LEQGOeBdcNa9p8VeFEfcio=;
	b=K6y/w138T/CD8nTK0xps/68r/lfYk9YgWoH9YmWY2A7+DjIEHWw77At6Nacp6/EE3j
	0qWHD62KLW1p1D1FRUlRsojd+43qi2h+Ha58Zd86gKOcnQNX6AtE2+2Ved6b8ZMZhMyH
	yksGiEvL0qGV80rlSlRYCJif3ri4+6tzXq63E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=l5yFJ+ze59rENBt9CLFv9nj7UMIO52I+l5171cIaaaggpySXrAPkMYMZEJfRxrHfsz
	wdTrGFVaEHPD/6X+DWOguElz9Hz59KJPM8nX7IbI/ZyeCSqix0uu93wPeCWCUmfGjoxC
	FN/iYe2qVSMZfYfL7/nv2hUG5xlJDXCLBeUwI=
MIME-Version: 1.0
Received: by 10.91.41.17 with SMTP id t17mr4217559agj.6.1277726265288; Mon, 28 
	Jun 2010 04:57:45 -0700 (PDT)
Received: by 10.90.34.8 with HTTP; Mon, 28 Jun 2010 04:57:45 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CFC9@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFC9@KCINPUNHJCMS01.kpit.com>
Date: Mon, 28 Jun 2010 17:27:45 +0530
Message-ID: <AANLkTikNwQB9fA1P26w0KdCRcgm6Y2TwpTnX6UUSsXS1@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cc1plus: error: unrecognized command line option "-mmmx"
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
X-List-Received-Date: Mon, 28 Jun 2010 12:02:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 28, 2010 at 16:50, Soumya R <Soumya.R@kpitcummins.com> wrote:

> Hi All,
>
>    I am using Ubuntu 10.4 LTS as a host machine and target is mipsel
> Au1300..
> I am building my own image.. when i run bitbake  -D avn-image i
> get the following error..
>
> This is the Qt for Embedded Linux Open Source Edition.
>
> You are licensed to use this software under the terms of
> the Lesser GNU General Public License (LGPL) versions 2.1.
> You are also licensed to use this software under the terms of
> the GNU General Public License (GPL) versions 3.
>
> Type '3' to view the GNU General Public License version 3.
> Type 'L' to view the Lesser GNU General Public License version 2.1.
> Type 'yes' to accept this license offer.
> Type 'no' to decline this license offer.
>
> Do you accept the terms of either license?
> floatmath auto-detection... ()
> compiling floatmath.cpp
> floatmath.cpp:44: warning: unused parameter 'argc'
> floatmath.cpp:44: warning: unused parameter 'argv'
> linking floatmath
> /home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tmp/cross/mipsel/lib/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/bin/ld:
> warning: libc.so, needed by
> /home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tmp/cross/mipsel/lib/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/lib/libgcc_s.so,
> not found (try using -rpath or -rpath-link)
> floatmath enabled.
> mmx auto-detection... ()
> compiling mmx.cpp
> cc1plus: error: unrecognized command line option "-mmmx"
> make: *** [mmx.o] Error 1
> mmx disabled.
> 3dnow auto-detection... ()
> compiling 3dnow.cpp
> cc1plus: error: unrecognized command line option "-m3dnow"
> make: *** [3dnow.o] Error 1
> 3dnow disabled.
> sse auto-detection... ()
> compiling sse.cpp
> cc1plus: error: unrecognized command line option "-msse"
> make: *** [sse.o] Error 1
> sse disabled.
> sse2 auto-detection... ()
> compiling sse2.cpp
> cc1plus: error: unrecognized command line option "-msse2"
> make: *** [sse2.o] Error 1
> sse2 disabled.
> libtiff auto-detection... ()
> compiling libtiff.cpp
> libtiff.cpp:42:20: error: tiffio.h: No such file or directory
> libtiff.cpp:50:6: error: #error "Required libtiff not found"
> libtiff.cpp: In function 'int main(int, char**)':
> libtiff.cpp:57: error: 'tdata_t' was not declared in this scope
> libtiff.cpp:57: error: expected `;' before 'buffer'
> libtiff.cpp:58: error: 'buffer' was not declared in this scope
> libtiff.cpp:58: error: '_TIFFfree' was not declared in this scope
> libtiff.cpp:62: error: 'TIFFReadRGBAImageOriented' was not declared in this
> scope
> make: *** [libtiff.o] Error 1
> libtiff disabled.
> libmng auto-detection... ()
> compiling libmng.cpp
> libmng.cpp:42:20: error: libmng.h: No such file or directory
> libmng.cpp:50:2: error: #error System libmng version is less than 1.0.9;
> using built-in version instead.
> libmng.cpp: In function 'int main(int, char**)':
> libmng.cpp:46: error: 'mng_handle' was not declared in this scope
> libmng.cpp:46: error: expected `;' before 'hMNG'
> libmng.cpp:47: error: 'hMNG' was not declared in this scope
> libmng.cpp:47: error: 'mng_cleanup' was not declared in this scope
> make: *** [libmng.o] Error 1
> libmng disabled.
> DB2 auto-detection... ()
> compiling db2.cpp
> db2.cpp:42:20: error: sqlcli.h: No such file or directory
> db2.cpp:43:21: error: sqlcli1.h: No such file or directory
> make: *** [db2.o] Error 1
> DB2 disabled.
> MySQL (thread-safe) auto-detection... ()
> compiling ../mysql/mysql.cpp
> ../mysql/mysql.cpp:42:19: error: mysql.h: No such file or directory
> make: *** [mysql.o] Error 1
> MySQL (thread-safe) disabled.
> MySQL (thread-unsafe) auto-detection... ()
> compiling mysql.cpp
> mysql.cpp:42:19: error: mysql.h: No such file or directory
> make: *** [mysql.o] Error 1
> MySQL (thread-unsafe) disabled.
> MySQL support cannot be enabled due to functionality tests!
>  Turn on verbose messaging (-v) to ./configure to see the final report.
>  If you believe this message is in error you may use the continue
>  switch (-continue) to ./configure to continue.
>
> Thanks in advance:-)
>
> Regards,
> Soumya
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

It is somehow trying to build for an amd machine, mmx is a part of 586 and
3dnow is a part of amd k6 instruction sets.  You need to specify the machine
type to mips somewhere.


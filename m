Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1OCHj2-0000kr-VO
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 21:36:13 +0200
Received: by vws5 with SMTP id 5so423037vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/R+sXUa3XRTgTjolMxUADfkLIUcHS4cF+JjJCNERSFE=;
	b=LdWPZOoLF6LB3a5H8sT/jB5OczH28g8lBEs6PiCO/IHNhz7SnSXCTNZcGBbDiZryK0
	MSCvmmZgt+TIk82IKZxcidJt3N22KAwYjiV4p88EGkX1cPSC1yp4sZ9OH5RQctH4M4Dc
	fm9wcInJY0zAJ16MgAGEi7BoC1+uw8Jk7wsyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LyMPgj7xbUggotTSXSGw38/sLdl/fmnKwpeA5DIgfJ2HYlecnhSGLDOS0x95x/L24o
	FEHBI0+8t5DQPjIpmSP2rDMVEIruAUrddMjX6cWL4UQwC0BkPc+0LeooPfOmxoI7Wphs
	OPcnhz2luYuh17ZO4luwThIB5wGcjNush6zDk=
MIME-Version: 1.0
Received: by 10.229.230.206 with SMTP id jn14mr800611qcb.176.1273692737492; 
	Wed, 12 May 2010 12:32:17 -0700 (PDT)
Received: by 10.229.83.210 with HTTP; Wed, 12 May 2010 12:32:17 -0700 (PDT)
In-Reply-To: <AANLkTimpzBaBXWOHxgI3ubEb_koVlkRX9ACz1B2qpcX3@mail.gmail.com>
References: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
	<AANLkTimpzBaBXWOHxgI3ubEb_koVlkRX9ACz1B2qpcX3@mail.gmail.com>
Date: Wed, 12 May 2010 12:32:17 -0700
Message-ID: <AANLkTilJgxGAujUiOrTGfCVOLt5uOu2Sy3sRGOe7E1S7@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eet: CROSS COMPILE Badness on x86_64 build machine
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
X-List-Received-Date: Wed, 12 May 2010 19:36:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2010 at 12:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 12, 2010 at 11:08 AM, Steve Sakoman <sakoman@gmail.com> wrote=
:
>> Building from recent pull of oe.dev (yesterday)
>>
>> Anyone else seeing this?
>
> post the logs =A0somewhere

Will this work?

http://www.sakoman.net:8000/packages/31664/

Steve



> -Khem
>
>>
>> Steve
>>
>>
>> ERROR: function do_compile failed
>> ERROR: log data follows
>> (/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/temp/log.do_compile.29091)
>> | NOTE: make -j 4
>> | make =A0all-recursive
>> | make[1]: Entering directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet'
>> | Making all in src
>> | make[2]: Entering directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src'
>> | Making all in lib
>> | make[3]: Entering directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src/lib'
>> | =A0 CC =A0 =A0 libeet_la-eet_lib.lo
>> | =A0 CC =A0 =A0 libeet_la-eet_data.lo
>> | =A0 CC =A0 =A0 libeet_la-eet_image.lo
>> | =A0 CC =A0 =A0 libeet_la-eet_cipher.lo
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-=
0
>> | cc1: internal compiler error: in add_path, at c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for instructions.
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-=
0
>> | cc1: internal compiler error: in add_path, at c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for instructions.
>> | make[3]: *** [libeet_la-eet_image.lo] Error 1
>> | make[3]: *** Waiting for unfinished jobs....
>> | make[3]: *** [libeet_la-eet_data.lo] Error 1
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-=
0
>> | cc1: internal compiler error: in add_path, at c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for instructions.
>> | make[3]: *** [libeet_la-eet_lib.lo] Error 1
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-=
0
>> | cc1: internal compiler error: in add_path, at c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for instructions.
>> | make[3]: *** [libeet_la-eet_cipher.lo] Error 1
>> | make[3]: Leaving directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src/lib'
>> | make[2]: *** [all-recursive] Error 1
>> | make[2]: Leaving directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet'
>> | make: *** [all] Error 2
>> | FATAL: oe_runmake failed
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



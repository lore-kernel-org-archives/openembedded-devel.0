Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MlpqX-0000lp-JJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 22:02:24 +0200
Received: by bwz6 with SMTP id 6so323985bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=tujIK+UCXSrJ7j6rmorDoU7DNv3R0kGJDEOAEm4wn/g=;
	b=ZEfQKglJdKs25eEzpSjRnLLxLCFn2WNnG0MxfboB+75q93nd1smDJwcAxYUWZD5AaF
	nFFO2C4ZYwBpu6BtuOpH0rq0vubsvuDcQV7L5pM0lCMbb/AdkklYmo6em0YH+0MDb8EG
	lrTMD4oUy41BlWoQSj2gOu+m9U0CdHr5zti5k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DMjFiRu58M+yfFkcIHmlNSc4hgWILplp4i0aEHVQ7PshaK3IEVxEJq/wph6769/b8y
	2uSCijDLmPXHnDxhUjNrVquaKXQEKLxuw/sDsMAZWQHI4JT6F63Xl4EI/jC3AnWbqs4j
	XrtFTFxVE7U2QsLWdopnaHN/l2iek39yfc7bA=
MIME-Version: 1.0
Received: by 10.204.141.21 with SMTP id k21mr1289728bku.124.1252612909886; 
	Thu, 10 Sep 2009 13:01:49 -0700 (PDT)
In-Reply-To: <91283b620909090550g380d2db6p54f47960ac9b92f4@mail.gmail.com>
References: <91283b620909090550g380d2db6p54f47960ac9b92f4@mail.gmail.com>
Date: Thu, 10 Sep 2009 21:01:49 +0100
Message-ID: <91283b620909101301m3dc8c87ay9f4147e8a6c173f8@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.210
X-SA-Exim-Mail-From: stuart68@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Cannot get additional Qt libraries to be included within my image
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
X-List-Received-Date: Thu, 10 Sep 2009 20:02:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

More information


NOTE: Running task 2663 of 3643 (ID: 117, /home/stuart/overo-oe/org.
openembedded.dev/recipes/x-load/x-load_git.bb, do_compile)
NOTE: Running task 2664 of 3643 (ID: 718,
/home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
do_populate_staging)
NOTE: Running task 2665 of 3643 (ID: 720,
/home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
do_package)
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/accessible/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/codecs/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/graphicssystems/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/inputmethods/
NOTE: The path does not
exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/styles/
NOTE: Running task 2666 of 3643 (ID: 118,
/home/stuart/overo-oe/org.openembedded.dev/recipes/x-load/x-load_git.bb,
do_install)
NOTE: Running task 2673 of 3643 (ID: 9,
/home/stuart/overo-oe/user.collection/recipes/images/omap3-console-image.bb,
do_populate_staging)



Are the above references to qtopia correct? Should this not be Qt4??????


Thanks,
Stuart
2009/9/9 Stuart Gray <stuart68@gmail.com>

> Hi,
>
> I am trying to build an image that includes gstreamer, gst-plugin-good/bad
> and ugly, phonon, Qt4 Embedded and sqlite3.
>
> Now, I am new to all of this, Linux and OE, btu I have been making good
> progress and have a system up and running, but, I cannot get Qt to include
> libraries like libphonon_gstreamer.
>
> I have tried to change qt4-embedded.inc to add to the QT_CONFIG_FLAGS.
> Please see attached. No other Qt file shave been altered.
>
> I have also attached the file I use to compile our own code which is
> written within Qt.
>
> I am using org.embedded.dev, overo branch.
>
> I have changed the standard omap3-console-image file which is also
> attached.
>
> If you could provide any pointers to an answer that would be great.
>
> Thanks,
>  Stuart
>


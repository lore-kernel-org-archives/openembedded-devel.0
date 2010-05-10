Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>) id 1OBTKl-0006Cj-4P
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 15:47:48 +0200
Received: by qyk33 with SMTP id 33so6260128qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=2xccYZSFCPoAKm4cIk0433X4AZXlVXNadEZ46o4swno=;
	b=Brd2oZlgGHF92j9e0fwZUQEiWIN3qEryieHasM4h1SnfGU1lATpADuejK/nuf7CaQV
	QpXzE7YaolyE88GQYzcqcOMJtfuA6rxvzEULtX1unAUkyeIL619yzmzydsnn79qyIvbL
	Go/s+OytrkgvfuxodJUBDPPhh2SN0pB4Tk8Ho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=SeooVynYdezPF3OOIwqNQCmjdlKcYb1xOD5QCshKSgbz8N+qg2xJloVAB8rRXQ+N0h
	/yvGU6YNey/ya/wBPR3EwL1U7oOW8ewpuJXQPfExzPpBpPqSTIQJwYEtxMfvJSgOq+TV
	GSAU+nrZ1So/VXIlz6vYhNH7q8Moevdtn+Vd4=
Received: by 10.229.222.144 with SMTP id ig16mr3239837qcb.74.1273499028402; 
	Mon, 10 May 2010 06:43:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.124.11 with HTTP; Mon, 10 May 2010 06:43:28 -0700 (PDT)
In-Reply-To: <AANLkTinNs0RXIqA8annkPWKiGKUAD8yWnlKiAZiT-g0A@mail.gmail.com>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com> 
	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com> 
	<4BD84B08.4000300@eukrea.com>
	<g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>
	<4BDFC996.5060606@eukrea.com>
	<AANLkTik56w90iywd5ZmzV_geM0ULabHWVCuJIfxzHY7u@mail.gmail.com> 
	<4BE29322.7060205@eukrea.com>
	<AANLkTimCrYrjKuREPyUgYQwxlWdAN_OjF5ECiRBLj6Pp@mail.gmail.com> 
	<hru8nc$d5l$1@dough.gmane.org>
	<AANLkTinNs0RXIqA8annkPWKiGKUAD8yWnlKiAZiT-g0A@mail.gmail.com>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Mon, 10 May 2010 19:13:28 +0530
Message-ID: <AANLkTimd60OIu7Qfs2KXn-3iCM1n8z2upsbnJqit00Y7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Mon, 10 May 2010 13:47:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 7, 2010 at 7:31 PM, Abhishek Sharma
<spyzer.abhishek0@gmail.com>wrote:

>
>
> On Thu, May 6, 2010 at 4:51 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 06-05-10 12:55, Abhishek Sharma wrote:
>>
>> > About the /dev node, there is no such device as /dev/input/touchscreen0,
>> is
>> > it because i am only doing a base-image kind of install???
>> > i set the environment variable which was specified, but no progress.
>>
>> If you use udev, it will get created for you.
>>
>> regards,
>>
>> Koen
>>
>>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFL4qYsMkyGM64RGpERAszCAJ9tRRJelQyLDkozlVtBHdgyobx/HQCgs0NP
>> mB316e3HZG2RsEoAcQEwJrI=
>> =4Mnu
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
> Thanks all, the touchscreen device was /dev/event1 and the moment I did ->
> export QWS_MOUSE_PROTO="Tslib:/dev/event1" and ran the app, it got going.
> I am very grateful to you all for the help.
> :)
> --
> Abhishek Sharma
>

Hi all.
This was my_customized_image.bb :

   1. require base-image.bb
   2. IMAGE_INSTALL += "qtehelloworld"
   3. IMAGE_INSTALL += "qt4-embedded-fonts"
   4. IMAGE_INSTALL += "qt4-embedded-plugin-mousedriver-tslib"
   5. IMAGE_BASENAME = "qtehelloworld"
   6. RDEPENDS += "qte"
   7. inherit image


Now this one has a size of 64 Mb. I used base-image as a requirement to
install the basic utilities and since I had to run a qt embedded based app
on the machine I also had to include the qte runtime dependencies. Is there
any way so that the image size can be reduced??

Thanks.
-- 
Abhishek Sharma


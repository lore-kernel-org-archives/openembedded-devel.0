Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnaXh-00071S-1L
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 19:11:03 +0200
Received: by pvg6 with SMTP id 6so2404504pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=76ayYUjcqsqQ+cFqctWlvmddhF+tCDaxvTCDOU822MI=;
	b=yDUoiseCPHFNEv8l4gQyjZOioHqQllnYWOGpxPR3tkMuqO4ayjVCnjPHuOjUuOsXuZ
	w5vLhzlquJI86B5ziVurZghegUXrbxr4J3JjdffMysaklquLSKetSUEESwgFl3CQpRJH
	0ix4efROrnaUZp0IeGODmkwkBPZJjos+uqtYA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=pjwVUpBHjhRk3SZA21IOoxYPiT1BRWuiKRbyvdjdu78IZM9PW8ZWC3dHsQp1w7lunz
	EhzosKL0XFuV2JdRKQj67wWyRVRufzPIqPYlMX7LOVwvV0BQtGEDhUnJwTWWwwlEDTz6
	WuXFV3GZzX0bORNgsIpgDzIfRSuUGwbrmYoWM=
Received: by 10.114.39.16 with SMTP id m16mr6300581wam.119.1282583397237; Mon,
	23 Aug 2010 10:09:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Mon, 23 Aug 2010 10:09:36 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4379@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4379@deimsg40.de.net.world>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Aug 2010 10:09:36 -0700
Message-ID: <AANLkTinrm0Mo+GSZfK5XiY6gNq_Pep8nHUeBBw_BA1bz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: new recipe for obexpushd
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
X-List-Received-Date: Mon, 23 Aug 2010 17:11:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 23, 2010 at 5:55 AM, Hauser, Wolfgang (external)
<Wolfgang.Hauser.external@eads.com> wrote:
> Hello, we needed the package obexpushd (from debian) for our system.
>
> I've created a recipe for that package. If there is any interest, I can
> provide this package.

I think if you provide it upstream then you can avoid some maintenance
on it but not all. in general its
good practice to provide new recipes here. Well written ones get
merged pretty fast.

>
> I load the original source package from debian package server. Is that
> the proper way to get the sources ?

debian servers are ok we have many recipes getting sources from debian mirrors.

> It may be possible to get the package from the authors server, I
> suppose, the debian server is the reliable one.

as long as you get reliable tar file its ok.

>
> Your suggests ?
>
> Wolfgang Hauser
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



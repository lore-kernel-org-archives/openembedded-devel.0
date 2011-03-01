Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>) id 1PuG7B-0000pR-Oi
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 04:19:09 +0100
Received: by fxm8 with SMTP id 8so4218318fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 19:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=oK1qaNDEBQ+LNT2jbCgGOwehUpru4js8urFojLFJILk=;
	b=IZK/+vGSb/qGotQPoZQoZ49DoZuU0LvIkZmXFZWt8+nZyd7ilPHdsjEnpeEv4Hm0iI
	Q3oUEruRVXqin1Yi/e7cBRfAeAw7ym23rZKs3QBAVrA0yErLr3YBuEcSfEBtGeF3dOxT
	gD/H2QA+sNOOSbDRPnFOloB5B3DTq2iUjrpSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=UwcljSRYWMKknHvFXIOXPLiOev4q2o++OGild+iLaLgLOVJUKCK7jtXtc1vMJXusH1
	HplN3qlexH6JQ/b3MKoM2nKKeQuRhXEFCUYP/cki43l47iOcaQTUXGJJHsXFXQkQpAxF
	chdXusTE899o+UdMDBInSrekfC5i7uGsZDEG0=
MIME-Version: 1.0
Received: by 10.223.83.8 with SMTP id d8mr7459325fal.94.1298949463448; Mon, 28
	Feb 2011 19:17:43 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.223.108.194 with HTTP; Mon, 28 Feb 2011 19:17:43 -0800 (PST)
In-Reply-To: <ik7sp2$9g$2@dough.gmane.org>
References: <20110224231001.GC11390@denix.org>
	<ik7sp2$9g$2@dough.gmane.org>
Date: Mon, 28 Feb 2011 19:17:43 -0800
X-Google-Sender-Auth: 8jNTgJ-t7H_LfuTrTrHnczni8V0
Message-ID: <AANLkTincPsSAJ11+Avg1mjurqzt28V5ZOtijrVYHqmA7@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: US OEDEM/OEDAM in April?
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
X-List-Received-Date: Tue, 01 Mar 2011 03:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all - I have asked the Linux Foundation if there is a conference room
available over the weekend between Collab and ELC in case a OEDAM happens.
 I'll report back when I hear a response.

The Yocto BoF that is planned for ELC could also be a Yocto/ELC BoF although
it would not be a working meeting.

On Fri, Feb 25, 2011 at 1:29 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-02-11 00:10, Denys Dmytriyenko wrote:
> > All,
> >
> > We had previously discussed the possibility of holding US-based OEDEM (or
> is
> > it called OEDAM then?) in addition to our regular Fall OEDEM in Europe.
> Is
> > there still any interest in this?
> >
> > There is Embedded Linux Conference in San Francisco coming up in April,
> along
> > with few other Linux Foundation sponsored or organized events right
> before or
> > right after ELC. As some of the OE developers are planning on coming to
> ELC,
> > should we try to schedule a day or two for OEDEM and try to resolve some
> of
> > the pending organizational and technical issues face to face?
>
> The TSC is trying to plan a meetup around Collab/ELC, so a OEDAM would
> be good to have as well.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNZ3ZiMkyGM64RGpERAs2HAKCXZnqyUEHDM+WOcObi1pX8RiOE6ACfQwZa
> 3LHdOKIpzeru6xnKFaTaa38=
> =KDoC
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Jeff Osier-Mixon
Yocto Community Manager @Intel


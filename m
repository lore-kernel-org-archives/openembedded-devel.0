Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUXJR-0001WQ-3I
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 05:53:13 +0200
Received: by iwn34 with SMTP id 34so2827648iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 20:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=1pDIkI60hpFEH5WVuu7qU3CAd8He1B5BzWEEnp6ygmE=;
	b=Kn6FN7LEXYUpjN5pWtEyVCNtJBvz7KtxzNdbohCbASC+GirFKloT7Yi7DVbqnbSCHK
	HBJurAXkiHnluwxTzKVFr/r5PImMj00w4aSjAWiXiDSXnNhc1Qfmahw1sGjV4cs4iDmj
	8ypw0Ry0Qz6BcCtCvld+MDV/T5HZNhJ3MAtbQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=HZNxD8tkilF4w7qkT5GYEtjeZZOMy3TW/elAub7kbjMpiM/4T1uLheAVnaTg8kF+gY
	czaypQF0lJ3ve461ksM/O6XcaY4hr3gT7V7ZSkXCoLI6GGJPgxoMSlvQSJwJ4eEyFcGk
	+qO4q2iBi8NpvTGlJ/JMc8zofBqAs8h91FI8c=
Received: by 10.231.160.205 with SMTP id o13mr140126ibx.111.1278042509191; 
	Thu, 01 Jul 2010 20:48:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 20:48:08 -0700 (PDT)
In-Reply-To: <59209027-3666-426D-9085-D9F6647B07D5@keylevel.com>
References: <59209027-3666-426D-9085-D9F6647B07D5@keylevel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 20:48:08 -0700
Message-ID: <AANLkTin42ODhDbRm0CBbFVT5DtFJVCyTqfg1f0VakNEb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'Generic' x86 build
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
X-List-Received-Date: Fri, 02 Jul 2010 03:53:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 1, 2010 at 3:17 PM, Chris Tapp <dokuwiki@keylevel.com> wrote:
> I've spent the past couple of weeks trying to get a build that will work on
> generic pc hardware (board is alix, but 'regular' linux distros run ok), but
> I've not found a combination that builds and then runs correctly.
>
> Can anyone point me in the direction of a distro/machine pair that should
> give me this?

how about MACHINE=i686-generic or MACHINE=i586-generic
distro could be angstrom or minimal.

-khem



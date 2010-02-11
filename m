Received: from mail-yx0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nfgj9-00046p-IW
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 22:37:39 +0100
Received: by yxe8 with SMTP id 8so1697914yxe.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 13:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=RfI9rxDf5bAO5iK1xrmv3d+qbHjZNdD120HPRCYrJPQ=;
	b=FkZyunTtwqkKaCk1pYFt2ZYXEpxy00TJKbOo47LzBWrnGtTX/gZrojwuwg0AnafXEd
	/yUkaDEFJlF0Pus9BHNpauPFIaK9HX0CenRquVL9NLts8OdkF78aGTWVzM/5epKyLmmI
	YOALNkQ7No4llqR1ftAJEH91fPezny9FqAgxM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Z4Basz4lbF99CYtLW2J14TqWP62MNQPKBzW9dBmgczuQQvyis+XqWnyPzHxuYA631O
	BPxNAEb3U6MMXy4luKfBoajB3lp1qKOgvYPJvolRN3mcDdWRauCVEYoVRfvJM2Jtet32
	CvdjXFPB+hICq7ks2D37UnfBtGhT8hLmNLYv8=
MIME-Version: 1.0
Received: by 10.101.132.8 with SMTP id j8mr820788ann.44.1265924098585; Thu, 11 
	Feb 2010 13:34:58 -0800 (PST)
In-Reply-To: <b8e1ecc81002111128p36334dbct630b611cc455ded8@mail.gmail.com>
References: <b8e1ecc81002111128p36334dbct630b611cc455ded8@mail.gmail.com>
Date: Thu, 11 Feb 2010 22:34:58 +0100
Message-ID: <ac9c93b11002111334p74c1c90bpbc0bd90d63078deb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Fix URI perl-native
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
X-List-Received-Date: Thu, 11 Feb 2010 21:37:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/11 Marcos Amorim <marcosmamorim@gmail.com>:
> Set new URI to perl-native-5.8
>
>
> Marcos Amorim
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

Good find!
Patch applied.
thank you

FM.



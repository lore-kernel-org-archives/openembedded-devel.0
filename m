Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P34ki-0007V8-17
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 12:28:09 +0200
Received: by iwn2 with SMTP id 2so8102790iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oTJD17QcKUTp0yEldnZR+y77gRZZsGujLALrueJqDLs=;
	b=mY/IT+Sxzx26Ktt6vM/pSEBrpjPyPyRNphGpT2B4Z/xyTPOYyGQjw8wbWqrNVP0eRm
	beJPQpX9oaGVEecmpxaG/N3JhGfNSuUT1l2Uj2FCF8l5TMhaOmTmUzJtr2nlgMAifOYU
	wROD3dXeiOB5VMsLdUEwIYq7bELqTBoTJTvIM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=I1HAYfw66PU8krVF+Mu0dXk6cOKkI7MLVqKGGnFpp7QKSZRefZNs2CtP0/yFRcQS3h
	IaSBNr03n8N4tCrrfWa1d+9v3hJ7YqpF3eI25Tex27UV67IvnXHbYVTTI55JD/B62Mc3
	1JAkhqbvAVkFfZrzFE6YpuMmnG1HZFkYoAjtI=
MIME-Version: 1.0
Received: by 10.231.30.134 with SMTP id u6mr11815655ibc.121.1286274469567;
	Tue, 05 Oct 2010 03:27:49 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 5 Oct 2010 03:27:49 -0700 (PDT)
In-Reply-To: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
Date: Tue, 5 Oct 2010 12:27:49 +0200
Message-ID: <AANLkTinpEEdA7k87fa2nPXGtav6URN+R6itO6UE4gtGk@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Tue, 05 Oct 2010 10:28:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/4 Cliff Brake <cliff.brake@gmail.com>:
> Testing run from last week:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-09-27
>
> testing-next is updated and ready for clean builds:
> http://wiki.openembedded.net/index.php/Testing
>
> Thanks,
> Cliff
>
> --

For me this version fails on native sqlite3_3.6.23.1.bb, do_compile
see e.g. testing_2010-1004: fails on native sqlite3_3.6.23.1.bb, do_compile
See also http://tinderbox.openembedded.net/public/logs/task/8402014.txt

this fails both minimal/console-image as well as slugos/slugos-image

Frans



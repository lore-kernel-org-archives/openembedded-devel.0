Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIjdR-00044D-Lb
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 16:09:22 +0100
Received: by iwn9 with SMTP id 9so101380iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=c1RRLOM+AucOmt2L63P5+Ut8grJMFwoBEfUE9hoRkMc=;
	b=j69eEADbUryXbW0VXqCSLpHxI2bLYwDWvPBEWoKNFiVtNYrzmFqxY6gdjRvn1PQyqR
	s1BDLS7zzoy4oZu6BnTzpUNOMdvRA5pB4Lvx3AC1+6moZkKMRYxXJP0aJBvVQa80nCP1
	aGB2eg3jPIyxhDCM25sSA05xYpYxyOMAgY2xs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=j9Hkxi2SvxRVWKYw5weLTFNPiv4IfkKmIZR4uQ6pKT0IXz/SwwzXkTTdd4TRvPRxaf
	qxsPGMPm3IXk3+wZ5SFQZUsEaWfKnZxU8F8ZXz5lfh02osWnO+UiJoiv8AcyBexPqtOW
	APm6RKRo3kMfsd6difDd05LVQe97h9GumiJqs=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr7096770ibe.101.1290006494421; Wed,
	17 Nov 2010 07:08:14 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Wed, 17 Nov 2010 07:08:14 -0800 (PST)
In-Reply-To: <4CE3E4F6.9000602@home.nl>
References: <1290002290-9233-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4CE3E4F6.9000602@home.nl>
Date: Wed, 17 Nov 2010 16:08:14 +0100
Message-ID: <AANLkTimHTM1FK4_dSWpe6JHvyQNFVzx5h3JdCQgw0g-V@mail.gmail.com>
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
Subject: Re: [PATCH v2] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Wed, 17 Nov 2010 15:09:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/17 Walter Goossens <waltergoossens@home.nl>:
> I just noticed my test build halted on that exact error...
> I'll ack this one :)

it is pushed :-)

Thanks for your acks.
I'm building console-image for nios as part of the testing branch.
Seems there is also yet another issue left in the toolchain, but
haven't had time to dig into that one.

Frans



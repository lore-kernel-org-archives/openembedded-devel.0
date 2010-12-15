Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PSm3N-0001h6-SH
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 08:45:38 +0100
Received: by iwn8 with SMTP id 8so1839151iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=YOLr3v9oRNaq4/C+axVXla+iKs9pFMhlqR7ZimUDB2c=;
	b=UL8lUQswSE5iNXDxXPGSjL43pvsXWFO7XO+TmFIUXBcFvyCaVVBmJoNnyzCNUYSbJV
	AptOyi6Wje/9rSdVuHK9tLc3pSG+a6JQzC5sRG1tAJQS75WD4D7q7zJHuwEqtpJxMa9y
	JeMrCtmcwTvQvh+NHEcvc9azZNtHrznyjEwZQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=a/wcARuF6K9Psud/umlI7V04UXJ6baWxos6hVhM5+MSZ5vq8KLJdJiKicXFGSyztfv
	TkboD/BGrFfMT+AI4OkzqKhnj0b9umlVvnmX7f1mi3ckDZPwq0ml6d4RycAZ/Mv8/808
	93FGdGFzHyTWc6bmKXgku8/cEob951a3SZ5qA=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr4546464ibc.7.1292399041781; Tue, 14
	Dec 2010 23:44:01 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 14 Dec 2010 23:44:01 -0800 (PST)
Date: Wed, 15 Dec 2010 08:44:01 +0100
Message-ID: <AANLkTik94Y+YrBAhFsbj8TRhNgbEuY0GWfHKxmuHx_iG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: wiki issue
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
X-List-Received-Date: Wed, 15 Dec 2010 07:45:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I tried to update the wiki with my testing results but failed miserably.

After logging in and making my changes I get:

Internal error
From Openembedded
Jump to: navigation, search

Set $wgShowExceptionDetails = true; at the bottom of LocalSettings.php
to show detailed debugging information.

Resubmitting did not help.
Can one of our wiki/php wizards look into this?

Frans.



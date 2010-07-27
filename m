Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Odafn-00011G-BY
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 05:17:45 +0200
Received: by qwg8 with SMTP id 8so579393qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=4XHTSA0588JJ//3Gj7knPwrWy4Dthb09uIcrYVI/I08=;
	b=FfhIkz0D2kyCK27w4033no4bmEATya6EcGjNtzsZtSszZZVYGSh+uoz4/OG+ectqJZ
	RFCFI6Yt77ph3uksCN4alnCsSlJYAOqOBuWj2mXjxaNr7SGy55xmRYE4w5F8Eaw/ulXM
	wCLDmzZwHt3Iyg1oMCgYEyTCrJa5hKL0A+Sb4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=aAyDiUne5sPl0kQVpO20Ed9NhZKd4diOSP7NCGB9T802mInpu8LoLfz2BiFzLS1W8y
	hu52WBefCi7nafb6EGIsxX8bCJ6p5MOznAXr4JY5k3+BcUeDtUdYuiNYKLmfjBRXzVTU
	YGbA290ek7TmgIJIJkTI1nJwhmSrsXAgd49fA=
Received: by 10.224.2.147 with SMTP id 19mr7019878qaj.9.1280200646169; Mon, 26 
	Jul 2010 20:17:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.236.80 with HTTP; Mon, 26 Jul 2010 20:17:06 -0700 (PDT)
In-Reply-To: <4C4E4DB2.9090606@mlbassoc.com>
References: <4C4E4DB2.9090606@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 26 Jul 2010 20:17:06 -0700
X-Google-Sender-Auth: wQhuwO5FG_sfTkp7RCZScNUEC1g
Message-ID: <AANLkTikRqVrJ6uS9njZm9CWW8FkVJZyZ6MbbOQ=BQuCQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Checkin policy??
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
X-List-Received-Date: Tue, 27 Jul 2010 03:17:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 26, 2010 at 8:08 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> Surely, there must not be any or else simple compile errors wouldn't get
> through :-(
>

It's a trunk/master branch, shit happens, and it's not reasonable to test
every recipe for every target for each commit.  In addition, in this
particular case, it's highly unlikely a review would have caught this error
anyway.  Fix incoming.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


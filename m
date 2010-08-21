Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmhfL-0001ZR-BG
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 08:35:09 +0200
Received: by iwn2 with SMTP id 2so1086047iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 23:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=u2p8Ev87GBskW5qxqO6ZKw3XQJr9hldmHfhn4VtpybM=;
	b=uJiwfGgA7jC4/6AudRswVQZsZJF6vxrEMdsNlOXBqel1Q2i3bqpg5zbLkVNNvVINcn
	Bdnite3mVP70Csdig4CguDh7i+iHREA3YSaRG9nSfpvIye/OI1FB5ytV/CXzY1Og/S1U
	R/7iKZ7iImnw80H9IBb+m+ASimFFzjnk23S+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IJcclYjKm6g2IlQvjdOIZp+H3DZ0VKYx1gWKPQ22usNXGUIKACHkQslo7LrUmxx4Sn
	91C4dGMkB5EjsXQ9/f2iVr5aldwWKGOC0NA6r1iwPDtTW4duwD4bi7Ze4m4zzSgnPTza
	RYtO0R7HsReBQJaT3RgV280h6tVairI7x77cI=
MIME-Version: 1.0
Received: by 10.231.79.213 with SMTP id q21mr2769706ibk.137.1282372474737;
	Fri, 20 Aug 2010 23:34:34 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 20 Aug 2010 23:34:34 -0700 (PDT)
In-Reply-To: <1282368710-8302-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1282368710-8302-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Sat, 21 Aug 2010 08:34:34 +0200
Message-ID: <AANLkTimuXv0piFvQi-kpjj9fUsZU3E8sG=KOU8GKoLjS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc-4.4.*inc: removed FILESPATHPKG
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
X-List-Received-Date: Sat, 21 Aug 2010 06:35:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

without the INC_PR bump: acked by Khem on irc.
removed the bump, retested , added the ack and pushed.

Frans


